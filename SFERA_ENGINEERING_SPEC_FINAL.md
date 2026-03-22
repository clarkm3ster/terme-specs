# ============================================================
# SFERA PLATFORM — COMPLETE ENGINEERING SPECIFICATION
# ============================================================
# Target: gstack / Paperclip Engineering Team
# Version: 1.0
# Date: 2026-03-21
# ============================================================
#
# SFERA is a spatial computing platform that turns physical
# spaces into programmable, bookable, monetizable venues for
# immersive experiences. It consists of:
#
#   1. A 4D addressing system (voxel-hours)
#   2. A spatial experience file format (.sfera)
#   3. Three applications (Registry, Studio, Consumer)
#
# Build order: Layer 1 → Layer 2 → .sfera spec → Consumer App
#              → Registry App → Studio App
# ============================================================


# ████████████████████████████████████████████████████████████
# LAYER 1: THE VOXEL-HOURS ENGINE
# ████████████████████████████████████████████████████████████
#
# File: voxel-hours.js (pure functions, NO database, NO server)
# This is the foundational primitive. An npm-publishable module.
# Two phones at the same location compute the same key
# independently — no central authority needed.
#
# It does exactly 7 things:

# ── 1. FLOOR SYSTEM ──────────────────────────────────────────
# Converts altitude to a discrete floor code and back.
# GPS altitude is garbage (±30m drift), so floor codes are
# SEMANTIC, not metric. The UI must always confirm with the user.
#
# Floor Code Dictionary:
#   B02  → Sub-basement
#   B01  → Basement
#   F00  → Ground (default)
#   F01  → Floor 1
#   F02  → Floor 2
#   F03  → Floor 3
#   R00  → Rooftop
#   SKY  → Sky / Open air above structures
#
# Functions:
#   altitudeToFloor(altitudeMeters) → string
#     Suggests a floor code from raw GPS altitude.
#     Uses 3.5m per floor as heuristic.
#     ALWAYS treat as a suggestion — UI must confirm.
#
#   floorToAltitude(floorCode) → number
#     Returns estimated center altitude for a floor.
#
#   floorLabel(floorCode) → string
#     Human-readable: "F02" → "Floor 2", "B01" → "Basement"
#
#   allFloorCodes() → string[]
#     Returns the full ordered list.

# ── 2. TEMPORAL PARCELING ────────────────────────────────────
# Truncates any Date to an ISO hour string and computes
# temporal layer (past/present/future).
#
# Functions:
#   toISOHour(date) → string
#     new Date("2026-03-21T14:37:00Z") → "2026-03-21T14"
#
#   temporalLayer(isoHour) → "past" | "present" | "future"
#     Compares to current hour in UTC.
#
#   hourRange(startDate, endDate) → string[]
#     Generates array of ISO hour strings for a lease window.
#     hourRange("2026-03-21T14", "2026-03-21T18")
#       → ["2026-03-21T14", "2026-03-21T15", "2026-03-21T16", "2026-03-21T17"]
#
#   CRITICAL: All temporal logic MUST use strict UTC.
#   Never use local timezone in voxel key generation.

# ── 3. SPATIAL ANCHOR + VOXEL KEY GENERATION ─────────────────
# This is the core invention. Two distinct identifiers:
#
# A) SPATIAL ANCHOR (3D — permanent)
#    Format: {h3Index}:{floorCode}:{resolution}
#    Example: "8c2a306d2d353ff:F00:12"
#    This is what Owners register. It persists forever.
#    It goes in the `spheres` table.
#
# B) VOXEL KEY (4D — ephemeral)
#    Format: {h3Index}:{floorCode}:{resolution}:{isoHour}
#    Example: "8c2a306d2d353ff:F00:12:2026-03-21T14"
#    This is the atomic unit of commerce.
#    It goes in `leases` and `bookings` tables.
#
# Functions:
#   generateAnchor(lat, lng, floorCode, resolution) → string
#     Pure math. Uses h3.latLngToCell(lat, lng, resolution).
#     Concatenates with floor code and resolution.
#
#   generateVoxelKey(lat, lng, floorCode, resolution, date) → string
#     Calls generateAnchor + appends toISOHour(date).
#
#   parseAnchor(anchor) → { h3Index, floorCode, resolution }
#   parseVoxelKey(key) → { h3Index, floorCode, resolution, isoHour }
#
#   anchorFromVoxelKey(voxelKey) → string
#     Strips the time component.
#
# CRITICAL DESIGN DECISION:
#   Ownership lives on the ANCHOR (3D, permanent).
#   Commerce lives on the VOXEL KEY (4D, ephemeral).
#   An Owner does NOT need to re-register every hour.
#   A lease references a range of voxel keys derived from one anchor.

# ── 4. SPATIAL QUERIES ───────────────────────────────────────
# Functions:
#   nearbyH3Cells(lat, lng, resolution, ringSize) → string[]
#     Returns H3 cell indices in a k-ring around the point.
#     Default ringSize = 1 (7 cells). Max useful = 3 (37 cells).
#
#   voxelStack(lat, lng, resolution) → string[]
#     All floor codes at one H3 cell. Returns array of anchors.
#     ["8c2a...F00:12", "8c2a...F01:12", "8c2a...R00:12"]
#
#   nearbyVoxelKeys(lat, lng, floorCode, resolution, date, ringSize) → string[]
#     Full 4D neighborhood: nearby cells × current hour.
#
#   nearbyAnchors(lat, lng, resolution, ringSize) → string[]
#     3D neighborhood without time (for Registry queries).

# ── 5. RESOLUTION HIERARCHY ─────────────────────────────────
# H3 resolutions used by SFERA:
#   Res 7  → Neighborhood (~5.2 km²) — city district view
#   Res 9  → Block (~0.1 km²) — street-level view
#   Res 10 → Building (~0.015 km²) — building footprint
#   Res 12 → Room (~3.2 m²) — DEFAULT for most SFERAs
#   Res 15 → Object (~0.9 m²) — single bench, barstool
#
# Functions:
#   voxelParent(anchor, parentResolution) → string
#     Zooms out. Uses h3.cellToParent.
#
#   voxelChildren(anchor, childResolution) → string[]
#     Zooms in. Uses h3.cellToChildren.
#
#   checkHierarchyCollision(newAnchor, existingAnchors) → CollisionResult
#     MUST be called before any registration/claim.
#     Checks if any existing anchor is a parent or child of the new one.
#     Returns: { collides: boolean, conflictingAnchor: string | null, relationship: "parent" | "child" | null }
#
#   COLLISION RULES:
#     - Micro always punches a hole in macro (Swiss Cheese Rule).
#     - If Owner A registered a block at Res 9, and User B tries
#       to register a stoop inside it at Res 12, the stoop is a
#       sub-lease of Owner A's block — not a new independent claim.
#     - If User B registered a stoop at Res 12 first, and Corp A
#       tries to register the whole block at Res 9, Corp A gets
#       the block MINUS the stoop.

# ── 6. PLACE TYPE DICTIONARY ────────────────────────────────
# Semantic layer mapping physical space types to default properties.
#
# Function:
#   getPlaceTypeDefaults(placeType) → PlaceTypeDefaults
#
# Dictionary (export as PLACE_TYPES constant):

PLACE_TYPES = {
  # Outdoor — Ground Level
  "sidewalk":          { "enclosure": "open",     "floor": "F00", "label": "Sidewalk",          "capacity": 4  },
  "stoop":             { "enclosure": "semi",     "floor": "F00", "label": "Stoop",              "capacity": 4  },
  "street_corner":     { "enclosure": "open",     "floor": "F00", "label": "Street Corner",      "capacity": 8  },
  "side_street":       { "enclosure": "open",     "floor": "F00", "label": "Side Street",        "capacity": 10 },
  "alley":             { "enclosure": "semi",     "floor": "F00", "label": "Alley",              "capacity": 8  },
  "crosswalk":         { "enclosure": "open",     "floor": "F00", "label": "Crosswalk",          "capacity": 6  },
  "loading_zone":      { "enclosure": "open",     "floor": "F00", "label": "Loading Zone",       "capacity": 10 },
  "parking_lot":       { "enclosure": "open",     "floor": "F00", "label": "Parking Lot",        "capacity": 20 },
  "bus_stop":          { "enclosure": "semi",     "floor": "F00", "label": "Bus Stop",           "capacity": 6  },
  "bike_lane":         { "enclosure": "open",     "floor": "F00", "label": "Bike Lane",          "capacity": 2  },
  "drop_off_zone":     { "enclosure": "open",     "floor": "F00", "label": "Drop-off Zone",      "capacity": 6  },

  # Outdoor — Green / Nature
  "plaza":             { "enclosure": "open",     "floor": "F00", "label": "Plaza",              "capacity": 50 },
  "pocket_plaza":      { "enclosure": "semi",     "floor": "F00", "label": "Pocket Plaza",       "capacity": 15 },
  "park_edge":         { "enclosure": "open",     "floor": "F00", "label": "Park Edge",          "capacity": 12 },
  "park_bench":        { "enclosure": "open",     "floor": "F00", "label": "Park Bench",         "capacity": 2  },
  "field_edge":        { "enclosure": "open",     "floor": "F00", "label": "Field Edge",         "capacity": 10 },
  "courtyard":         { "enclosure": "semi",     "floor": "F00", "label": "Courtyard",          "capacity": 20 },
  "garden":            { "enclosure": "semi",     "floor": "F00", "label": "Garden",             "capacity": 10 },
  "tree_line":         { "enclosure": "open",     "floor": "F00", "label": "Tree Line",          "capacity": 6  },
  "waterfront":        { "enclosure": "open",     "floor": "F00", "label": "Waterfront",         "capacity": 15 },
  "trail_segment":     { "enclosure": "open",     "floor": "F00", "label": "Trail Segment",      "capacity": 8  },

  # Outdoor — Elevated
  "rooftop":           { "enclosure": "open",     "floor": "R00", "label": "Rooftop",            "capacity": 15 },
  "balcony":           { "enclosure": "semi",     "floor": "F02", "label": "Balcony",            "capacity": 4  },
  "overlook":          { "enclosure": "open",     "floor": "R00", "label": "Overlook",           "capacity": 8  },
  "sky":               { "enclosure": "open",     "floor": "SKY", "label": "Sky",                "capacity": 0  },
  "drone_corridor":    { "enclosure": "open",     "floor": "SKY", "label": "Drone Corridor",     "capacity": 0  },

  # Building — Exterior
  "facade":            { "enclosure": "open",     "floor": "F00", "label": "Façade",             "capacity": 10 },
  "window_line":       { "enclosure": "open",     "floor": "F01", "label": "Window Line",        "capacity": 0  },
  "mural_wall":        { "enclosure": "open",     "floor": "F00", "label": "Mural Wall",         "capacity": 10 },
  "entrance":          { "enclosure": "semi",     "floor": "F00", "label": "Entrance",           "capacity": 8  },
  "church_step":       { "enclosure": "semi",     "floor": "F00", "label": "Church Step",        "capacity": 6  },
  "memorial_spot":     { "enclosure": "open",     "floor": "F00", "label": "Memorial Spot",      "capacity": 6  },

  # Building — Interior
  "room":              { "enclosure": "enclosed", "floor": "F00", "label": "Room",               "capacity": 12 },
  "bedroom":           { "enclosure": "enclosed", "floor": "F01", "label": "Bedroom",            "capacity": 4  },
  "living_room":       { "enclosure": "enclosed", "floor": "F00", "label": "Living Room",        "capacity": 8  },
  "hallway":           { "enclosure": "enclosed", "floor": "F00", "label": "Hallway",            "capacity": 4  },
  "stairwell":         { "enclosure": "enclosed", "floor": "F00", "label": "Stairwell",          "capacity": 4  },
  "lobby":             { "enclosure": "enclosed", "floor": "F00", "label": "Lobby",              "capacity": 20 },
  "cafe_interior":     { "enclosure": "enclosed", "floor": "F00", "label": "Café Interior",      "capacity": 15 },
  "backroom":          { "enclosure": "enclosed", "floor": "F00", "label": "Back Room",          "capacity": 8  },
  "studio":            { "enclosure": "enclosed", "floor": "F00", "label": "Studio",             "capacity": 10 },
  "classroom":         { "enclosure": "enclosed", "floor": "F00", "label": "Classroom",          "capacity": 25 },
  "clinic_room":       { "enclosure": "enclosed", "floor": "F00", "label": "Clinic Room",        "capacity": 4  },
  "waiting_area":      { "enclosure": "enclosed", "floor": "F00", "label": "Waiting Area",       "capacity": 10 },
  "elevator_cabin":    { "enclosure": "enclosed", "floor": "F00", "label": "Elevator Cabin",     "capacity": 6  },
  "windowless_room":   { "enclosure": "enclosed", "floor": "F00", "label": "Windowless Room",    "capacity": 8  },

  # Underground
  "basement":          { "enclosure": "enclosed", "floor": "B01", "label": "Basement",           "capacity": 12 },
  "sub_concourse":     { "enclosure": "enclosed", "floor": "B01", "label": "Sub-concourse",      "capacity": 30 },
  "underground_corridor": { "enclosure": "enclosed", "floor": "B01", "label": "Underground Corridor", "capacity": 8 },
  "garage":            { "enclosure": "enclosed", "floor": "B01", "label": "Garage",             "capacity": 10 },
  "tunnel":            { "enclosure": "enclosed", "floor": "B01", "label": "Tunnel",             "capacity": 8  },

  # Transit
  "station_platform":  { "enclosure": "semi",     "floor": "B01", "label": "Station Platform",   "capacity": 30 },
  "community_board":   { "enclosure": "open",     "floor": "F00", "label": "Community Board",    "capacity": 4  },
  "meeting_point":     { "enclosure": "open",     "floor": "F00", "label": "Meeting Point",      "capacity": 10 }
}

# ── 7. EXPORTS ───────────────────────────────────────────────
# voxel-hours.js must export ALL of the above as a clean ES module:
#
# export {
#   // Floor system
#   altitudeToFloor, floorToAltitude, floorLabel, allFloorCodes,
#   // Temporal
#   toISOHour, temporalLayer, hourRange,
#   // Key generation
#   generateAnchor, generateVoxelKey, parseAnchor, parseVoxelKey,
#   anchorFromVoxelKey,
#   // Spatial queries
#   nearbyH3Cells, voxelStack, nearbyVoxelKeys, nearbyAnchors,
#   // Resolution hierarchy
#   voxelParent, voxelChildren, checkHierarchyCollision,
#   // Place types
#   PLACE_TYPES, getPlaceTypeDefaults,
#   // Constants
#   FLOOR_CODES, RESOLUTIONS
# }
#
# Dependencies: h3-js (only external dependency)
# No database. No server. No side effects. Pure functions.
# Must work in Node.js AND in browser (via CDN/ESM).


# ████████████████████████████████████████████████████████████
# LAYER 2: THE SERVER
# ████████████████████████████████████████████████████████████
#
# File: server.js (Express + SQLite via better-sqlite3)
# This wires the voxel-hours engine to a persistent database.
#
# CRITICAL: Enable WAL mode on database init:
#   db.pragma("journal_mode = WAL");
# This allows concurrent reads during writes.
# ── REAL-TIME ENGINE (WEBSOCKETS) ────────────────────────────
# The server MUST instantiate a WebSocket server (using 'ws' library)
# on the same HTTP server as Express.
#
# Setup:
#   import { WebSocketServer } from 'ws';
#   const server = app.listen(3000);
#   const wss = new WebSocketServer({ server });
#
# Functionality:
#   1. ROOM SYSTEM: Users in the same spatial_anchor join a shared room.
#      On WebSocket connect, client sends: { type: "join", anchor: "8c2a..." }
#      Server adds the socket to a Map<anchor, Set<WebSocket>>.
#
#   2. CLOCK SYNC (for device_swarms):
#      Server broadcasts its monotonic clock every 200ms to room members:
#        { type: "clock", serverTime: Date.now() }
#      Each client computes offset = serverTime - clientTime.
#      All cue triggers fire on (Date.now() + offset), NOT local time.
#      Without this, device swarm wave patterns drift 50-200ms and look noisy.
#
#   3. DEVICE SYNC RELAY:
#      When the renderer fires a "device_sync" cue, it sends:
#        { type: "cue_fire", cueId: "...", fireAt: serverTime + delay }
#      Server relays to all room members. Each device fires at fireAt
#      adjusted by its local offset.
#
#   4. LIVE UPDATES:
#      When a design is deployed (Studio), broadcast to Consumer rooms:
#        { type: "experience_live", sphereId: ..., designId: ... }
#      When a booking is made, broadcast to relevant rooms:
#        { type: "booking_update", sphereId: ..., slotsRemaining: ... }
#
# Dependencies: Add 'ws' to package.json.
# This is the ONLY additional npm dependency beyond express, better-sqlite3, h3-js.


# ── DATABASE SCHEMA ──────────────────────────────────────────

# --- users ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# username        TEXT UNIQUE NOT NULL
# password_hash   TEXT                      -- NULLable for autonomous AI agents
# role            TEXT DEFAULT 'explorer'   -- explorer | creator | owner | admin | agent
# is_ai_agent     BOOLEAN DEFAULT 0
# agent_persona   TEXT                      -- NULL for humans. 'imagineer' | 'scenographer' | 'lumen'
# managed_by_id   INTEGER REFERENCES users(id) -- NULL if fully autonomous or human
# wallet_cents    INTEGER DEFAULT 2500      -- $25.00 demo money (agents get $100)
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP

# --- spheres (the Registry) ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# spatial_anchor  TEXT UNIQUE NOT NULL       -- "8c2a...:F00:12" (3D, permanent)
# h3_index        TEXT NOT NULL              -- raw H3 cell ID
# floor_code      TEXT NOT NULL DEFAULT 'F00'
# resolution      INTEGER NOT NULL DEFAULT 12
# lat             REAL NOT NULL
# lng             REAL NOT NULL
# display_label   TEXT
# place_type      TEXT NOT NULL
# neighborhood    TEXT DEFAULT 'Pine Street'
# owner_id        INTEGER REFERENCES users(id)
# venue_tier      TEXT DEFAULT 'public'      -- public | commercial | experimental
#
# --- State flags ---
# is_private      BOOLEAN DEFAULT 0
# is_for_sale     BOOLEAN DEFAULT 0
# sale_price_cents INTEGER
# is_leasable     BOOLEAN DEFAULT 0
# lease_price_cents_per_hour INTEGER
# is_directly_bookable BOOLEAN DEFAULT 0
# direct_booking_price_cents INTEGER
# direct_booking_duration_minutes INTEGER DEFAULT 60
#
# --- Space properties ---
# capacity        INTEGER DEFAULT 10
# enclosure       TEXT DEFAULT 'open'        -- open | semi | enclosed
# lighting        TEXT DEFAULT 'natural'     -- natural | low | controllable | none
# acoustics       TEXT DEFAULT 'ambient'     -- quiet | ambient | loud | controllable
#
# --- Hardware capabilities (Owner registers what they have) ---
# has_iot_lighting          BOOLEAN DEFAULT 0
# has_directional_audio     BOOLEAN DEFAULT 0
# has_programmable_surfaces BOOLEAN DEFAULT 0
# has_biometric_sensors     BOOLEAN DEFAULT 0
# has_volumetric_projectors BOOLEAN DEFAULT 0
# has_subwoofers            BOOLEAN DEFAULT 0
# has_fog_machine           BOOLEAN DEFAULT 0
#
# --- Physicality permissions (Owner controls what Creators can do) ---
# allow_pure_ar             BOOLEAN DEFAULT 1
# allow_audio               BOOLEAN DEFAULT 1
# allow_lighting            BOOLEAN DEFAULT 1
# allow_mixed_installation  BOOLEAN DEFAULT 0
# allow_full_installation   BOOLEAN DEFAULT 0
# allow_guest_uploads       BOOLEAN DEFAULT 0
#
# --- Matrix classification ---
# awe_pillar      TEXT     -- moral_beauty | collective_effervescence | nature | music | visual_design | spiritual | life_and_death | epiphany
# tech_innovation TEXT     -- digital_matter | directional_audio | iot_actuation | world_models | programmable_materials | biometric_sync | device_swarms | volumetric_projection
#
# --- Timestamps ---
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP
# updated_at      DATETIME DEFAULT CURRENT_TIMESTAMP

# --- designs (.sfera recipes stored in DB) ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# creator_id      INTEGER REFERENCES users(id)
# title           TEXT NOT NULL
# description     TEXT
# awe_pillar      TEXT
# tech_innovation TEXT
# physicality_mode TEXT   -- pure_ar | ar_audio | ar_lighting | mixed_installation | full_installation
# temporal_layer  TEXT     -- past | present | future
# mood_tags_json  TEXT     -- JSON array: ["intimate", "reflective", "sacred"]
# experience_type TEXT     -- ritual | listening | memory | performance | gathering | etc.
#
# --- Space requirements (the matchmaking block) ---
# place_types_pref_json TEXT   -- JSON array of preferred place types
# enclosure_pref  TEXT
# capacity_min    INTEGER
# capacity_max    INTEGER
# lighting_pref   TEXT
# acoustics_pref  TEXT
# floor_pref      TEXT DEFAULT 'any'
# required_hardware_json TEXT  -- JSON array: ["iot_lighting", "biometric_sensors"]
# optional_hardware_json TEXT  -- JSON array
#
# --- The .sfera recipe (the actual file content) ---
# sfera_recipe_json TEXT       -- Complete .sfera JSON (tracks + cues)
#
# --- Economics ---
# ticket_price_cents INTEGER
# sessions_per_day  INTEGER DEFAULT 3
# ar_production_cost_cents INTEGER DEFAULT 0
# physical_materials_cost_cents INTEGER DEFAULT 0
# hardware_cost_cents INTEGER DEFAULT 0
# setup_labor_cost_cents INTEGER DEFAULT 0
# consumables_per_session_cents INTEGER DEFAULT 0
# replicability_score INTEGER DEFAULT 5   -- 1-5
#
# --- Status ---
# status          TEXT DEFAULT 'draft'     -- draft | published | deployed
# thumbnail_url   TEXT
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP
# updated_at      DATETIME DEFAULT CURRENT_TIMESTAMP

# --- leases ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# sphere_id       INTEGER REFERENCES spheres(id)
# spatial_anchor  TEXT NOT NULL
# owner_id        INTEGER REFERENCES users(id)
# creator_id      INTEGER REFERENCES users(id)
# design_id       INTEGER REFERENCES designs(id)
# start_at        DATETIME NOT NULL
# end_at          DATETIME NOT NULL
# lease_price_cents INTEGER NOT NULL
# status          TEXT DEFAULT 'pending'   -- pending | active | completed | canceled
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP

# --- bookings ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# sphere_id       INTEGER REFERENCES spheres(id)
# spatial_anchor  TEXT NOT NULL
# lease_id        INTEGER REFERENCES leases(id)   -- NULL if direct owner booking
# design_id       INTEGER REFERENCES designs(id)  -- NULL if no experience
# host_id         INTEGER REFERENCES users(id)    -- owner or creator
# booked_by_user_id INTEGER REFERENCES users(id)
# start_at        DATETIME NOT NULL
# end_at          DATETIME NOT NULL
# booking_price_cents INTEGER NOT NULL
# status          TEXT DEFAULT 'pending'   -- pending | confirmed | completed | canceled
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP

# --- transactions ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# user_id         INTEGER REFERENCES users(id)
# counterparty_user_id INTEGER
# sphere_id       INTEGER
# spatial_anchor  TEXT
# lease_id        INTEGER
# design_id       INTEGER
# type            TEXT NOT NULL  -- claim | buy | sell | lease_payment | lease_earning | booking_payment | booking_earning
# amount_cents    INTEGER NOT NULL
# platform_fee_cents INTEGER DEFAULT 0
# metadata_json   TEXT
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP

# --- content ---
# id              INTEGER PRIMARY KEY AUTOINCREMENT
# sphere_id       INTEGER REFERENCES spheres(id)
# spatial_anchor  TEXT
# temporal_layer  TEXT           -- past | present | future
# type            TEXT NOT NULL  -- text | image | audio | video
# title           TEXT
# body_text       TEXT
# media_url       TEXT
# uploader_id     INTEGER REFERENCES users(id)
# created_at      DATETIME DEFAULT CURRENT_TIMESTAMP


# ████████████████████████████████████████████████████████████
# THE .SFERA FILE FORMAT SPECIFICATION v1
# ████████████████████████████████████████████████████████████
#
# A .sfera file is a JSON document that describes a deployable,
# venue-agnostic, hardware-agnostic spatial experience.
#
# It is the equivalent of HTML for physical space.
# It is sheet music for a room.
#
# It contains:
#   1. WHAT should happen (tracks + cues)
#   2. WHERE it can happen (space requirements)
#   3. HOW it makes money (economics)
#
# It does NOT contain GPS coordinates.
# It does NOT reference specific hardware.
# It does NOT care who wrote it (human, AI, or agent).
#
# Full TypeScript interface:

# --- TOP LEVEL ---
# {
#   "sfera": "1.0",                       // format version
#   "id": "uuid",
#   "title": "string",
#   "description": "string",
#   "author": {
#     "id": "string",
#     "name": "string",
#     "type": "human" | "ai_agent",
#     "agent_persona": "imagineer" | "scenographer" | "lumen"  // optional
#   },
#   "awe_pillar": "string",               // Keltner Y-axis (optional)
#   "tech_innovation": "string",           // X-axis (optional)
#   "space": SpaceRequirements,
#   "duration_minutes": number,
#   "tracks": Track[],
#   "cues": Cue[],
#   "economics": Economics,
#   "tags": string[],
#   "created_at": "ISO 8601",
#   "updated_at": "ISO 8601"
# }

# --- SPACE REQUIREMENTS ---
# The matchmaking block. This is what the matching engine reads.
# NEVER references a specific location.
# {
#   "place_types": PlaceType[],            // ordered preference
#   "enclosure": "open" | "semi" | "enclosed" | "any",
#   "capacity": { "min": number, "max": number },
#   "lighting": "natural" | "low" | "controllable" | "none" | "any",
#   "acoustics": "quiet" | "ambient" | "controllable" | "any",
#   "floor_pref": "ground" | "upper" | "rooftop" | "basement" | "sky" | "any",
#   "required_hardware": HardwareFlag[],   // MUST have to render
#   "optional_hardware": HardwareFlag[]    // degrades gracefully without
# }
#
# HardwareFlag = "none" | "iot_lighting" | "directional_audio" |
#   "programmable_surfaces" | "biometric_sensors" |
#   "volumetric_projectors" | "subwoofers" | "fog_machine" | "haptic_floor"

# --- TRACKS ---
# Named parallel channels. Each track = one modality lane.
# {
#   "id": "string",
#   "type": TrackType,
#   "label": "string",
#   "default_state": "on" | "off"
# }
#
# TrackType = "spatial_audio" | "ar_object" | "ar_particle" | "ar_text" |
#   "lighting" | "projection" | "haptic" | "device_sync" | "logic"

# --- CUES ---
# A cue is a single event on a track.
# {
#   "id": "string",
#   "track_id": "string",                 // which track
#   "timing": TimeTrigger | SpatialTrigger | EventTrigger,
#   "action": CueAction
# }
#
# THREE TIMING MODES:
#
# TimeTrigger:
#   { "type": "time", "start_sec": number, "duration_sec": number,
#     "fade_in_sec": number, "fade_out_sec": number }
#
# SpatialTrigger:
#   { "type": "spatial",
#     "condition": "user_enters_radius" | "user_exits_radius" |
#                  "user_still" | "user_facing",
#     "radius_m": number, "stillness_sec": number,
#     "anchor": AnchorPoint }
#
# EventTrigger:
#   { "type": "event",
#     "condition": "cue_complete" | "track_state" | "crowd_count" |
#                  "biometric_sync" | "weather_match" | "time_of_day",
#     "target_cue_id": string, "target_track_id": string,
#     "threshold": number,
#     "weather_condition": "rain" | "clear" | "overcast" | "wind_above_mph",
#     "time_range": { "after": "HH:MM", "before": "HH:MM" } }

# --- ANCHOR POINTS ---
# All positions are RELATIVE to the space. Never absolute GPS.
# {
#   "position": "center" | "entrance" | "north" | "south" | "east" |
#     "west" | "ceiling" | "floor" | "eye_level" | "overhead" |
#     "perimeter" | "random_within",
#   "offset_m": { "x": number, "y": number, "z": number }  // optional
# }

# --- CUE ACTIONS ---
#
# AudioAction:
#   { "type": "audio", "src": "filename", "volume": 0-1,
#     "spatial": boolean, "loop": boolean, "falloff_m": number,
#     "anchor": AnchorPoint }
#
# ARObjectAction:
#   { "type": "ar_object", "src": "file.glb", "scale": number,
#     "anchor": AnchorPoint,
#     "animation": "rotate" | "float" | "pulse" | "pulse_fade" | "grow" | "none",
#     "occlusion": boolean }
#
# ParticleAction:
#   { "type": "particle",
#     "preset": "embers" | "rain" | "dust" | "fireflies" | "snow" | "sparks",
#     "color": "#hex", "density": 1-100, "radius_m": number,
#     "anchor": AnchorPoint,
#     "behavior": "drift" | "fall" | "rise" | "orbit" | "explode" | "swarm" }
#
# TextAction:
#   { "type": "text", "content": "string",
#     "font_size": "small" | "medium" | "large" | "massive",
#     "color": "#hex", "anchor": AnchorPoint,
#     "animation": "fade_in" | "typewriter" | "float" | "none" }
#
# LightingAction:
#   { "type": "lighting", "target": "all" | "zone_a" | "zone_b" | "zone_c",
#     "color": "#hex", "brightness": 0-1, "transition_sec": number }
#
# HapticAction:
#   { "type": "haptic",
#     "pattern": "pulse" | "buzz" | "heartbeat" | "wave" | "custom",
#     "intensity": 0-1, "duration_sec": number }
#
# DeviceSyncAction:
#   { "type": "device_sync",
#     "mode": "flashlight" | "screen_color" | "haptic" | "audio_stem",
#     "color": "#hex",
#     "pattern": "wave_north_south" | "ripple_center" | "all_sync" | "random_cascade",
#     "bpm": number }
#
# LogicAction:
#   { "type": "logic",
#     "operation": "enable_track" | "disable_track" | "jump_to_cue" |
#                  "set_variable" | "end_experience",
#     "target_track_id": string, "target_cue_id": string,
#     "variable": { "key": string, "value": any } }

# --- ECONOMICS ---
# {
#   "ticket_price_cents": number,
#   "sessions_per_day": number,
#   "costs": {
#     "ar_production_cents": number,
#     "physical_materials_cents": number,
#     "hardware_cents": number,
#     "consumables_per_session_cents": number
#   },
#   "replicability": 1-5
# }


# ████████████████████████████████████████████████████████████
# THE 8×8 GENRE MATRIX
# ████████████████████████████████████████████████████████████
#
# Every .sfera file belongs to one cell in this grid.
# When a Creator picks a cell in Studio, the matrix lookup table
# auto-populates: space requirements, hardware flags, economics,
# matching filters, suggested tracks.
#
# Y-AXIS: 8 Pillars of Awe (Dacher Keltner)
#   moral_beauty, collective_effervescence, nature, music,
#   visual_design, spiritual, life_and_death, epiphany
#
# X-AXIS: 8 Spatial Tech Innovations
#   digital_matter, directional_audio, iot_actuation, world_models,
#   programmable_materials, biometric_sync, device_swarms, volumetric_projection
#
# File: sfera-matrix.js
# Exports: AWE_PILLARS, TECH_INNOVATIONS, AWE_DEFAULTS, TECH_DEFAULTS,
#          generateRecipeDefaults(awePillar, techInnovation),
#          buildMatchQuery(recipe)
#
# COLUMN DEFAULTS (tech → hardware + economics):
#
#   NOTE ON ECONOMICS:
#     installation_capex_cents = Owner's hardware investment (informational only)
#     creator_hardware_lease_cents = Creator's cost ($0 — folded into venue lease)
#     The Business Model Canvas must show Creator OpEx, NOT Owner CapEx.
#     Studio should display Owner's investment as context, not as Creator's cost.
#
#   digital_matter:
#     required_hardware: ["none"]
#     installation_capex: $0 | ticket_floor: $1 | replicability: 5/5
#
#   directional_audio:
#     required_hardware: ["directional_audio"]
#     installation_capex: $0 | ticket_floor: $3 | replicability: 5/5
#
#   iot_actuation:
#     required_hardware: ["iot_lighting"]
#     installation_capex: $300 | ticket_floor: $5 | replicability: 4/5
#
#   world_models:
#     required_hardware: ["biometric_sensors"]
#     installation_capex: $4,000 | ticket_floor: $8 | replicability: 3/5
#
#   programmable_materials:
#     required_hardware: ["programmable_surfaces"]
#     installation_capex: $8,000 | ticket_floor: $10 | replicability: 2/5
#
#   biometric_sync:
#     required_hardware: ["biometric_sensors"]
#     installation_capex: $80 | ticket_floor: $5 | replicability: 4/5
#
#   device_swarms:
#     required_hardware: ["none"]
#     installation_capex: $0 | ticket_floor: $2 | replicability: 5/5
#     min_capacity: 10 (swarms need crowds)
#
#   volumetric_projection:
#     required_hardware: ["volumetric_projectors"]
#     installation_capex: $50,000 | ticket_floor: $15 | replicability: 1/5
#
# ROW DEFAULTS (awe → mood + duration + capacity + pacing):
#
#   moral_beauty:              mood: intimate, reflective, sacred       | 15 min | 1-4 ppl  | slow_reveal
#   collective_effervescence:  mood: energetic, social, celebratory     | 10 min | 15-100   | countdown_climax
#   nature:                    mood: awe, cinematic, meditative         | 20 min | 1-10     | ambient_loop
#   music:                     mood: energetic, intimate, cinematic     | 30 min | 4-20     | crescendo
#   visual_design:             mood: awe, cinematic, mysterious         | 15 min | 1-8      | ambient_loop
#   spiritual:                 mood: meditative, sacred, mysterious     | 30 min | 1-6      | slow_reveal
#   life_and_death:            mood: reflective, sacred, intimate       | 20 min | 1-4      | slow_reveal
#   epiphany:                  mood: awe, cinematic, playful            | 10 min | 1-20     | sudden_shift
#
# GENESIS SLATE (diagonal — 8 launch-day experiences):
#   1. moral_beauty     × digital_matter         → "The Kindness Archive"    | $1 | park bench
#   2. coll_efferv      × directional_audio      → "The Hive Pulse"         | $4 | plaza
#   3. nature           × iot_actuation          → "Thermochromic Canopy"   | $5 | transit hub
#   4. music            × world_models           → "The Subsonic Chamber"   | $8 | basement
#   5. visual_design    × programmable_materials  → "Impossible Architecture"| $10| rooftop
#   6. spiritual        × biometric_sync         → "The Consensus Room"     | $5 | windowless room
#   7. life_and_death   × device_swarms          → "The Generation Tree"    | $2 | garden
#   8. epiphany         × volumetric_projection  → "The Overview Effect"    | $15| street corner


# ████████████████████████████████████████████████████████████
# APPLICATION 1: SFERA (CONSUMER APP)
# ████████████████████████████████████████████████████████████
#
# Port: 3000
# Stack: Node.js/Express, SQLite (better-sqlite3), Vanilla JS
# Frontend deps via CDN (esm.sh or unpkg): Leaflet.js, h3-js
# NOTE: Do NOT add Theatre.js or any animation library for prototype.
# Mobile-first SPA. Dark theme.
#
# This is the ONLY app end-users interact with.
# When they open it, they see a beautiful dark map with
# glowing experiences. They tap, they book, they show up.
#
# VOCABULARY: "Claim" (not "Mint"), "Register" (not "Mint")
#
# FILE STRUCTURE:
#   package.json
#   server.js
#   public/
#     index.html
#     style.css
#     js/
#       main.js          -- routing, initialization
#       auth.js          -- login/register, JWT state
#       api.js           -- fetch wrappers
#       map.js           -- Leaflet, H3 hex rendering
#       ui.js            -- bottom sheets, DOM updates
#       renderer.js      -- .sfera playback engine (for booking preview)
#   uploads/
#   sfera.db

# NAVIGATION: 4 TABS (not 5 — no separate "Mint" tab)
#   1. MAP (default)
#   2. EXPERIENCES
#   3. MARKET
#   4. PROFILE (with "Switch to Host Mode" toggle)

# VIEW 1: MAP
# - Dark full-screen Leaflet map with CartoDB dark tiles
# - Pulsing user location dot
# - Do NOT use standard Leaflet pin markers.
#   Use h3.cellToBoundary(h3Index) to get hex coordinates.
#   Draw them as Leaflet Polygons (L.polygon).
#   Fill with temporal layer color:
#     Past → blue (#4488ff)
#     Present → magenta (#ff00ff)
#     Future → gold (#ffd700)
# - Venue tier styling:
#     public → standard temporal colors
#     commercial → add bright white border
#     experimental → pulsing neon cyan border, black fill
# - Marker badges: For Sale, Leasable, Bookable, Live, Booked
# - Tap hex → bottom sheet:
#     Title, place type, floor label, temporal layer
#     Owner
#     Active experience (if deployed): creator name, title, preview
#     Sale / lease / booking prices as applicable
#     Primary CTA:
#       Unclaimed → "Claim" (only in Host Mode)
#       For Sale → "Buy"
#       Active experience → "Book"
#       Leasable → "Request Lease" (only for creators)
#       Owned by you → "Manage"
# - Filter chips: temporal layer, place type, floor
# - Time scroller: -6h to +24h

# VIEW 2: EXPERIENCES
# User-facing booking layer for DEPLOYED creator experiences.
# Sub-tabs: Live Now | Tonight | Upcoming | Past Highlights
# Each card: title, sphere, creator, physicality badge, time, ticket price,
#   capacity, awe pillar tag, mood tags, Book button
# Experience detail bottom sheet:
#   Title, description, creator, sphere, time, ticket price, duration
#   Physicality mode badge
#   "What to expect" section
#   Book button

# VIEW 3: MARKET
# Three sub-tabs: For Sale | Leasable | Direct Booking
# Cards: title, place type, time, owner, price, hardware badges, CTA
# Filters: temporal, place type, floor, hardware capabilities
# Sort: Nearest, Lowest Price, Soonest, Newest

# VIEW 4: PROFILE
# Default: consumer view (bookings, wallet, history)
# "Switch to Host Mode" toggle transforms to Registry/Owner view:
#   - See hex grid overlay
#   - Claim unclaimed spaces
#   - Manage owned spheres: toggle leasable/bookable, set prices,
#     register hardware capabilities, set permissions
#   - View incoming lease requests
#   - View earnings
# This replaces the need for a separate Registry app in the prototype.

# ANTI-HOARDING:
# - Max 20 spheres per user
# - Spheres with no activity for 7 days become reclaimable
# - Health indicator: active | idle | at_risk

# API ROUTES:
# Auth:
#   POST /api/auth/register
#   POST /api/auth/login
#   GET  /api/me
# Spheres:
#   GET  /api/spheres/nearby?lat&lng&hour&filters
#   GET  /api/spheres/:id
#   POST /api/spheres/claim
#   PATCH /api/spheres/:id
# Owner controls:
#   POST /api/spheres/:id/list-for-sale
#   POST /api/spheres/:id/remove-from-sale
#   POST /api/spheres/:id/toggle-leasable
#   POST /api/spheres/:id/toggle-bookable
#   POST /api/spheres/:id/register-hardware
#   GET  /api/spheres/:id/lease-requests
# Market:
#   GET  /api/market/for-sale
#   GET  /api/market/leasable
#   GET  /api/market/experiences
#   POST /api/spheres/:id/buy
# Leases:
#   POST /api/spheres/:id/request-lease
#   POST /api/leases/:id/approve
#   POST /api/leases/:id/cancel
#   GET  /api/leases/mine
#   GET  /api/leases/received
# Designs:
#   GET  /api/designs
#   GET  /api/designs/:id
#   POST /api/designs
#   PATCH /api/designs/:id
#   POST /api/designs/:id/find-spaces
#   POST /api/designs/:id/deploy/:sphereId
# Bookings:
#   GET  /api/spheres/:id/availability
#   POST /api/spheres/:id/book
#   POST /api/experiences/:id/book
#   GET  /api/bookings/mine
#   GET  /api/bookings/received
#   POST /api/bookings/:id/cancel
# Content:
#   GET  /api/spheres/:id/content
#   POST /api/spheres/:id/content
# Profile:
#   GET  /api/profile/stats
#   GET  /api/profile/spheres
#   GET  /api/profile/leases
#   GET  /api/profile/bookings
#   GET  /api/profile/transactions

# MONEY FLOW:
# User pays ticket → Creator keeps (ticket - 10% platform fee)
# Creator pays lease → Owner receives lease payment
# Owner can run direct bookings without a Creator
# Platform fee: 10% on ALL transactions (just track it in transactions table)
# Demo mode: every new user gets $25.00 (2500 cents)

# MAP RENDERING + PERFORMANCE (LOD RULES):
# Use h3.cellToBoundary(h3Index) for hex polygons.
#
# CRITICAL: To prevent DOM thrashing, rendering MUST react to map zoom level.
# At Res 12 (~3.2m²), a 1km radius contains ~312,000 hexes.
# Rendering all of them as SVG polygons will crash any mobile browser.
#
# LOD (Level of Detail) Rules:
#   Zoom < 15 (City View):
#     - Show ONLY a heatmap overlay or cluster markers
#     - No individual hex polygons
#     - Query: SELECT COUNT(*) GROUP BY h3 parent at Res 7
#
#   Zoom 15-17 (Neighborhood View):
#     - Render ONLY claimed/seeded spheres from the database
#     - Each as a solid hex polygon with temporal color fill
#     - No procedural void (unclaimed hexes)
#     - Query: SELECT * FROM spheres WHERE h3_index IN (nearby Res 9 parents)
#
#   Zoom >= 18 (Street Level):
#     - NOW render the procedural void
#     - Use h3.gridDisk(centerHex, 3) for a strict local grid (~37 cells)
#     - Query DB to see which are claimed
#     - Render claimed as solid filled polygons
#     - Render unclaimed as faint dotted outlines (the "void")
#     - This is the ONLY zoom level where unclaimed hexes appear
#
# Max rendered polygons at any zoom: ~50 (37 grid + claimed nearby)
# This keeps the DOM under 200 SVG elements at all times.
#
# DYNAMIC TIME SEEDING:
# All seed data timestamps MUST be relative to Date.now().
# Never hardcode dates. The map must always show a mix of
# past/present/future when booted.


# ████████████████████████████████████████████████████████████
# APPLICATION 2: SFERA STUDIO (CREATOR APP)
# ████████████████████████████████████████████████████████████
#
# Served at: http://localhost:3000/studio
# Stack: SAME server.js as Consumer App (single Express instance)
# Frontend deps via CDN: h3-js
# Mobile-friendly AND desktop. Dark theme.
#
# CRITICAL ARCHITECTURE: 
# SFERA Studio is served by the EXACT SAME server.js as the Consumer App.
# Do NOT create a separate studio-server.js. Do NOT run on port 3001.
#
# Express Routing in server.js:
#   app.use('/', express.static('public'));               // Consumer App
#   app.use('/studio', express.static('studio-public'));  // Creator Studio
#   app.use('/shared', express.static('shared'));         // Shared Engine
#
# The shared/ directory contains:
#   shared/voxel-hours.js   — Layer 1 engine (browser + Node compatible)
#   shared/sfera-matrix.js  — 8×8 genre lookup table
#
# This eliminates CORS issues, solves SQLite locking, and allows both apps
# to seamlessly share the same JWT auth cookie/token.
#
# FILE STRUCTURE:
#   studio-public/   (NOT a separate server)
#     index.html
#     style.css
#     js/
#       main.js
#       auth.js
#       api.js
#       matrix.js        -- 8×8 grid logic + defaults
#       editor.js        -- Score view + cue editing
#       stage.js         -- SferaStage animation canvas
#       canvas-biz.js    -- Business model canvas
#       matcher.js       -- Space matching engine
#
# package.json must use `concurrently` to run both servers:
#   "start": "concurrently \"node server.js\" \"node studio-server.js\""
#
# Auth: Same JWT_SECRET as Consumer App.
# CORS: Enable on both servers.
# User logs in separately (localStorage is per-origin). OK for prototype.

# NAVIGATION: 4 TABS
#   1. CREATE (default)
#   2. MY DESIGNS
#   3. FIND SPACE
#   4. PROFILE

# VIEW 1: CREATE (The Design Studio)

# STEP 1: Pick Genre (the 8×8 Matrix Grid)
# Show a beautiful 8×8 grid. Y-axis = Awe Pillars. X-axis = Tech Innovations.
# Each cell shows a subtle icon and label.
# Colors darken left-to-right (cheap → expensive).
# Creator MUST click a cell. This sets:
#   awe_pillar, tech_innovation, and auto-populates ALL defaults
#   via generateRecipeDefaults() from sfera-matrix.js.

# STEP 2: Design Brief
# Two modes:
#
# A) AI DIRECTOR MODE (default):
#   Show 3 AI Director cards:
#     1. "The Imagineer" — narrative arcs, crowd flow, timed reveals
#     2. "The Scenographer" — immersive theater, hidden triggers, dark/moody
#     3. "Studio Lumen" — ambient light, generative particles, sensory scale
#   Below: large text area ("Give your Director a brief...")
#   Submit button: "Sequence Recipe"
#   For prototype: use keyword-based template logic (no real LLM).
#   Parse text for location hints, mood hints, physical hints,
#   element hints, scale hints. Assemble a .sfera JSON with
#   3-6 tracks and 8-15 cues.
#
# B) MANUAL MODE:
#   Step-by-step form: title, description, mood tags, experience type,
#   tracks, cues. Uses the matrix defaults as starting values.

# STEP 3: The Three-Panel Editor
# BUILD ORDER: Build panels SEQUENTIALLY, not all at once.
# Phase 1: Stage View only (verify animation works standalone)
# Phase 2: Score View (verify timeline syncs with Stage)
# Phase 3: Plot View (adds spatial clarity, lowest priority)
# Phase 4: Cross-panel sync (click in one → highlight in others)
#
# After generation/manual entry, show a three-panel layout:
#
# ┌─────────────────────────────────┬──────────────────┐
# │                                 │                  │
# │     SCORE VIEW (timeline)       │   STAGE VIEW     │
# │     Horizontal tracks + cues    │   (animation     │
# │     Drag cues, adjust timing    │    canvas)       │
# │                                 │                  │
# ├─────────────────────────────────┤                  │
# │                                 │                  │
# │     PLOT VIEW (2D schematic)    │                  │
# │     Top-down spatial layout     │                  │
# │     Anchor positions visible    │                  │
# │                                 │                  │
# └─────────────────────────────────┴──────────────────┘
#
# SCORE VIEW (left top):
#   Horizontal timeline. Each track = a lane.
#   Cues = colored blocks on the timeline.
#   Time-triggered cues: solid, positioned at start_sec.
#   Spatial-triggered cues: dashed border, floating (no fixed time).
#   Event-triggered cues: connected by arrows to their trigger source.
#   Click a cue to edit its action properties.
#   Drag to reposition timing.
#   Scrubbing the playhead syncs the Stage View.
#
# PLOT VIEW (left bottom):
#   Top-down 2D schematic (SVG or Canvas).
#   Space boundary shape based on enclosure (circle/rect/horseshoe).
#   Every anchor position plotted with modality color:
#     audio = blue, AR = magenta, lighting = gold, haptic = white
#   Concentric rings = distance from center (1m, 2m, 3m).
#   Dotted circles = spatial trigger zones.
#   User avatar at "entrance" position.
#
# STAGE VIEW (right — the SferaStage animation canvas):
#   The embedded animation canvas (sfera-stage.js).
#   Reads the .sfera JSON and renders living glyphs:
#     spatial_audio → pulsing concentric rings (blue)
#     ar_object → floating geometric diamond (magenta)
#     ar_particle → actual particle system (cue color)
#     lighting → background color wash gradient
#     haptic → vibration lines around user avatar
#     device_sync → crowd dots pulsing in wave patterns
#     ar_text → floating glowing text
#     logic → enables/disables other layers
#   Draggable user avatar to simulate walk-through.
#   Synced to Score timeline: scrub → canvas updates.
#   Play button: 60fps real-time animation of full recipe.
#
# All three panels stay in sync:
#   - Click a cue in Score → highlights in Plot + Stage
#   - Drag user in Stage → triggers spatial cues → Score playhead jumps
#   - Hover anchor in Plot → highlights in Score + Stage

# STEP 4: Business Model Canvas
# Auto-generated from matrix defaults + recipe.
# Displays as a clean card below the editor.
# REVENUE:
#   Ticket price × capacity × sessions/day = daily revenue
# COSTS:
#   AR production + materials + hardware + lease (fills when space selected)
# PROJECTIONS:
#   Gross margin/session, daily gross, 7-day, 30-day
#   Hardware break-even = hardware cost / daily gross
# REPLICABILITY:
#   Star rating (from matrix column)
#   "Deploy to N compatible spaces" (count from matching engine)
#
# All fields editable. Changes recalculate in real-time.

# STEP 5: Publish
# Review summary → "Publish Design" → status = published
# → CTA: "Find Compatible Spaces"

# VIEW 2: MY DESIGNS
# List all designs as cards.
# Each card: title, physicality badge, awe pillar badge, tech badge,
#   status, deployed sphere if any, earnings, canvas summary
# Actions: Edit, Preview, Find Spaces, Duplicate, Delete

# VIEW 3: FIND SPACE (Matching Engine)
# Two modes:
#
# A) MATCH FROM DESIGN:
#   Select a published design.
#   System queries sfera.db for compatible leasable spheres.
#   Match criteria:
#     - enclosure matches design preference
#     - capacity >= design minimum
#     - lighting matches preference
#     - acoustics matches preference
#     - place_type in design's preferred list
#     - is_leasable = true
#     - no conflicting active lease during desired window
#     - required_hardware flags ALL match owner's registered capabilities
#     - physicality mode allowed by owner's permissions
#   Results ranked by match score (% of criteria matched).
#   Each card: sphere title, place type, floor, match score,
#     green/red chips for matched/unmatched, owner, lease price,
#     net profit projection (ticket revenue - lease cost)
#   "Lease & Deploy" button
#
# B) BROWSE ALL:
#   All leasable spheres, no match scoring.
#   Filters: place type, floor, capacity, price range, hardware
#
# Lease flow:
#   Creator picks sphere → selects lease duration (datetime picker)
#   → sees total lease cost + projected revenue + margin
#   → Business model canvas updates with real lease cost
#   → "Lease & Deploy" → creates lease record (auto-approve in demo)
#   → deducts creator wallet → credits owner wallet
#   → design status → "deployed" → lease linked to design
#   → Success: "Your experience is now live. Users can book it."

# VIEW 4: PROFILE
# Same user table. Username, wallet, designs count,
# active leases, earnings, transactions.


# ████████████████████████████████████████████████████████████
# THE .SFERA RENDERER (CLIENT RUNTIME)
# ████████████████████████████████████████████████████████████
#
# File: renderer.js (lives in Consumer App)
# This plays a .sfera recipe at a registered spatial anchor.
#
# Architecture:
#   .sfera recipe + spatial anchor → SferaRenderer → output backends
#
# The renderer evaluates cues every tick (10fps) against:
#   - Clock time (seconds since experience start)
#   - User position (GPS or ARKit)
#   - Event state (which cues have fired, track states)
#
# For each cue action type, the renderer picks the BEST AVAILABLE
# backend based on what hardware is connected:
#
#   "audio"     → DirectionalHW (parametric speaker) OR WebAudioPanner (headphones) OR phone speaker
#   "ar_object" → WebXR AR session OR screen overlay
#   "particle"  → WebXR AR session OR Canvas 2D particles
#   "lighting"  → IoTBridge (real DMX/Hue) OR ScreenProxy (phone screen color flood)
#   "haptic"    → HapticFloor (real hardware) OR navigator.vibrate()
#   "device_sync" → WebSocket sync engine (works identically for 3 or 300 devices)
#   "text"      → WebXR AR session OR DOM overlay
#   "logic"     → Internal state machine (same everywhere)
#
# resolvePosition(anchor):
#   Converts relative AnchorPoint to real-world coordinates.
#   In production: origin = voxel-hours spatial anchor (GPS + floor).
#   In preview: origin = (0, 0, 0) = wherever user is standing.
#   This is why the same recipe works in both modes.


# ████████████████████████████████████████████████████████████
# THE SFERA STAGE (EMBEDDED ANIMATION ENGINE)
# ████████████████████████████████████████████████████████████
#
# File: stage.js (lives in Studio)
# Canvas 2D animation that reads a .sfera recipe and renders
# a living, abstract visualization. NOT photorealistic.
# Shows timing, spatial logic, mood, and arc.
#
# Visual glyphs per cue type:
#   spatial_audio → pulsing concentric blue rings at anchor position
#     Ring radius = falloff_m. Intensifies when user avatar enters.
#   ar_object → floating magenta diamond shape at anchor
#     Animates: rotate/float/pulse based on action.animation field.
#   ar_particle → actual particle system
#     Behavior: drift/fall/rise/orbit/swarm. Color from cue.
#   lighting → radial gradient color wash over entire canvas
#     Color + brightness from cue. Smooth transitions.
#   haptic → vibration arcs around user avatar
#     Intensity maps to action.intensity.
#   device_sync → 20 simulated crowd dots, pulsing in wave/ripple/cascade
#     Pattern visible: north→south wave, center ripple, sync, random.
#   ar_text → floating glowing text string at anchor position
#     Bobs gently. Glow halo in cue color.
#   logic → invisible, but enables/disables other layers' glyphs
#
# Interactive features:
#   - Draggable user avatar (mouse/touch)
#   - Drag into spatial trigger zone → triggered cues fire
#   - Synced to Score timeline scrubber
#   - Play button → 60fps real-time animation
#   - Dotted circles show spatial trigger radii
#
# Boundary shapes:
#   "open" → circle
#   "semi" → horseshoe (open on south/entrance side)
#   "enclosed" → rectangle
#
# Built with Canvas 2D. No Three.js. No WebGL.
# Canvas background: #0a0a0f


# ████████████████████████████████████████████████████████████
# SEED DATA
# ████████████████████████████████████████████████████████████
#
# ALL timestamps relative to Date.now(). Never hardcode dates.
#
# SEED USERS:
#   genesis       (admin)
#   pinehost      (owner)
#   alleyarchive  (owner + creator)
#   rooftopclub   (owner + creator)
#   futureplans   (creator)
#   cornerkid     (explorer)
#   localguide    (explorer)
#   creator1      (creator)
#   creator2      (creator)
#   studio_lumen  (agent — is_ai_agent: true, agent_persona: 'lumen', 
#                  managed_by: genesis, wallet: 10000 cents ($100),
#                  password_hash: NULL)
#
# CRITICAL: All seed logic MUST live in a separate seed.js file.
# Do NOT inline seed data in server.js.
#
#   // server.js
#   import { seedDatabase } from './seed.js';
#   const count = db.prepare('SELECT COUNT(*) as c FROM users').get().c;
#   if (count === 0) seedDatabase(db);
#
#   // seed.js
#   export function seedDatabase(db) { ... all inserts here ... }
#
# This keeps server.js under 400 lines and seed.js independently debuggable.
#
# SEED SPHERES: 40-50 around Pine Street, Philadelphia
#   Center: LAT 39.9450, LNG -75.1615
#   Mix of:
#     - Unclaimed (render as faint dotted hex outlines)
#     - Owned but private
#     - Owned and for sale
#     - Owned and leasable
#     - Owned and directly bookable
#     - Under active creator lease with deployed experience
#     - Various place types (use full dictionary)
#     - Various venue tiers (mostly public, 3-4 commercial, 1-2 experimental)
#     - Some with hardware flags set (has_iot_lighting, etc.)
#
# SEED THE GENESIS SLATE: 8 deployed experiences (the diagonal)
#   Each must have: a design in designs table, a matching sphere,
#   an active lease, and sample bookings + transactions.
#
#   1. "The Kindness Archive"
#      awe: moral_beauty | tech: digital_matter
#      place: park_bench | tier: public | hw: none
#      ticket: $1 | creator: alleyarchive
#      .sfera: 4 tracks (embers particles, kindness audio, story orb, logic)
#              8 cues (time + spatial triggers + event triggers)
#
#   2. "The Hive Pulse"
#      awe: collective_effervescence | tech: directional_audio
#      place: pocket_plaza | tier: commercial | hw: directional_audio
#      ticket: $4 | creator: creator1
#
#   3. "Thermochromic Canopy"
#      awe: nature | tech: iot_actuation
#      place: lobby | tier: commercial | hw: iot_lighting
#      ticket: $5 | creator: rooftopclub
#
#   4. "The Subsonic Chamber"
#      awe: music | tech: world_models
#      place: basement | tier: commercial | hw: biometric_sensors + subwoofers
#      ticket: $8 | creator: creator2
#
#   5. "Impossible Architecture"
#      awe: visual_design | tech: programmable_materials
#      place: rooftop | tier: experimental | hw: programmable_surfaces
#      ticket: $10 | creator: futureplans
#
#   6. "The Consensus Room"
#      awe: spiritual | tech: biometric_sync
#      place: windowless_room | tier: commercial | hw: biometric_sensors
#      ticket: $5 | creator: creator1
#
#   7. "The Generation Tree"
#      awe: life_and_death | tech: device_swarms
#      place: garden | tier: public | hw: none
#      ticket: $2 | creator: alleyarchive
#
#   8. "The Overview Effect"
#      awe: epiphany | tech: volumetric_projection
#      place: alley | tier: experimental | hw: volumetric_projectors
#      ticket: $15 | creator: creator2
#
# For each genesis experience, seed:
#   - 3-8 sample bookings (mix of confirmed/completed)
#   - Corresponding transactions showing money flow
#   - Creator wallet should show earnings
#   - Owner wallet should show lease income


# ████████████████████████████████████████████████████████████
# STYLE GUIDE
# ████████████████████████████████████████████████████████████
#
# Background:     #0a0a0f
# Surface:        #12121a
# Elevated:       #1a1a2e
# Primary:        #ff00ff (magenta — present)
# Secondary:      #4488ff (blue — past)
# Accent:         #ffd700 (gold — future)
# Text:           #ffffff
# Metadata/dim:   #888899
# Error:          #ff4444
# Success:        #00ff88
#
# Physicality badge colors:
#   Pure AR          → magenta (#ff00ff)
#   AR + Audio       → blue (#4488ff)
#   AR + Lighting    → gold (#ffd700)
#   Mixed Install    → orange (#ff8800)
#   Full Install     → coral (#ff6666)
#
# Venue tier styling:
#   public           → standard temporal colors
#   commercial       → white border (#ffffff, 2px)
#   experimental     → pulsing neon cyan border (#00ffff), black fill
#
# Min touch targets: 48px
# Mobile-first. Safe areas. Smooth transitions.
# Bottom tab navigation.
# Premium native-feeling mobile web app.
# No React. No bundler. Vanilla JS + CDN imports.
# Use <script type="module"> for ES module imports.


# ████████████████████████████████████████████████████████████
# TECHNICAL REQUIREMENTS
# ████████████████████████████████████████████████████████████
#
# 1. WAL MODE: Both servers MUST execute db.pragma("journal_mode = WAL")
#    on init. This prevents SQLITE_BUSY crashes.
#
# 2. CDN ONLY: Leaflet, h3-js, Theatre.js loaded via CDN <script> tags.
#    Use esm.sh or unpkg. No Webpack, no Vite, no bundler.
#
# 3. MODULAR JS: Each app's JS is split into modules (listed above).
#    No single 1500-line app.js file.
#
# 4. NAMESPACED DIRS: Consumer app serves from public/.
#    Studio serves from studio-public/. Never overwrite.
#
# 5. CONCURRENT SERVERS: package.json uses `concurrently` to run both.
#
# 6. CORS: Enable on both Express apps for cross-port requests.
#
# 7. SAME JWT_SECRET: Both servers use identical secret for auth.
#
# 8. HEX RENDERING: Map uses L.polygon with h3.cellToBoundary,
#    NOT standard Leaflet markers.
#
# 9. DYNAMIC TIMESTAMPS: All seed data uses Date.now() relative times.
#
# 10. FLOOR OVERRIDE: UI always asks "We think you're on [floor]. Confirm?"
#     Never trust raw GPS altitude.
#
# 11. STRICT ES MODULES: The root package.json MUST contain "type": "module".
#     Both the Node.js backend and all frontend JS files MUST use modern ES6
#     import/export syntax. Do NOT use require(). All frontend imports MUST 
#     include the .js extension (e.g., import { toISOHour } from '/shared/voxel-hours.js').
#
# 12. H3 VERSION 4 STRICTNESS: You MUST use h3-js Version 4 API syntax.
#     Use h3.latLngToCell() (NOT geoToH3).
#     Use h3.gridDisk() (NOT kRing).
#     Use h3.cellToBoundary() (NOT h3ToGeoBoundary).
#     Use h3.cellToParent() (NOT h3ToParent).
#     Use h3.cellToChildren() (NOT h3ToChildren).
#     Legacy v3 function names will silently fail or throw.
#
# 13. SQLITE JSON PARSING: SQLite stores JSON arrays/objects as TEXT.
#     The backend MUST explicitly use JSON.stringify() on INSERTs and 
#     JSON.parse() on SELECTs for ANY column ending in _json, or arrays like tags.
#     Add a helper function used on every SELECT:
#       function jsonCol(val) { return typeof val === 'string' ? JSON.parse(val) : val; }
#     Without this, the frontend will receive "[object Object]" strings.
#
# 14. SINGLE SERVER: There is ONE Express server on port 3000.
#     Do NOT create studio-server.js. Do NOT use port 3001.
#     Do NOT use concurrently. One process, one port, one database connection.
#
# 15. DEPENDENCY ALLOWLIST: The ONLY npm dependencies are:
#     express, better-sqlite3, h3-js, ws, jsonwebtoken, bcryptjs
#     Do NOT add React, Vite, Webpack, Theatre.js, or any other library.
#     Frontend uses vanilla JS + CDN imports only.


# ████████████████████████████████████████████████████████████
# SUCCESS CRITERIA
# ████████████████████████████████████████████████████████████
#
# When Consumer App (port 3000) opens on a phone near Pine Street:
#   1. See dark beautiful map with hex polygons (not pin markers)
#   2. See 8 Genesis Slate experiences glowing live on the map
#   3. See venue tier distinctions (public/commercial/experimental)
#   4. Browse Experiences tab with Live Now / Tonight / Upcoming
#   5. Book a $1 "Kindness Archive" on a park bench
#   6. See money flow in wallet (ticket → creator → platform fee)
#   7. Switch to Host Mode → see unclaimed hex grid
#   8. Claim a space → set it as leasable → register hardware
#   9. Manage everything from profile
#
# When Studio (port 3001) opens on desktop:
#   1. See the 8×8 Matrix grid → click a cell
#   2. See auto-populated recipe defaults
#   3. Choose AI Director → type brief → get generated recipe
#   4. See Score View (timeline) + Plot View (2D) + Stage View (animation)
#   5. Watch the Stage canvas animate the recipe in real-time
#   6. Drag user avatar through spatial triggers in Stage
#   7. See Business Model Canvas with live-updating economics
#   8. Publish design → Find Compatible Spaces
#   9. See match scores with hardware compatibility checks
#   10. Lease a space → Deploy → Experience goes live on Consumer App
#
# DELIVERABLES:
#   package.json ("type": "module", deps: express, better-sqlite3, h3-js, ws, jsonwebtoken, bcryptjs)
#   server.js (SINGLE Express server — port 3000 — serves Consumer + Studio + API)
#   seed.js (all seed data — extracted, independently debuggable)
#   shared/
#     voxel-hours.js (Layer 1 — pure functions, browser + Node compatible)
#     sfera-matrix.js (8×8 genre lookup table)
#   public/ (Consumer App frontend, modularized JS)
#   studio-public/ (Studio frontend, modularized JS)
#   sfera.db (auto-created with seed data on first run)
#   Single server. Single port. Single database connection.

# ████████████████████████████████████████████████████████████
# APPENDIX A: .SFERA FORMAT — FULL TYPESCRIPT INTERFACE
# ████████████████████████████████████████████████████████████
#
# The following is production-ready code. Include this file
# verbatim in the build. Do not paraphrase or summarize.
#
# File: sfera-recipe-v1.ts
# ────────────────────────────────────────────────────────────

// ============================================
// .sfera v1 — Spatial Recipe Format
// ============================================
// A .sfera file is a JSON document that describes
// a deployable spatial experience. It contains:
//   1. WHAT should happen (tracks + cues)
//   2. WHERE it can happen (space requirements)
//   3. HOW it makes money (economics)
// It does NOT contain GPS coordinates.
// It does NOT reference specific hardware.
// ============================================

// --- TOP LEVEL ---

interface SferaRecipe {
  sfera: "1.0";                          // format version
  id: string;                            // uuid
  title: string;
  description: string;
  author: {
    id: string;
    name: string;
    type: "human" | "ai_agent";
    agent_persona?: string;              // "imagineer" | "scenographer" | "lumen"
  };

  // --- CLASSIFICATION ---
  awe_pillar?:                           // Keltner Y-axis (optional)
    | "moral_beauty"
    | "collective_effervescence"
    | "nature"
    | "music"
    | "visual_design"
    | "spiritual"
    | "life_and_death"
    | "epiphany";

  // --- SPACE REQUIREMENTS (the matchmaking block) ---
  space: SpaceRequirements;

  // --- THE EXPERIENCE ---
  duration_minutes: number;              // total runtime
  tracks: Track[];                       // parallel channels
  cues: Cue[];                           // timed or triggered events

  // --- ECONOMICS ---
  economics: Economics;

  // --- METADATA ---
  tags: string[];
  created_at: string;                    // ISO 8601
  updated_at: string;
}


// --- SPACE REQUIREMENTS ---
// This block is what the matching engine reads.
// It never references a specific location.
// It describes the KIND of space this recipe needs.

interface SpaceRequirements {
  place_types: PlaceType[];              // ordered preference
  enclosure: "open" | "semi" | "enclosed" | "any";
  capacity: { min: number; max: number };
  lighting: "natural" | "low" | "controllable" | "none" | "any";
  acoustics: "quiet" | "ambient" | "controllable" | "any";
  floor_pref: "ground" | "upper" | "rooftop" | "basement" | "sky" | "any";

  // Hardware the recipe REQUIRES to render fully.
  // The matching engine filters: only show spaces
  // where the owner has registered these capabilities.
  required_hardware: HardwareFlag[];

  // Hardware the recipe CAN USE if available,
  // but degrades gracefully without.
  optional_hardware: HardwareFlag[];
}

type HardwareFlag =
  | "none"                    // phone only — Pure AR / Device Swarms
  | "iot_lighting"            // Hue, DMX, smart bulbs
  | "directional_audio"       // parametric speakers
  | "programmable_surfaces"   // smart glass, e-ink panels
  | "biometric_sensors"       // mmWave, thermal
  | "volumetric_projectors"   // projection mapping, laser
  | "subwoofers"              // physical bass
  | "fog_machine"
  | "haptic_floor";

type PlaceType =
  | "sidewalk" | "stoop" | "street_corner" | "alley"
  | "park_bench" | "park_edge" | "garden" | "tree_line"
  | "courtyard" | "plaza" | "pocket_plaza"
  | "rooftop" | "balcony" | "overlook"
  | "basement" | "windowless_room" | "tunnel"
  | "cafe_interior" | "lobby" | "hallway"
  | "room" | "studio" | "classroom"
  | "bus_stop" | "station_platform"
  | "mural_wall" | "facade" | "church_step"
  | "memorial_spot" | "loading_zone"
  | "sky" | "drone_corridor";


// --- TRACKS ---
// A track is a named channel of one modality.
// Think Ableton: each track is a horizontal lane.

interface Track {
  id: string;                            // e.g. "ambient-audio"
  type: TrackType;
  label: string;                         // human-readable name
  default_state: "on" | "off";           // does it start playing?
}

type TrackType =
  | "spatial_audio"        // sound positioned in 3D space
  | "ar_object"            // .glb / 3D model
  | "ar_particle"          // particle system
  | "ar_text"              // floating text overlay
  | "lighting"             // commands to IoT lights
  | "projection"           // commands to volumetric projectors
  | "haptic"               // phone vibration patterns
  | "device_sync"          // flashlight / screen color sync
  | "logic";               // control flow, no direct output


// --- CUES ---
// A cue is a single event on a track.
// It fires based on TIME or TRIGGER (or both).

interface Cue {
  id: string;
  track_id: string;                      // which track this belongs to
  action: CueAction;

  // WHEN does this cue fire?
  // Exactly one of these must be set:
  timing: TimeTrigger | SpatialTrigger | EventTrigger;
}

// --- TIMING MODES ---

interface TimeTrigger {
  type: "time";
  start_sec: number;                     // seconds from experience start
  duration_sec?: number;                 // how long it lasts (null = forever)
  fade_in_sec?: number;
  fade_out_sec?: number;
}

interface SpatialTrigger {
  type: "spatial";
  condition:
    | "user_enters_radius"               // user walks into range
    | "user_exits_radius"                // user walks out
    | "user_still"                       // no movement for N seconds
    | "user_facing";                     // phone pointed at anchor
  radius_m?: number;
  stillness_sec?: number;
  anchor: AnchorPoint;                   // relative to what?
}

interface EventTrigger {
  type: "event";
  condition:
    | "cue_complete"                     // another cue finished
    | "track_state"                      // a track turned on/off
    | "crowd_count"                      // N users in the voxel
    | "biometric_sync"                   // crowd breathing in sync
    | "weather_match"                    // real weather matches condition
    | "time_of_day";                     // real clock hits threshold
  target_cue_id?: string;
  target_track_id?: string;
  threshold?: number;
  weather_condition?: "rain" | "clear" | "overcast" | "wind_above_mph";
  time_range?: { after: string; before: string };  // "18:00" / "21:00"
}


// --- ANCHOR POINTS ---
// All positions are RELATIVE to the space, never absolute GPS.

interface AnchorPoint {
  position:
    | "center"                           // center of the leased space
    | "entrance"                         // where users walk in
    | "north" | "south" | "east" | "west"
    | "ceiling" | "floor"
    | "eye_level"                        // 1.6m above ground
    | "overhead"                         // 3m+ above ground
    | "perimeter"                        // along the boundary edge
    | "random_within";                   // random point inside boundary
  offset_m?: { x: number; y: number; z: number };  // optional fine-tune
}


// --- CUE ACTIONS ---
// What actually happens when the cue fires.

type CueAction =
  | AudioAction
  | ARObjectAction
  | ParticleAction
  | TextAction
  | LightingAction
  | HapticAction
  | DeviceSyncAction
  | LogicAction;

interface AudioAction {
  type: "audio";
  src: string;                           // filename (bundled) or URL
  volume: number;                        // 0.0 - 1.0
  spatial: boolean;                      // true = 3D positioned, false = stereo
  loop: boolean;
  falloff_m?: number;                    // distance at which audio fades to 0
  anchor: AnchorPoint;
}

interface ARObjectAction {
  type: "ar_object";
  src: string;                           // .glb filename
  scale: number;                         // 1.0 = real-world size
  anchor: AnchorPoint;
  animation?: "rotate" | "float" | "pulse" | "pulse_fade" | "grow" | "none";
  occlusion: boolean;                    // hide behind real walls?
}

interface ParticleAction {
  type: "particle";
  preset?: "embers" | "rain" | "dust" | "fireflies" | "snow" | "sparks";
  color: string;                         // hex
  density: number;                       // 1-100
  radius_m: number;
  anchor: AnchorPoint;
  behavior: "drift" | "fall" | "rise" | "orbit" | "explode" | "swarm";
}

interface TextAction {
  type: "text";
  content: string;
  font_size: "small" | "medium" | "large" | "massive";
  color: string;
  anchor: AnchorPoint;
  animation?: "fade_in" | "typewriter" | "float" | "none";
}

interface LightingAction {
  type: "lighting";
  target: "all" | "zone_a" | "zone_b" | "zone_c";  // abstract zones
  color: string;                         // hex
  brightness: number;                    // 0.0 - 1.0
  transition_sec: number;                // fade time
}

interface HapticAction {
  type: "haptic";
  pattern: "pulse" | "buzz" | "heartbeat" | "wave" | "custom";
  intensity: number;                     // 0.0 - 1.0
  duration_sec: number;
}

interface DeviceSyncAction {
  type: "device_sync";
  mode: "flashlight" | "screen_color" | "haptic" | "audio_stem";
  color?: string;
  pattern: "wave_north_south" | "ripple_center" | "all_sync" | "random_cascade";
  bpm?: number;
}

interface LogicAction {
  type: "logic";
  operation:
    | "enable_track"
    | "disable_track"
    | "jump_to_cue"
    | "set_variable"
    | "end_experience";
  target_track_id?: string;
  target_cue_id?: string;
  variable?: { key: string; value: any };
}


// --- ECONOMICS ---

interface Economics {
  ticket_price_cents: number;
  sessions_per_day: number;
  costs: {
    ar_production_cents: number;         // one-time design cost
    physical_materials_cents: number;    // per-venue setup
    hardware_cents: number;              // per-venue hardware
    consumables_per_session_cents: number;
  };
  replicability: 1 | 2 | 3 | 4 | 5;    // 5 = deploy anywhere, 1 = one-off
}



# ████████████████████████████████████████████████████████████
# APPENDIX B: COMPLETE EXAMPLE — THE KINDNESS ARCHIVE
# ████████████████████████████████████████████████████████████
#
# The following is production-ready code. Include this file
# verbatim in the build. Do not paraphrase or summarize.
#
# File: the-kindness-archive.sfera
# ────────────────────────────────────────────────────────────

{
  "sfera": "1.0",
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "title": "The Kindness Archive",
  "description": "Sit on a bench. Glowing embers drift around you. When one floats close, it opens — and a stranger tells you about the moment someone saved their life.",
  "author": {
    "id": "user-creator1",
    "name": "alleyarchive",
    "type": "human"
  },
  "awe_pillar": "moral_beauty",

  "space": {
    "place_types": ["park_bench", "stoop", "memorial_spot", "church_step"],
    "enclosure": "open",
    "capacity": { "min": 1, "max": 2 },
    "lighting": "any",
    "acoustics": "quiet",
    "floor_pref": "ground",
    "required_hardware": ["none"],
    "optional_hardware": ["directional_audio"]
  },

  "duration_minutes": 15,

  "tracks": [
    {
      "id": "embers",
      "type": "ar_particle",
      "label": "Drifting Embers",
      "default_state": "on"
    },
    {
      "id": "stories",
      "type": "spatial_audio",
      "label": "Kindness Stories",
      "default_state": "off"
    },
    {
      "id": "glow",
      "type": "ar_object",
      "label": "Story Orb",
      "default_state": "off"
    },
    {
      "id": "flow",
      "type": "logic",
      "label": "Experience Flow",
      "default_state": "on"
    }
  ],

  "cues": [
    {
      "id": "cue-embers-start",
      "track_id": "embers",
      "timing": {
        "type": "time",
        "start_sec": 0,
        "fade_in_sec": 3
      },
      "action": {
        "type": "particle",
        "preset": "embers",
        "color": "#ff6600",
        "density": 30,
        "radius_m": 3,
        "anchor": { "position": "center" },
        "behavior": "drift"
      }
    },
    {
      "id": "cue-stillness-gate",
      "track_id": "flow",
      "timing": {
        "type": "spatial",
        "condition": "user_still",
        "stillness_sec": 8,
        "anchor": { "position": "center" }
      },
      "action": {
        "type": "logic",
        "operation": "enable_track",
        "target_track_id": "stories"
      }
    },
    {
      "id": "cue-story-1",
      "track_id": "stories",
      "timing": {
        "type": "spatial",
        "condition": "user_enters_radius",
        "radius_m": 1.5,
        "anchor": { "position": "center", "offset_m": { "x": 1.2, "y": 0, "z": 0 } }
      },
      "action": {
        "type": "audio",
        "src": "kindness_042_maria.mp3",
        "volume": 0.8,
        "spatial": true,
        "loop": false,
        "falloff_m": 2.5,
        "anchor": { "position": "center", "offset_m": { "x": 1.2, "y": 0, "z": 0.3 } }
      }
    },
    {
      "id": "cue-orb-appear",
      "track_id": "glow",
      "timing": {
        "type": "event",
        "condition": "cue_complete",
        "target_cue_id": "cue-story-1"
      },
      "action": {
        "type": "ar_object",
        "src": "warm_orb.glb",
        "scale": 0.15,
        "anchor": { "position": "eye_level" },
        "animation": "pulse_fade",
        "occlusion": false
      }
    },
    {
      "id": "cue-story-2",
      "track_id": "stories",
      "timing": {
        "type": "spatial",
        "condition": "user_enters_radius",
        "radius_m": 1.5,
        "anchor": { "position": "center", "offset_m": { "x": -1.0, "y": 0.8, "z": 0 } }
      },
      "action": {
        "type": "audio",
        "src": "kindness_017_james.mp3",
        "volume": 0.8,
        "spatial": true,
        "loop": false,
        "falloff_m": 2.5,
        "anchor": { "position": "center", "offset_m": { "x": -1.0, "y": 0.8, "z": 0.3 } }
      }
    },
    {
      "id": "cue-story-3",
      "track_id": "stories",
      "timing": {
        "type": "spatial",
        "condition": "user_enters_radius",
        "radius_m": 1.5,
        "anchor": { "position": "center", "offset_m": { "x": 0, "y": -1.3, "z": 0 } }
      },
      "action": {
        "type": "audio",
        "src": "kindness_091_devi.mp3",
        "volume": 0.8,
        "spatial": true,
        "loop": false,
        "falloff_m": 2.5,
        "anchor": { "position": "center", "offset_m": { "x": 0, "y": -1.3, "z": 0.3 } }
      }
    },
    {
      "id": "cue-finale-embers",
      "track_id": "embers",
      "timing": {
        "type": "time",
        "start_sec": 780,
        "fade_in_sec": 5
      },
      "action": {
        "type": "particle",
        "preset": "fireflies",
        "color": "#ffd700",
        "density": 80,
        "radius_m": 5,
        "anchor": { "position": "center" },
        "behavior": "rise"
      }
    },
    {
      "id": "cue-end",
      "track_id": "flow",
      "timing": {
        "type": "time",
        "start_sec": 900
      },
      "action": {
        "type": "logic",
        "operation": "end_experience"
      }
    }
  ],

  "economics": {
    "ticket_price_cents": 100,
    "sessions_per_day": 48,
    "costs": {
      "ar_production_cents": 0,
      "physical_materials_cents": 0,
      "hardware_cents": 0,
      "consumables_per_session_cents": 0
    },
    "replicability": 5
  },

  "tags": ["moral_beauty", "intimate", "reflective", "sacred", "solo"],
  "created_at": "2026-03-21T00:00:00Z",
  "updated_at": "2026-03-21T00:00:00Z"
}


# ████████████████████████████████████████████████████████████
# APPENDIX C: .SFERA RENDERER — CLIENT RUNTIME ENGINE
# ████████████████████████████████████████████████████████████
#
# The following is production-ready code. Include this file
# verbatim in the build. Do not paraphrase or summarize.
#
# File: sfera-renderer.js
# ────────────────────────────────────────────────────────────

// ============================================
// sfera-renderer.js — How a client app plays a .sfera file
// ============================================
// This is the runtime that lives in the Consumer App.
// It takes a .sfera recipe + a voxel-hours spatial anchor
// and renders the experience into physical space.
// ============================================

import { loadSfera } from './sfera-parser.js';
import { resolveAnchor } from './voxel-hours.js';

class SferaRenderer {
  constructor(recipe, spatialAnchor, deviceCapabilities) {
    this.recipe = recipe;                    // parsed .sfera JSON
    this.anchor = spatialAnchor;             // from voxel-hours engine
    this.caps = deviceCapabilities;          // what this phone/space can do
    this.clock = 0;                          // seconds since start
    this.trackStates = {};                   // which tracks are on/off
    this.firedCues = new Set();              // cues already triggered
    this.variables = {};                     // logic state
  }

  start() {
    // Initialize track states
    for (const track of this.recipe.tracks) {
      this.trackStates[track.id] = track.default_state === "on";
    }

    // Start the clock
    this.interval = setInterval(() => this.tick(), 100);  // 10fps
  }

  tick() {
    this.clock += 0.1;

    for (const cue of this.recipe.cues) {
      if (this.firedCues.has(cue.id)) continue;
      if (!this.trackStates[cue.track_id]) continue;
      if (this.shouldFire(cue)) {
        this.fire(cue);
        this.firedCues.add(cue.id);
      }
    }

    // Check if experience is over
    if (this.clock >= this.recipe.duration_minutes * 60) {
      this.stop();
    }
  }

  shouldFire(cue) {
    const t = cue.timing;

    switch (t.type) {
      case "time":
        return this.clock >= t.start_sec;

      case "spatial":
        const anchorWorld = this.resolvePosition(t.anchor);
        const userPos = this.getUserPosition();  // GPS or ARKit
        const dist = distance3D(userPos, anchorWorld);

        switch (t.condition) {
          case "user_enters_radius":
            return dist <= (t.radius_m || 2);
          case "user_exits_radius":
            return dist > (t.radius_m || 2);
          case "user_still":
            return this.userStillFor(t.stillness_sec || 5);
          case "user_facing":
            return this.userFacing(anchorWorld);
        }
        break;

      case "event":
        switch (t.condition) {
          case "cue_complete":
            return this.firedCues.has(t.target_cue_id);
          case "crowd_count":
            return this.getUsersInVoxel() >= (t.threshold || 1);
          case "biometric_sync":
            return this.getBiometricSyncScore() >= (t.threshold || 0.8);
          case "weather_match":
            return this.currentWeather() === t.weather_condition;
          case "time_of_day":
            return this.isWithinTimeRange(t.time_range);
        }
        break;
    }
    return false;
  }

  fire(cue) {
    const action = cue.action;

    switch (action.type) {
      case "audio":
        this.audioEngine.play(action.src, {
          position: this.resolvePosition(action.anchor),
          volume: action.volume,
          spatial: action.spatial,
          loop: action.loop,
          falloff: action.falloff_m
        });
        break;

      case "ar_object":
        this.arEngine.spawn(action.src, {
          position: this.resolvePosition(action.anchor),
          scale: action.scale,
          animation: action.animation,
          occlusion: action.occlusion
        });
        break;

      case "particle":
        this.arEngine.particles(action.preset, {
          position: this.resolvePosition(action.anchor),
          color: action.color,
          density: action.density,
          radius: action.radius_m,
          behavior: action.behavior
        });
        break;

      case "lighting":
        // Only fires if space has iot_lighting capability
        if (this.caps.includes("iot_lighting")) {
          this.iotBridge.setLights(action.target, {
            color: action.color,
            brightness: action.brightness,
            transition: action.transition_sec
          });
        }
        break;

      case "haptic":
        navigator.vibrate?.(this.hapticPattern(action.pattern, action.duration_sec));
        break;

      case "device_sync":
        this.syncEngine.broadcast(action.mode, {
          pattern: action.pattern,
          color: action.color,
          bpm: action.bpm
        });
        break;

      case "logic":
        switch (action.operation) {
          case "enable_track":
            this.trackStates[action.target_track_id] = true;
            break;
          case "disable_track":
            this.trackStates[action.target_track_id] = false;
            break;
          case "end_experience":
            this.stop();
            break;
        }
        break;
    }
  }

  // Convert relative anchor positions to real-world coordinates
  // using the voxel-hours spatial anchor as the origin
  resolvePosition(anchor) {
    const origin = this.anchor;  // voxel-hours center point
    const base = ANCHOR_POSITIONS[anchor.position](origin);
    if (anchor.offset_m) {
      base.x += anchor.offset_m.x;
      base.y += anchor.offset_m.y;
      base.z += anchor.offset_m.z;
    }
    return base;
  }
}

// The bridge between voxel-hours and .sfera:
// voxel-hours tells you WHERE you are (the address)
// .sfera tells you WHAT should happen (the content)
// The renderer connects them at runtime

const ANCHOR_POSITIONS = {
  center:    (origin) => ({ x: origin.x, y: origin.y, z: 0 }),
  entrance:  (origin) => ({ x: origin.x, y: origin.y - origin.radius, z: 0 }),
  eye_level: (origin) => ({ x: origin.x, y: origin.y, z: 1.6 }),
  overhead:  (origin) => ({ x: origin.x, y: origin.y, z: 3.0 }),
  ceiling:   (origin) => ({ x: origin.x, y: origin.y, z: origin.ceiling || 3.0 }),
  floor:     (origin) => ({ x: origin.x, y: origin.y, z: 0 }),
  north:     (origin) => ({ x: origin.x, y: origin.y + origin.radius, z: 0 }),
  south:     (origin) => ({ x: origin.x, y: origin.y - origin.radius, z: 0 }),
  east:      (origin) => ({ x: origin.x + origin.radius, y: origin.y, z: 0 }),
  west:      (origin) => ({ x: origin.x - origin.radius, y: origin.y, z: 0 }),
  perimeter: (origin) => randomPointOnCircle(origin, origin.radius),
  random_within: (origin) => randomPointInCircle(origin, origin.radius),
};



# ████████████████████████████████████████████████████████████
# APPENDIX D: THE 8×8 GENRE MATRIX — LOOKUP TABLE
# ████████████████████████████████████████████████████████████
#
# The following is production-ready code. Include this file
# verbatim in the build. Do not paraphrase or summarize.
#
# File: sfera-matrix.js
# ────────────────────────────────────────────────────────────

// ============================================
// sfera-matrix.js — The 8×8 Genre System
// ============================================
// When a Creator clicks a cell in Studio, this
// lookup table auto-populates every field in
// the .sfera recipe: space requirements, hardware
// flags, economics, matching filters.
//
// This IS the .sfera format's genre taxonomy.
// ============================================

const AWE_PILLARS = [
  "moral_beauty",
  "collective_effervescence",
  "nature",
  "music",
  "visual_design",
  "spiritual",
  "life_and_death",
  "epiphany"
];

const TECH_INNOVATIONS = [
  "digital_matter",         // Pure AR — phone only
  "directional_audio",      // Parametric speakers
  "iot_actuation",          // DMX, Hue, fog, HVAC
  "world_models",           // LiDAR + edge GPU
  "programmable_materials", // Smart glass, e-ink, kinetic
  "biometric_sync",         // mmWave, thermal, heart rate
  "device_swarms",          // Crowd phone sync — no hardware
  "volumetric_projection"   // Laser projection, holographics
];

// --- COLUMN DEFAULTS ---
// Each tech innovation defines the hardware reality.
// These auto-populate when the creator picks a column.

const TECH_DEFAULTS = {
  digital_matter: {
    required_hardware: ["none"],
    optional_hardware: [],
    venue_cost_cents: 0,
    ticket_floor_cents: 100,
    replicability: 5,
    place_type_bias: ["sidewalk", "park_bench", "stoop", "rooftop", "alley"],
    enclosure_bias: "any",
    matching_filter: {}  // matches everything
  },

  directional_audio: {
    required_hardware: ["directional_audio"],
    optional_hardware: ["iot_lighting"],
    venue_cost_cents: 0,
    ticket_floor_cents: 300,
    replicability: 5,
    place_type_bias: ["park_bench", "memorial_spot", "church_step", "lobby"],
    enclosure_bias: "any",
    matching_filter: { has_directional_audio: true }
  },

  iot_actuation: {
    required_hardware: ["iot_lighting"],
    optional_hardware: ["subwoofers", "fog_machine"],
    venue_cost_cents: 30000,   // $300 Hue + DMX setup
    ticket_floor_cents: 500,
    replicability: 4,
    place_type_bias: ["room", "basement", "cafe_interior", "lobby", "courtyard"],
    enclosure_bias: "enclosed",
    matching_filter: { has_iot_lighting: true }
  },

  world_models: {
    required_hardware: ["biometric_sensors"],
    optional_hardware: ["iot_lighting", "volumetric_projectors"],
    venue_cost_cents: 400000,  // $4,000 LiDAR + edge PC
    ticket_floor_cents: 800,
    replicability: 3,
    place_type_bias: ["room", "lobby", "studio", "courtyard"],
    enclosure_bias: "enclosed",
    matching_filter: { has_biometric_sensors: true }
  },

  programmable_materials: {
    required_hardware: ["programmable_surfaces"],
    optional_hardware: ["iot_lighting", "biometric_sensors"],
    venue_cost_cents: 800000,  // $8,000 smart glass install
    ticket_floor_cents: 1000,
    replicability: 2,
    place_type_bias: ["lobby", "facade", "room", "station_platform"],
    enclosure_bias: "enclosed",
    matching_filter: { has_programmable_surfaces: true }
  },

  biometric_sync: {
    required_hardware: ["biometric_sensors"],
    optional_hardware: ["iot_lighting", "directional_audio"],
    venue_cost_cents: 8000,    // $80 mmWave sensor
    ticket_floor_cents: 500,
    replicability: 4,
    place_type_bias: ["room", "basement", "windowless_room", "studio"],
    enclosure_bias: "enclosed",
    matching_filter: { has_biometric_sensors: true }
  },

  device_swarms: {
    required_hardware: ["none"],
    optional_hardware: ["iot_lighting"],
    venue_cost_cents: 0,
    ticket_floor_cents: 200,
    replicability: 5,
    place_type_bias: ["plaza", "courtyard", "park_edge", "rooftop"],
    enclosure_bias: "open",
    matching_filter: {},
    min_capacity: 10  // swarms need crowds
  },

  volumetric_projection: {
    required_hardware: ["volumetric_projectors"],
    optional_hardware: ["directional_audio", "fog_machine", "biometric_sensors"],
    venue_cost_cents: 5000000,  // $50,000 projection rig
    ticket_floor_cents: 1500,
    replicability: 1,
    place_type_bias: ["alley", "facade", "mural_wall", "basement", "tunnel"],
    enclosure_bias: "semi",
    matching_filter: { has_volumetric_projectors: true }
  }
};

// --- ROW DEFAULTS ---
// Each awe pillar defines the emotional architecture.
// These shape mood tags, duration, and pacing hints.

const AWE_DEFAULTS = {
  moral_beauty: {
    mood_tags: ["intimate", "reflective", "sacred"],
    default_duration_min: 15,
    capacity_bias: { min: 1, max: 4 },
    pacing: "slow_reveal",
    acoustics_bias: "quiet"
  },

  collective_effervescence: {
    mood_tags: ["energetic", "social", "celebratory"],
    default_duration_min: 10,
    capacity_bias: { min: 15, max: 100 },
    pacing: "countdown_climax",
    acoustics_bias: "any"
  },

  nature: {
    mood_tags: ["awe", "cinematic", "meditative"],
    default_duration_min: 20,
    capacity_bias: { min: 1, max: 10 },
    pacing: "ambient_loop",
    acoustics_bias: "quiet"
  },

  music: {
    mood_tags: ["energetic", "intimate", "cinematic"],
    default_duration_min: 30,
    capacity_bias: { min: 4, max: 20 },
    pacing: "crescendo",
    acoustics_bias: "controllable"
  },

  visual_design: {
    mood_tags: ["awe", "cinematic", "mysterious"],
    default_duration_min: 15,
    capacity_bias: { min: 1, max: 8 },
    pacing: "ambient_loop",
    acoustics_bias: "any"
  },

  spiritual: {
    mood_tags: ["meditative", "sacred", "mysterious"],
    default_duration_min: 30,
    capacity_bias: { min: 1, max: 6 },
    pacing: "slow_reveal",
    acoustics_bias: "quiet"
  },

  life_and_death: {
    mood_tags: ["reflective", "sacred", "intimate"],
    default_duration_min: 20,
    capacity_bias: { min: 1, max: 4 },
    pacing: "slow_reveal",
    acoustics_bias: "quiet"
  },

  epiphany: {
    mood_tags: ["awe", "cinematic", "playful"],
    default_duration_min: 10,
    capacity_bias: { min: 1, max: 20 },
    pacing: "sudden_shift",
    acoustics_bias: "any"
  }
};


// --- THE GENERATOR ---
// When a Creator clicks cell [row, col] in Studio,
// this function scaffolds a complete .sfera recipe.

function generateRecipeDefaults(awePillar, techInnovation) {
  const awe = AWE_DEFAULTS[awePillar];
  const tech = TECH_DEFAULTS[techInnovation];

  return {
    sfera: "1.0",
    id: crypto.randomUUID(),
    title: "",           // Creator fills this in (or AI generates)
    description: "",     // Creator fills this in (or AI generates)
    author: null,        // Set from session

    awe_pillar: awePillar,

    space: {
      place_types: tech.place_type_bias,
      enclosure: tech.enclosure_bias,
      capacity: {
        min: tech.min_capacity || awe.capacity_bias.min,
        max: awe.capacity_bias.max
      },
      lighting: tech.enclosure_bias === "enclosed" ? "controllable" : "any",
      acoustics: awe.acoustics_bias,
      floor_pref: "any",
      required_hardware: tech.required_hardware,
      optional_hardware: tech.optional_hardware
    },

    duration_minutes: awe.default_duration_min,
    tracks: [],          // Creator builds these (or AI generates)
    cues: [],            // Creator builds these (or AI generates)

    economics: {
      ticket_price_cents: tech.ticket_floor_cents,
      sessions_per_day: Math.floor(12 * 60 / awe.default_duration_min),
      costs: {
        ar_production_cents: 0,
        physical_materials_cents: 0,
        hardware_cents: tech.venue_cost_cents,
        consumables_per_session_cents: 0
      },
      replicability: tech.replicability
    },

    tags: awe.mood_tags,
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),

    // --- METADATA FOR STUDIO UI ---
    _studio_hints: {
      pacing: awe.pacing,
      matching_filter: tech.matching_filter,
      suggested_track_types: getSuggestedTracks(techInnovation)
    }
  };
}


// Which tracks make sense for this tech column?
function getSuggestedTracks(tech) {
  const base = ["spatial_audio", "ar_particle", "logic"];
  const extras = {
    digital_matter:         ["ar_object", "ar_text"],
    directional_audio:      [],
    iot_actuation:          ["lighting"],
    world_models:           ["ar_object", "ar_particle"],
    programmable_materials: ["lighting", "projection"],
    biometric_sync:         ["lighting", "haptic"],
    device_swarms:          ["device_sync", "haptic"],
    volumetric_projection:  ["projection"]
  };
  return [...base, ...(extras[tech] || [])];
}


// --- THE MATCHING QUERY ---
// When a Creator hits "Find Spaces", the matching
// engine uses the .sfera recipe to query the Registry.

function buildMatchQuery(recipe) {
  const s = recipe.space;
  const filter = recipe._studio_hints?.matching_filter || {};

  // This becomes a SQLite WHERE clause
  return {
    is_leasable: true,
    capacity_gte: s.capacity.min,
    place_type_in: s.place_types,
    enclosure: s.enclosure !== "any" ? s.enclosure : null,
    lighting: s.lighting !== "any" ? s.lighting : null,
    acoustics: s.acoustics !== "any" ? s.acoustics : null,
    ...filter  // has_iot_lighting: true, etc.
  };
}

module.exports = {
  AWE_PILLARS,
  TECH_INNOVATIONS,
  AWE_DEFAULTS,
  TECH_DEFAULTS,
  generateRecipeDefaults,
  buildMatchQuery
};



# ████████████████████████████████████████████████████████████
# APPENDIX E: SFERA STAGE — EMBEDDED ANIMATION ENGINE
# ████████████████████████████████████████████████████████████
#
# The following is production-ready code. Include this file
# verbatim in the build. Do not paraphrase or summarize.
#
# File: sfera-stage.js
# ────────────────────────────────────────────────────────────

// ============================================
// sfera-stage.js — The Embedded Animation Canvas
// ============================================
// A 2D Canvas animation that reads a .sfera recipe
// and renders a living, abstract visualization of
// the experience. Embedded directly in Studio.
//
// NOT trying to be photorealistic.
// Trying to show: timing, spatial logic, mood, arc.
// Think: a petri dish where you watch your recipe breathe.
// ============================================

class SferaStage {
  constructor(canvasEl, recipe) {
    this.canvas = canvasEl;
    this.ctx = canvasEl.getContext('2d');
    this.recipe = recipe;
    this.clock = 0;
    this.playing = false;
    this.userPos = { x: 0.5, y: 0.8 };  // normalized 0-1, starts at "entrance"
    this.draggingUser = false;

    // Derive space shape from recipe
    this.boundary = this.buildBoundary(recipe.space.enclosure);

    // Parse cues into renderable layers
    this.layers = this.buildLayers(recipe);

    // Current state
    this.activeCues = new Set();
    this.bgColor = { r: 10, g: 10, b: 15 };    // #0a0a0f
    this.particles = [];
    this.audioRipples = [];
    this.arObjects = [];
    this.textOverlays = [];

    // Make canvas interactive (drag the user avatar)
    this.bindEvents();
  }

  // --- BOUNDARY SHAPES ---
  buildBoundary(enclosure) {
    switch (enclosure) {
      case 'open':     return { type: 'circle', radius: 0.4 };
      case 'semi':     return { type: 'horseshoe', radius: 0.4, openSide: 'south' };
      case 'enclosed': return { type: 'rect', w: 0.7, h: 0.6 };
      default:         return { type: 'circle', radius: 0.4 };
    }
  }

  // --- LAYER SYSTEM ---
  // Each .sfera track type maps to a visual layer
  buildLayers(recipe) {
    return {
      // LIGHTING → background color wash
      lighting: {
        render: (ctx, state) => {
          // Smooth lerp to target color
          const bg = state.targetBg || this.bgColor;
          ctx.fillStyle = `rgb(${bg.r}, ${bg.g}, ${bg.b})`;
          ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        }
      },

      // SPATIAL AUDIO → pulsing concentric rings at anchor position
      // Ring color: blue (#4488ff)
      // Ring radius = falloff_m (mapped to canvas scale)
      // Pulse speed = BPM of the audio (or default 60)
      // When user avatar enters the falloff radius, rings intensify
      spatial_audio: {
        render: (ctx, cue, clock) => {
          const pos = this.anchorToCanvas(cue.action.anchor);
          const falloff = (cue.action.falloff_m || 3) * 0.08;  // scale to canvas
          const dist = this.distance(this.userPos, pos);
          const proximity = Math.max(0, 1 - dist / falloff);

          // Concentric rings
          const rings = 3;
          const phase = (clock * 2) % (Math.PI * 2);
          for (let i = 0; i < rings; i++) {
            const r = falloff * ((i + 1) / rings) * (0.8 + 0.2 * Math.sin(phase + i));
            const alpha = 0.15 + proximity * 0.4;
            ctx.beginPath();
            ctx.arc(pos.x * ctx.canvas.width, pos.y * ctx.canvas.height,
                    r * ctx.canvas.width, 0, Math.PI * 2);
            ctx.strokeStyle = `rgba(68, 136, 255, ${alpha})`;
            ctx.lineWidth = 1.5 + proximity * 2;
            ctx.stroke();
          }

          // Source dot
          ctx.beginPath();
          ctx.arc(pos.x * ctx.canvas.width, pos.y * ctx.canvas.height,
                  4 + proximity * 6, 0, Math.PI * 2);
          ctx.fillStyle = `rgba(68, 136, 255, ${0.5 + proximity * 0.5})`;
          ctx.fill();
        }
      },

      // AR OBJECTS → floating geometric shapes at anchor
      // Color: magenta (#ff00ff)
      // Animation mapped: rotate = spinning, pulse = scaling, float = bobbing
      ar_object: {
        render: (ctx, cue, clock) => {
          const pos = this.anchorToCanvas(cue.action.anchor);
          const cx = pos.x * ctx.canvas.width;
          const cy = pos.y * ctx.canvas.height;
          const size = 12 * (cue.action.scale || 1);
          const anim = cue.action.animation || 'none';

          ctx.save();
          ctx.translate(cx, cy);

          if (anim === 'rotate') ctx.rotate(clock * 1.5);
          if (anim === 'float') ctx.translate(0, Math.sin(clock * 2) * 8);
          if (anim === 'pulse') {
            const s = 1 + 0.3 * Math.sin(clock * 3);
            ctx.scale(s, s);
          }

          // Diamond shape
          ctx.beginPath();
          ctx.moveTo(0, -size);
          ctx.lineTo(size * 0.7, 0);
          ctx.lineTo(0, size);
          ctx.lineTo(-size * 0.7, 0);
          ctx.closePath();
          ctx.fillStyle = 'rgba(255, 0, 255, 0.6)';
          ctx.fill();
          ctx.strokeStyle = '#ff00ff';
          ctx.lineWidth = 1.5;
          ctx.stroke();

          // Glow
          ctx.shadowColor = '#ff00ff';
          ctx.shadowBlur = 15;
          ctx.fill();

          ctx.restore();
        }
      },

      // PARTICLES → actual particle system
      // Uses preset color + behavior from the cue
      ar_particle: {
        render: (ctx, cue, clock) => {
          const pos = this.anchorToCanvas(cue.action.anchor);
          const cx = pos.x * ctx.canvas.width;
          const cy = pos.y * ctx.canvas.height;
          const radius = (cue.action.radius_m || 3) * 0.08 * ctx.canvas.width;
          const density = cue.action.density || 30;
          const color = cue.action.color || '#ff6600';
          const behavior = cue.action.behavior || 'drift';

          // Spawn/maintain particles
          for (let i = 0; i < density / 5; i++) {
            const age = (clock * 0.3 + i * 0.1) % 1;
            let px, py;

            switch (behavior) {
              case 'drift':
                px = cx + Math.sin(clock * 0.5 + i * 2.1) * radius * age;
                py = cy + Math.cos(clock * 0.3 + i * 1.7) * radius * age;
                break;
              case 'rise':
                px = cx + Math.sin(i * 1.3) * radius * 0.5;
                py = cy - age * radius;
                break;
              case 'fall':
                px = cx + Math.sin(i * 1.3) * radius * 0.5;
                py = cy + age * radius;
                break;
              case 'orbit':
                px = cx + Math.cos(clock + i * 0.5) * radius * 0.6;
                py = cy + Math.sin(clock + i * 0.5) * radius * 0.6;
                break;
              case 'swarm':
                const ux = this.userPos.x * ctx.canvas.width;
                const uy = this.userPos.y * ctx.canvas.height;
                px = ux + Math.sin(clock * 2 + i) * 30;
                py = uy + Math.cos(clock * 2 + i) * 30;
                break;
              default:
                px = cx + (Math.random() - 0.5) * radius * 2;
                py = cy + (Math.random() - 0.5) * radius * 2;
            }

            const alpha = 0.3 + 0.5 * (1 - age);
            const size = 2 + 3 * (1 - age);
            ctx.beginPath();
            ctx.arc(px, py, size, 0, Math.PI * 2);
            ctx.fillStyle = color + Math.floor(alpha * 255).toString(16).padStart(2, '0');
            ctx.fill();
          }
        }
      },

      // LIGHTING → background color wash with smooth transition
      lighting_action: {
        render: (ctx, cue, clock) => {
          // Parse hex color to RGB
          const hex = cue.action.color || '#ff00ff';
          const r = parseInt(hex.slice(1,3), 16);
          const g = parseInt(hex.slice(3,5), 16);
          const b = parseInt(hex.slice(5,7), 16);
          const brightness = cue.action.brightness || 1.0;

          // Radial gradient from boundary center
          const cx = ctx.canvas.width / 2;
          const cy = ctx.canvas.height / 2;
          const grad = ctx.createRadialGradient(cx, cy, 0, cx, cy, ctx.canvas.width * 0.5);
          grad.addColorStop(0, `rgba(${r*brightness}, ${g*brightness}, ${b*brightness}, 0.3)`);
          grad.addColorStop(1, `rgba(${r*brightness}, ${g*brightness}, ${b*brightness}, 0.05)`);
          ctx.fillStyle = grad;
          ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        }
      },

      // HAPTIC → phone-shaped icon that shakes
      haptic: {
        render: (ctx, cue, clock) => {
          const ux = this.userPos.x * ctx.canvas.width;
          const uy = this.userPos.y * ctx.canvas.height;
          const shake = Math.sin(clock * 30) * 3 * (cue.action.intensity || 0.5);
          // Draw vibration lines around user avatar
          ctx.strokeStyle = 'rgba(255, 255, 255, 0.4)';
          ctx.lineWidth = 1;
          for (let i = 0; i < 3; i++) {
            ctx.beginPath();
            ctx.arc(ux + shake, uy, 15 + i * 5, -0.5, 0.5);
            ctx.stroke();
            ctx.beginPath();
            ctx.arc(ux + shake, uy, 15 + i * 5, Math.PI - 0.5, Math.PI + 0.5);
            ctx.stroke();
          }
        }
      },

      // DEVICE SYNC → multiple small dots around user pulsing in patterns
      device_sync: {
        render: (ctx, cue, clock) => {
          const cx = ctx.canvas.width / 2;
          const cy = ctx.canvas.height / 2;
          const count = 20;  // simulated crowd
          const bpm = cue.action.bpm || 120;
          const beatSec = 60 / bpm;
          const color = cue.action.color || '#ffffff';

          for (let i = 0; i < count; i++) {
            const angle = (i / count) * Math.PI * 2;
            const r = 60 + Math.random() * 80;
            const dx = cx + Math.cos(angle) * r;
            const dy = cy + Math.sin(angle) * r;

            // Wave pattern based on position
            let delay = 0;
            if (cue.action.pattern === 'wave_north_south') delay = (dy / ctx.canvas.height) * beatSec;
            if (cue.action.pattern === 'ripple_center') delay = (r / 140) * beatSec;
            if (cue.action.pattern === 'random_cascade') delay = Math.random() * beatSec;

            const phase = ((clock - delay) % beatSec) / beatSec;
            const brightness = phase < 0.3 ? 1 : 0.15;

            ctx.beginPath();
            ctx.arc(dx, dy, 4, 0, Math.PI * 2);
            ctx.fillStyle = color + Math.floor(brightness * 200).toString(16).padStart(2, '0');
            ctx.fill();
          }
        }
      },

      // TEXT OVERLAY → floating text with glow
      ar_text: {
        render: (ctx, cue, clock) => {
          const pos = this.anchorToCanvas(cue.action.anchor);
          const cx = pos.x * ctx.canvas.width;
          const cy = pos.y * ctx.canvas.height;
          const sizes = { small: 12, medium: 16, large: 22, massive: 32 };
          ctx.font = `${sizes[cue.action.font_size] || 16}px monospace`;
          ctx.fillStyle = cue.action.color || '#ffffff';
          ctx.textAlign = 'center';
          ctx.shadowColor = cue.action.color || '#ffffff';
          ctx.shadowBlur = 10;

          const bob = Math.sin(clock * 1.5) * 4;
          ctx.fillText(cue.action.content || '', cx, cy + bob);
          ctx.shadowBlur = 0;
        }
      }
    };
  }

  // --- ANCHOR → CANVAS POSITION ---
  anchorToCanvas(anchor) {
    const positions = {
      center:        { x: 0.5,  y: 0.45 },
      entrance:      { x: 0.5,  y: 0.85 },
      north:         { x: 0.5,  y: 0.15 },
      south:         { x: 0.5,  y: 0.75 },
      east:          { x: 0.8,  y: 0.45 },
      west:          { x: 0.2,  y: 0.45 },
      eye_level:     { x: 0.5,  y: 0.4  },
      overhead:      { x: 0.5,  y: 0.3  },
      ceiling:       { x: 0.5,  y: 0.1  },
      floor:         { x: 0.5,  y: 0.5  },
      perimeter:     { x: 0.5 + Math.cos(Date.now()/1000) * 0.35,
                       y: 0.45 + Math.sin(Date.now()/1000) * 0.3 },
      random_within: { x: 0.3 + Math.random() * 0.4,
                       y: 0.2 + Math.random() * 0.5 }
    };
    const base = positions[anchor.position] || positions.center;

    // Apply offset (meters → normalized, ~0.08 per meter)
    if (anchor.offset_m) {
      base.x += anchor.offset_m.x * 0.08;
      base.y -= anchor.offset_m.y * 0.08;  // y inverted
    }
    return base;
  }

  // --- MAIN RENDER LOOP ---
  render() {
    const ctx = this.ctx;
    const w = this.canvas.width;
    const h = this.canvas.height;

    // Clear with dark bg
    ctx.fillStyle = '#0a0a0f';
    ctx.fillRect(0, 0, w, h);

    // Draw boundary
    this.drawBoundary(ctx);

    // Evaluate and render active cues
    for (const cue of this.recipe.cues) {
      if (!this.isCueActive(cue)) continue;

      const layerType = cue.action.type;
      const layer = this.layers[layerType] ||
                    this.layers[layerType + '_action'];
      if (layer) {
        ctx.save();
        layer.render(ctx, cue, this.clock);
        ctx.restore();
      }
    }

    // Draw trigger zones (dotted circles for spatial triggers)
    this.drawTriggerZones(ctx);

    // Draw user avatar (draggable)
    this.drawUser(ctx);

    // Draw clock
    this.drawClock(ctx);

    if (this.playing) {
      this.clock += 1/60;
      requestAnimationFrame(() => this.render());
    }
  }

  // --- USER AVATAR (draggable!) ---
  drawUser(ctx) {
    const x = this.userPos.x * ctx.canvas.width;
    const y = this.userPos.y * ctx.canvas.height;

    // Glow ring
    ctx.beginPath();
    ctx.arc(x, y, 12, 0, Math.PI * 2);
    ctx.strokeStyle = 'rgba(255, 255, 255, 0.3)';
    ctx.lineWidth = 1;
    ctx.stroke();

    // Solid dot
    ctx.beginPath();
    ctx.arc(x, y, 6, 0, Math.PI * 2);
    ctx.fillStyle = '#ffffff';
    ctx.fill();

    // Label
    ctx.font = '10px monospace';
    ctx.fillStyle = '#888899';
    ctx.textAlign = 'center';
    ctx.fillText('👤 drag me', x, y + 24);
  }

  // --- SPATIAL TRIGGER ZONES ---
  drawTriggerZones(ctx) {
    for (const cue of this.recipe.cues) {
      if (cue.timing.type !== 'spatial') continue;
      const pos = this.anchorToCanvas(cue.timing.anchor);
      const radius = (cue.timing.radius_m || 2) * 0.08 * ctx.canvas.width;

      ctx.beginPath();
      ctx.arc(pos.x * ctx.canvas.width, pos.y * ctx.canvas.height,
              radius, 0, Math.PI * 2);
      ctx.setLineDash([4, 4]);
      ctx.strokeStyle = 'rgba(255, 255, 255, 0.15)';
      ctx.lineWidth = 1;
      ctx.stroke();
      ctx.setLineDash([]);
    }
  }

  // Bind mouse/touch events for dragging user avatar
  bindEvents() {
    this.canvas.addEventListener('mousedown', (e) => {
      const rect = this.canvas.getBoundingClientRect();
      const mx = (e.clientX - rect.left) / rect.width;
      const my = (e.clientY - rect.top) / rect.height;
      if (this.distance({ x: mx, y: my }, this.userPos) < 0.05) {
        this.draggingUser = true;
      }
    });
    this.canvas.addEventListener('mousemove', (e) => {
      if (!this.draggingUser) return;
      const rect = this.canvas.getBoundingClientRect();
      this.userPos.x = (e.clientX - rect.left) / rect.width;
      this.userPos.y = (e.clientY - rect.top) / rect.height;
      if (!this.playing) this.render();  // re-render on drag even when paused
    });
    this.canvas.addEventListener('mouseup', () => this.draggingUser = false);
  }

  distance(a, b) {
    return Math.sqrt((a.x - b.x) ** 2 + (a.y - b.y) ** 2);
  }
}

// ============================================
// USAGE IN SFERA STUDIO:
//
//   const stage = new SferaStage(
//     document.getElementById('sfera-stage-canvas'),
//     parsedSferaRecipe
//   );
//   stage.playing = true;
//   stage.render();
//
// The Score timeline scrubber sets stage.clock directly:
//   timelineScrubber.onScrub = (sec) => {
//     stage.clock = sec;
//     stage.render();
//   };
// ============================================



# ████████████████████████████████████████████████████████████
# BUILD CHECKLIST
# ████████████████████████████████████████████████████████████
#
# Before marking complete, verify:
#
# □ Layer 1: voxel-hours.js
#   □ generateAnchor returns "h3Index:floorCode:resolution"
#   □ generateVoxelKey returns "h3Index:floorCode:resolution:isoHour"
#   □ Two calls with same lat/lng/floor/res/time produce identical keys
#   □ checkHierarchyCollision detects parent-child overlaps
#   □ nearbyH3Cells returns correct k-ring at given resolution
#   □ temporalLayer correctly classifies past/present/future in UTC
#   □ All functions are pure — no side effects, no DB, no server
#
# □ Layer 2: server.js + seed.js + sfera.db
#   □ WAL mode enabled: db.pragma("journal_mode = WAL")
#   □ All tables created per schema
#   □ spatial_anchor column is UNIQUE in spheres table
#   □ Seed data uses Date.now() relative timestamps
#   □ 40-50 spheres seeded around LAT 39.9450, LNG -75.1615
#   □ 9 seed users created with hashed passwords
#   □ 8 Genesis Slate designs seeded with complete .sfera recipes
#   □ 8 active leases linking designs to spheres
#   □ Sample bookings and transactions seeded
#
# □ .sfera Format
#   □ Recipes stored in designs.sfera_recipe_json as valid JSON
#   □ Every recipe has space.required_hardware array
#   □ Every recipe has tracks[] and cues[] arrays
#   □ Cue timing uses exactly one of: time | spatial | event
#   □ Anchor positions are relative (never GPS coordinates)
#   □ Economics block has ticket_price_cents and replicability
#
# □ sfera-matrix.js
#   □ generateRecipeDefaults(awePillar, techInnovation) returns scaffold
#   □ buildMatchQuery(recipe) returns SQL-compatible filter object
#   □ All 8 AWE_DEFAULTS entries populated
#   □ All 8 TECH_DEFAULTS entries populated with hardware + economics
#
# □ Consumer App (port 3000)
#   □ Map renders H3 hex polygons (NOT pin markers)
#   □ Unclaimed cells shown as faint dotted outlines (ONLY at zoom >= 18)
#   □ Map does NOT render procedural void below zoom 18 (LOD rule)
#   □ Claimed cells filled with temporal layer colors
#   □ Venue tier styling: public / commercial (white border) / experimental (cyan pulse)
#   □ Tap hex → bottom sheet with details + CTA
#   □ Experiences tab shows deployed genesis slate
#   □ Book flow: tap → confirm → wallet deducted → booking created
#   □ Host Mode toggle in Profile shows owner controls
#   □ Claim flow uses floor confirmation dialog
#   □ All API routes return correct data
#   □ Static files served from public/
#
# □ Studio (port 3001)
#   □ 8×8 Matrix grid renders, cells clickable
#   □ Click cell → auto-populates recipe defaults
#   □ AI Director mode parses keywords → generates .sfera JSON
#   □ Score View: horizontal timeline with track lanes
#   □ Plot View: 2D top-down schematic with anchor positions
#   □ Stage View: SferaStage canvas animates recipe at 60fps
#   □ Dragging user avatar in Stage triggers spatial cues
#   □ Score scrubber syncs with Stage animation
#   □ Business Model Canvas auto-calculates from recipe + matrix
#   □ Find Space: matching engine filters by hardware compatibility
#   □ Lease & Deploy flow: wallet deduction → design status deployed
#   □ Static files served from /studio route on port 3000
#
# □ Integration
#   □ Single server on port 3000 serves Consumer + Studio + API
#   □ Consumer at localhost:3000/ and Studio at localhost:3000/studio
#   □ Single JWT_SECRET, single auth middleware
#   □ No CORS needed (same origin)
#   □ Design deployed in Studio appears as bookable in Consumer App
#   □ Booking made in Consumer App shows in Studio earnings
#   □ Money flows correctly: user → creator (- 10%) → owner
#
# ════════════════════════════════════════════════════════════
# END OF SFERA PLATFORM ENGINEERING SPECIFICATION
# ════════════════════════════════════════════════════════════
