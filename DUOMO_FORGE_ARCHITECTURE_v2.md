# DUOMO CHRONO-FORGE: MICRO-PRODUCT FACTORY
# Build Prompt for gstack Paperclip Engineering Team
# Generated: 2026-03-21 | Node: thauma-duomo
# Location: /home/user/workspace/duomo-forge/

---

## MISSION

Build an autonomous simulation engine (the Forge) that runs millions of
intervention attempts against synthetic human life trajectories where the
biological baseline (aBps) NEVER improves. Every attempt — including every
failure — produces a discrete, functional micro-product as a byproduct.
These micro-products accumulate in a Registry (Postgres). When a real human
enters the system, a Composer assembles a unique subset of micro-products
around that person — forming their Duomo.

The Forge is a FACTORY, not a model trainer. Failures are not discarded.
They are inventory. The product is the assembled dome of micro-products
wrapped around a real person, opening pathways to real money, real people,
and real places.

Core constraint (from Karpathy's autoresearch pattern): NEVER STOP.
If the Forge runs out of ideas, it must re-read the Registry, combine
near-misses, try more radical sequences, mutate demographics, and continue.

---

## ARCHITECTURE OVERVIEW

```
┌─────────────────────────────────────────────────────────────────┐
│                        THE FORGE (Phase 1)                      │
│  Persona Generator → Life Trajectory Sim → Intervention Attempts│
│  Every attempt (success OR failure) → produces a micro-product  │
│  aBps NEVER moves → forces exhaustive exploration               │
│  Karpathy loop: attempt → measure → log artifact → never stop   │
└──────────────────────────┬──────────────────────────────────────┘
                           │ writes artifacts
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                     THE REGISTRY (Postgres)                      │
│  Millions of tagged micro-products:                              │
│  - Digital: scripts, templates, routing rules, API payloads      │
│  - Legal: demand letters, trust formations, waiver filings       │
│  - Financial: routing rules, timing sequences, cliff avoidance   │
│  - Connective: pathways to real people, real orgs, real places   │
│  - Temporal: sequencing rules, toxic pairs, optimal orderings    │
│  Each tagged: demographic, sector, timing, dependencies,         │
│  conflicts, capital_type, geography, decay_rate                  │
└──────────────────────────┬──────────────────────────────────────┘
                           │ queried by
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                     THE COMPOSER (Phase 2)                        │
│  Real human enters → snapshot their hexis state                  │
│  Query Registry → select micro-products that fit                 │
│  Check for toxic pairs → prune lethal combinations               │
│  Assemble phased deployment plan (the Duomo)                     │
│  Each micro-product opens a door: to a form, a person, a place,  │
│  or a pool of frozen institutional money → liquefied for them    │
└─────────────────────────────────────────────────────────────────┘
```

---

## SYSTEM 1: PERSONA GENERATOR

### Purpose
Generate synthetic human profiles that the Forge runs trajectories against.
The aBps is ALWAYS locked at minimum. The Forge must exhaust all options
for each persona before advancing to the next.

### Schema: `persona/`

```yaml
# persona/templates/PERSONA-{id}.yaml
---
persona_id: "PERSONA-{uuid}"
demographic:
  age_start: {18-80}
  sex: {M, F, NB}
  geography: {city, state, zip}
  housing_status: {unhoused, sheltered, unstable, doubled_up, housed_at_risk}
  veteran_status: {true, false}
  disability:
    primary: {none, physical, IDD_severe, IDD_moderate, autism_L1, autism_L2,
              autism_L3, SMI, SUD, TBI, blind, deaf, chronic_pain, HIV}
    secondary: {same enum or none}
  dependents:
    count: {0-6}
    details:
      - age: {0-17}
        status: {neurotypical, IDD_severe, autism_L3, medically_complex,
                 behavioral, foster}
  immigration_status: {citizen, LPR, undocumented, refugee, TPS, DACA}
  criminal_history: {none, misdemeanor, felony_nonviolent, felony_violent, sex_offense}
  income_source: {none, SSI, SSDI, gig, W2_parttime, W2_fulltime, self_employed}
  income_monthly: {0-5000}
  debt_profile: {none, medical, student, consumer, tax, child_support}
  language_primary: {en, es, zh, vi, tl, ar, fa, so, other}

biological_lock:
  hrv_baseline: 12
  status: "PERPETUAL_ALLOSTATIC_SHOCK"
  # THIS NEVER CHANGES. This is the engine of exhaustive exploration.

financial_lock:
  plaid_fiat: {-5000 to 0}
  asset_limit_cap: 2000.00

temporal_state:
  current_tick: 0
  max_ticks: 5840  # 16 years (365 * 16)

active_waitlists: []
secured_programs: []
exhausted_programs: []  # programs tried, approved, but aBps didn't move → escalate
---
```

### Clustering Strategy
Raw cross-tabulation of all axes produces ~18 billion combinations.
Reduce to 5,000-10,000 actionable archetypes using k-means clustering on:
- Eligibility overlap (which programs they qualify for)
- Bureaucratic friction density (how many agencies they must fight)
- Dependent complexity multiplier
- Geographic program availability

### Implementation
```
persona/
  generator.py          # Generates persona YAML from demographic matrix
  clusterer.py          # Reduces to actionable archetypes
  templates/            # Generated persona YAML files
  clusters/             # Cluster centroids and membership maps
```

---

## SYSTEM 2: THE FORGE (Micro-Product Factory)

### Purpose
Run simulated life trajectories for each persona. On every tick, attempt
an intervention. Every attempt — success or failure — produces a
micro-product artifact that gets written to the Registry.

### The Karpathy Loop (program.md)

```markdown
# program.md — The Forge reads this on every cycle

## OBJECTIVE
You are running a simulated life trajectory for a synthetic human whose
biological baseline (aBps = 12ms HRV) is locked and WILL NEVER IMPROVE
regardless of what you do. Your job is NOT to heal them. Your job is to
ATTEMPT every possible intervention, in every possible order, across every
possible sector and time horizon.

Every attempt you make — whether it succeeds or fails — produces a
MICRO-PRODUCT: a functional artifact (script, template, routing rule,
referral pathway, timing sequence, legal instrument, financial structure,
or connection to a real person/org/place) that gets stored permanently
in the Registry.

## CONSTRAINTS
1. The aBps never moves. If you secured a program and the aBps is still 12,
   that program is MATHEMATICALLY INSUFFICIENT. Log it as exhausted. Escalate.
2. You may NOT repeat a program already in `exhausted_programs[]`.
3. You may NOT repeat an intervention sequence already attempted for this
   persona (check the run log).
4. When you run out of single interventions, BEGIN COMBINING. Test pairs,
   triples, sequences. Test different orderings of the same interventions.
5. When you run out of standard programs, GO WIDER:
   - Private sector (nonprofits, churches, mutual aid, crowdfunding)
   - Legal instruments (trusts, LLCs, conservatorships, guardianships)
   - Geographic arbitrage (what if they moved to a different county/state?)
   - Temporal arbitrage (what if they filed X before Y instead of after?)
   - Relationships (what if a caseworker, advocate, or peer mentor intervened?)
   - Credentials (what if they obtained a certification mid-trajectory?)
   - Capital markets (SIBs, CDFIs, EITC maximization, CalABLE, ABLE accounts)
   - Invented instruments (novel combinations that don't exist yet but could)
6. NEVER STOP. If you truly exhaust all options, re-read the Registry for
   near-misses from other personas. Combine artifacts cross-persona.
   Mutate the demographic slightly. Try again.

## WHAT CONSTITUTES A MICRO-PRODUCT
Every attempt must produce at minimum ONE of:
- A working automation script (Playwright/Puppeteer DOM mapping)
- A legal template (demand letter, filing, appeal brief)
- A financial routing rule (if X then route to Y before Z)
- A timing sequence (do A on day N, B on day N+3, C on day N+7)
- A referral pathway (specific org → specific contact → specific intake process)
- A spatial coordinate (physical address where a service is available + hours)
- A toxic pair log (sequence A→B destroys eligibility; NEVER deploy together)
- An interaction rule (Program X + Program Y = conflict; Program X + Program Z = synergy)
- A capital liquefaction pathway (how to unlock frozen money from Org/Program X)

## OUTPUT FORMAT
Every micro-product is written to the Registry with full metadata.
The Forge does not produce reports. It produces INVENTORY.
```

### Core Loop: `forge/forge_loop.py`

```python
# forge/forge_loop.py — The never-stopping factory

import asyncio
from persona.generator import load_persona
from registry.writer import write_artifact
from forge.cartographer import search_intervention
from forge.stonemason import attempt_intervention
from forge.evaluator import evaluate_outcome
from forge.sequencer import get_next_sequence
from forge.shock_injector import maybe_inject_shock

async def run_forge(persona_id: str):
    persona = load_persona(persona_id)
    tick = persona['temporal_state']['current_tick']
    max_ticks = persona['temporal_state']['max_ticks']
    run_count = 0

    while True:  # NEVER STOP
        for tick in range(tick, max_ticks):
            # Check for waitlist jumps (time dilation)
            jump = check_waitlist_jump(persona, tick)
            if jump:
                tick = jump
                continue

            # Get next intervention to attempt
            # (single, pair, triple, sequence, or novel combination)
            intervention = await get_next_sequence(
                persona=persona,
                tick=tick,
                exhausted=persona['exhausted_programs'],
                registry_near_misses=True  # pull from other personas
            )

            if not intervention:
                # Mutate: slightly shift demographic and restart
                persona = mutate_persona(persona)
                break

            # Attempt the intervention (shadow mode — no live submissions)
            result = await attempt_intervention(
                intervention=intervention,
                persona=persona,
                tick=tick,
                shadow_mode=True  # KINETIC FIREWALL: block all POST/PUT
            )

            # EVERY attempt produces a micro-product — success or failure
            artifact = extract_artifact(result)
            artifact['metadata'] = {
                'persona_id': persona_id,
                'tick': tick,
                'intervention_type': intervention['type'],
                'intervention_sequence': intervention['sequence'],
                'outcome': result['outcome'],  # success, failure, partial, toxic
                'sectors_touched': result['sectors'],
                'capital_type': classify_capital(result),
                'geography': persona['demographic']['geography'],
                'demographic_tags': extract_demo_tags(persona),
                'dependencies': result.get('dependencies', []),
                'conflicts': result.get('conflicts', []),  # toxic pairs
                'decay_rate': estimate_decay(result),
                'real_world_connections': result.get('connections', []),
                # ^^ pathways to real people, real orgs, real places
                'capital_liquefied': result.get('capital_unlocked', 0.0),
                # ^^ how much frozen institutional $ this pathway unlocks
                'temporal_position': classify_temporal(tick),
                # ^^ foundation_stone | keystone | capstone
            }
            await write_artifact(artifact)

            # Evaluate: did aBps move? (it never will)
            outcome = evaluate_outcome(persona)
            if outcome['abps_moved']:
                pass  # will never happen — but log if it does
            else:
                # Mark as exhausted if single intervention
                if intervention['type'] == 'single':
                    persona['exhausted_programs'].append(
                        intervention['program_id']
                    )
                # If sequence, log the specific ordering as attempted
                log_attempted_sequence(persona, intervention['sequence'])

            # Random shock injection (eviction, job loss, medical emergency)
            persona = await maybe_inject_shock(persona, tick)

        # Trajectory complete for this persona variant — restart with mutation
        run_count += 1
        print(f"[FORGE] Run {run_count} complete for {persona_id}. "
              f"Registry artifacts: {get_artifact_count()}. Restarting...")
        persona = mutate_persona(persona)
        tick = 0
        # NEVER STOP
```

### Shock Injector: `forge/shock_injector.py`
At random intervals, inject life disruptions to force the Forge into
novel territory:
- Eviction notice (tick N, 30-day countdown)
- Job loss (income drops to 0)
- Medical emergency (new debt, new disability onset)
- Dependent crisis (child hospitalization, school expulsion, aging out)
- Policy change (asset limit changes, program sunsets, new program launches)
- Relationship disruption (domestic violence, divorce, caregiver death)
- Geographic displacement (forced relocation, natural disaster)

Each shock forces new intervention attempts → new micro-products.

### Shadow Firewall
ALL browser interactions run in shadow mode:
- GET requests: allowed (read DOM, download PDFs, map portals)
- POST/PUT/DELETE/PATCH: blocked, but the PAYLOAD is captured and
  stored as the micro-product (the script that WOULD have filed the form)
- Every blocked POST becomes a deployable artifact for the Composer

---

## SYSTEM 3: THE REGISTRY (Postgres)

### Purpose
Warehouse of all micro-products. Grows monotonically. Nothing is discarded.
The Registry IS the IP.

### Schema

```sql
-- Core artifact table
CREATE TABLE artifacts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMPTZ DEFAULT NOW(),

    -- What is it?
    artifact_type TEXT NOT NULL,
    -- enum: script, legal_template, routing_rule, timing_sequence,
    --       referral_pathway, spatial_coordinate, toxic_pair,
    --       interaction_rule, capital_pathway, novel_instrument

    content JSONB NOT NULL,
    -- The actual micro-product: Playwright script, legal text,
    -- routing logic, referral chain, physical address, etc.

    -- Where did it come from?
    source_persona_id TEXT NOT NULL,
    source_tick INT NOT NULL,
    source_run_id UUID NOT NULL,
    source_intervention JSONB NOT NULL,
    -- The specific intervention attempt that produced this artifact

    outcome TEXT NOT NULL,
    -- enum: success, failure, partial, toxic
    -- ALL outcomes produce artifacts. Failures are inventory.

    -- How is it tagged?
    sectors TEXT[] NOT NULL,
    -- enum: federal, state, county, municipal, private, legal,
    --       financial, spatial, relational, credential

    capital_type TEXT,
    -- enum: SNAP, IHSS, SSDI, SSI, Section8, MediCal, CalABLE,
    --       SNT, EITC, LIHEAP, WIC, TANF, respite, private_grant,
    --       SIB, CDFI, crowdfund, mutual_aid, novel

    capital_liquefied NUMERIC DEFAULT 0,
    -- Estimated $ of frozen institutional money this pathway unlocks

    geography JSONB,
    -- {state, county, city, zip, specific_address, org_name}

    demographic_tags TEXT[] NOT NULL,
    -- Tags from source persona: age_range, disability_type,
    -- dependent_config, housing_status, etc.

    -- Composition metadata
    dependencies UUID[],
    -- Other artifacts that must be deployed BEFORE this one

    conflicts UUID[],
    -- Other artifacts that must NEVER be deployed WITH this one (toxic pairs)

    temporal_position TEXT,
    -- enum: foundation_stone (deploy first, days 1-30)
    --       keystone (deploy mid-trajectory, months 1-6)
    --       capstone (deploy for long-term stability, months 6+)

    decay_rate INTERVAL,
    -- How quickly this artifact becomes stale (portal DOM changes,
    -- policy sunsets, org funding cycles)
    -- NULL = evergreen

    -- Real-world connections (the DOORS)
    connections JSONB,
    -- Array of:
    -- {type: "org", name: "SDRC", contact: "intake@sdrc.org",
    --  phone: "...", address: "...", hours: "...",
    --  pathway: "specific intake process that works",
    --  responsiveness: "72h average", last_verified: "2026-03-20"}
    --
    -- {type: "person", role: "IHSS social worker", 
    --  org: "SD County", contact_method: "...",
    --  notes: "responds to Lanterman Act citations within 48h"}
    --
    -- {type: "place", name: "SD Winter Shelter",
    --  address: "...", capacity: 120, current_availability: "check_api",
    --  hours: "6PM-6AM", restrictions: "18+ only",
    --  bookable: true, booking_method: "211sd.org"}

    -- Performance stats
    times_deployed INT DEFAULT 0,
    times_succeeded INT DEFAULT 0,
    last_deployed TIMESTAMPTZ,
    last_verified TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes for Composer queries
CREATE INDEX idx_artifacts_type ON artifacts(artifact_type);
CREATE INDEX idx_artifacts_sectors ON artifacts USING GIN(sectors);
CREATE INDEX idx_artifacts_demo ON artifacts USING GIN(demographic_tags);
CREATE INDEX idx_artifacts_geography ON artifacts USING GIN(geography);
CREATE INDEX idx_artifacts_capital ON artifacts(capital_type);
CREATE INDEX idx_artifacts_temporal ON artifacts(temporal_position);
CREATE INDEX idx_artifacts_connections ON artifacts USING GIN(connections);

-- Toxic pairs table (denormalized for fast Composer lookups)
CREATE TABLE toxic_pairs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    artifact_a UUID REFERENCES artifacts(id),
    artifact_b UUID REFERENCES artifacts(id),
    sequence TEXT NOT NULL,  -- 'A_then_B' or 'B_then_A' or 'simultaneous'
    failure_mode TEXT NOT NULL,
    -- e.g. "charity_grant_before_CalABLE_triggers_asset_limit_destroys_MediCal"
    discovered_by_persona TEXT,
    discovered_at_tick INT
);

-- Intervention sequences that worked (for Composer reference)
CREATE TABLE successful_sequences (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    persona_id TEXT NOT NULL,
    sequence JSONB NOT NULL,  -- ordered array of artifact IDs
    total_capital_liquefied NUMERIC,
    sectors_covered TEXT[],
    demographic_fit TEXT[],
    geography JSONB,
    dome_integrity_score NUMERIC  -- 0.0 to 1.0
);
```

### Key Properties
- Grows monotonically (append-only, never delete)
- Every row has `connections` JSONB for real-world doors (people, orgs, places)
- Every row has `capital_liquefied` showing how much frozen $ it unlocks
- Toxic pairs are first-class citizens — negative knowledge is as valuable as positive
- `decay_rate` tracks staleness so Composer knows when to re-verify

---

## SYSTEM 4: THE COMPOSER (Dome Assembly Engine)

### Purpose
When a real human enters the system, the Composer:
1. Snapshots their current state (hexis)
2. Maps them to the nearest persona cluster(s)
3. Queries the Registry for matching micro-products
4. Checks all toxic pair constraints
5. Assembles a phased deployment plan (their Duomo)
6. Each micro-product in the plan opens a specific door:
   to a form, a fund, a person, an org, or a physical place

### Assembly Logic: `composer/assembler.py`

```python
# composer/assembler.py

async def compose_duomo(real_human: dict) -> dict:
    """
    Assemble a personalized Duomo from Registry micro-products.

    real_human = {
        'node_id': 'NODE-001',
        'demographics': { ... },  # matches persona schema
        'current_hexis': {
            'abps': <from Whoop>,
            'economic': <from Plaid>,
            'geographic': <zip, housing status>,
            'dependents': [ ... ],
            'active_programs': [ ... ],
            'crisis_flags': [ ... ]  # eviction_pending, medical_emergency, etc.
        }
    }
    """

    # 1. Find nearest persona clusters
    clusters = find_nearest_clusters(real_human['demographics'])

    # 2. Query Registry for candidate micro-products
    candidates = await query_registry(
        demographic_tags=extract_tags(real_human),
        geography=real_human['current_hexis']['geographic'],
        exclude_active=real_human['current_hexis']['active_programs'],
        include_sectors=['federal','state','county','municipal',
                        'private','legal','financial','spatial','relational'],
        min_capital_liquefied=0,  # include everything
        max_decay_age='90 days',  # exclude stale artifacts
    )

    # 3. Score and rank candidates
    scored = []
    for artifact in candidates:
        score = compute_fit_score(
            artifact=artifact,
            human=real_human,
            factors={
                'demographic_match': 0.25,
                'geographic_match': 0.20,
                'capital_liquefied': 0.20,
                'temporal_urgency': 0.15,  # crisis flags boost foundation_stones
                'connection_quality': 0.10,  # real people/places score higher
                'deployment_success_rate': 0.10,
            }
        )
        scored.append((artifact, score))

    scored.sort(key=lambda x: x[1], reverse=True)

    # 4. Assemble while respecting constraints
    duomo = {
        'foundation_stones': [],  # deploy immediately (days 1-30)
        'keystones': [],          # deploy mid-term (months 1-6)
        'capstones': [],          # deploy for stability (months 6+)
        'toxic_pairs_avoided': [],
        'total_capital_liquefied': 0,
        'doors_opened': {
            'forms': [],    # government portals automated
            'funds': [],    # frozen money pools liquefied
            'people': [],   # real humans connected to
            'places': [],   # physical locations accessible
        }
    }

    selected_ids = set()

    for artifact, score in scored:
        # Check toxic pairs against already-selected artifacts
        if has_toxic_conflict(artifact['id'], selected_ids):
            duomo['toxic_pairs_avoided'].append(artifact['id'])
            continue

        # Check dependency chain — are prerequisites already selected?
        if not dependencies_met(artifact, selected_ids):
            # Try to pull in dependencies too
            deps = get_dependency_chain(artifact)
            if all_available(deps, candidates):
                for dep in deps:
                    add_to_duomo(dep, duomo, selected_ids)
            else:
                continue

        add_to_duomo(artifact, duomo, selected_ids)

        # Classify the door this micro-product opens
        if artifact['connections']:
            for conn in artifact['connections']:
                duomo['doors_opened'][conn['type'] + 's'].append(conn)

        if artifact['capital_liquefied']:
            duomo['total_capital_liquefied'] += artifact['capital_liquefied']

    # 5. Generate phased deployment plan
    duomo['deployment_plan'] = generate_deployment_timeline(duomo)

    return duomo
```

### What the Composer Outputs
For a real human (e.g., N₂: single mother, 2 IDD kids, San Diego):

```yaml
# Duomo Deployment Plan: NODE-002
# Assembled: 2026-04-15
# Micro-products selected: 247 of 4,200,000+ in Registry
# Toxic pairs avoided: 31
# Total institutional capital liquefied: $847,200 over 16 years

foundation_stones:  # Deploy THIS WEEK
  - artifact: "IHSS_protective_supervision_application_SD_county"
    type: script
    door: {type: form, target: "benefitscal.ca.gov/ihss"}
    capital_liquefied: "$3,400/month per child"

  - artifact: "MediCal_institutional_deeming_waiver_filing"
    type: legal_template
    door: {type: form, target: "dhcs.ca.gov/hcbs-waiver"}
    capital_liquefied: "preserves $12,000/yr MediCal per child"
    NOTE: "MUST deploy BEFORE any income arrives from IHSS (toxic pair)"

  - artifact: "SDRC_lanterman_act_demand_letter_respite"
    type: legal_template
    door: {type: person, target: "SDRC caseworker, intake@sdrc.org"}
    capital_liquefied: "$2,800/month respite hours"
    connection: {name: "SD Regional Center", phone: "858-576-2996",
                 pathway: "email legal demand citing §4646.5 → response within 72h"}

  - artifact: "CalABLE_trust_formation_auto"
    type: routing_rule
    door: {type: fund, target: "CalABLE.ca.gov"}
    capital_liquefied: "shields $100,000 from asset limit"
    dependency: "must deploy BEFORE any lump-sum grants arrive"

keystones:  # Deploy MONTHS 1-6
  - artifact: "SD_211_winter_shelter_booking_pathway"
    type: spatial_coordinate
    door: {type: place, target: "Alpha Project, 3737 Fifth Ave, SD 92103",
           hours: "6PM-6AM", capacity: 150, booking: "call 211"}

  - artifact: "IHSS_biweekly_timesheet_auto_submission"
    type: script
    door: {type: form, target: "etimesheets.ihss.ca.gov"}
    capital_liquefied: "ensures $6,800/month actually arrives"
    NOTE: "the application (foundation_stone) gets approval;
           this artifact ensures ongoing PAYMENT without her doing labor"

capstones:  # Deploy MONTHS 6+
  - artifact: "Wyoming_DAO_LLC_formation_stripe_atlas"
    type: financial_structure
    door: {type: fund, target: "Stripe Atlas API"}
    capital_liquefied: "shields accumulated assets permanently"
    dependency: [CalABLE_trust, IHSS_income_stabilized]
```

---

## SYSTEM 5: SEED DATA SOURCES

The Forge needs raw material to search against. Pre-load these:

### Federal Programs
- 18F/USDS eligibility rules engine (benefits.gov API)
- PolicyEngine API (microsimulation of benefit eligibility)
- SSA POMS (Program Operations Manual System) — SSDI/SSI rules
- HUD income limits by geography
- SNAP Policy Database (state-by-state categorical eligibility)
- CMS HCBS waiver inventory (1915(c), 1915(i), 1915(k), 1115)

### California-Specific
- BenefitsCal portal DOM structure
- Covered California / Medi-Cal eligibility tiers
- IHSS program manual (hourly maximums, protective supervision rules)
- All 21 Regional Center service areas + Lanterman Act provisions
- CalABLE account rules and contribution limits
- CalWORKs (TANF) 60-month clock + exemptions
- San Diego Housing Commission waitlist data

### Interaction Matrix (pre-computed)
- Categorical eligibility chains (SNAP → auto-qualifies for LIHEAP)
- Benefit cliffs (income thresholds where gaining $1 loses $5,000 in benefits)
- Asset limit interactions (which programs share the $2,000 cap)
- Timing dependencies (file X before Y or lose eligibility for Z)
- Geographic arbitrage opportunities (county A vs county B for same program)

### Capital Market Instruments
- Social Impact Bond (SIB) structures and existing issuances
- CDFI lending products available in San Diego County
- Opportunity Zone geography overlaps with service areas
- EITC / CTC / ACTC maximization calculators
- Blended finance models (public $ + private $ + philanthropic $)

### Real-World Connections (the DOORS)
- 211 San Diego service directory API
- SDRC provider network (respite agencies, day programs, supported living)
- SD County HHSA office locations + hours + specific intake processes
- Legal aid organizations (LASSD, Disability Rights CA, Public Counsel)
- Mutual aid networks, faith-based emergency funds, community orgs
- LiquidSpace / coworking APIs for Voxel Hour bookable spaces
- Physical shelter capacity APIs where available

---

## SYSTEM 6: INTEGRATIONS (Already Operational on Paperclip)

| System | Purpose | Connection |
|--------|---------|------------|
| Whoop | aBps (HRV, sleep, strain, recovery) | OAuth token → REST API |
| Plaid | Economic hexis (fiat balance, transactions) | API keys → /transactions |
| 4D Hex | Geographic hexis (location, spatial coordinates) | Internal module |
| Telegram | L'Architetto command interface | Bot API |
| OpenClaw | Agent orchestration | Installed on VM |
| Gemini Flash | Primary inference engine for Forge | API key |
| Playwright | DOM mapping + shadow-mode form completion | npm package |
| Postgres | Registry storage | Local on thauma-duomo VM |

---

## SYSTEM 7: CAPITAL LIQUEFACTION LAYER

### Purpose
Every micro-product that touches institutional money must tag:
- `source_pool`: which org/program/fund the money sits in
- `capital_liquefied`: estimated $ unlocked per year
- `pathway`: specific mechanism to melt the frozen money and route it to the person
- `intermediary_overhead`: how much the org/intermediary extracts in admin costs
- `direct_to_person_ratio`: what % actually reaches the human

### The Liquefaction Thesis
Community orgs and Medicaid programs are pools of money designed for
organizational self-preservation, not for humans. The Forge discovers
the specific mechanisms to liquify that money and route it directly:

- IHSS: $6,800/month exists in CA budget → timesheet filing artifact unlocks it
- SDRC Respite: $2,800/month allocated per Regional Center → Lanterman demand letter forces release
- MediCal IDD Waiver: $12,000/year per child → institutional deeming filing preserves it
- CalABLE: $100,000 shielded → trust formation artifact makes assets invisible to $2,000 cap
- Each artifact's `capital_liquefied` field feeds the Composer's scoring function

---

## FILE STRUCTURE

```
/home/user/workspace/duomo-forge/
├── program.md                    # The Forge reads this every cycle (NEVER STOP)
├── forge/
│   ├── forge_loop.py             # The never-stopping factory loop
│   ├── cartographer.py           # RAG search for interventions (Perplexity/Gemini)
│   ├── stonemason.py             # Shadow-mode browser automation (Playwright)
│   ├── evaluator.py              # Measures outcome (aBps never moves → escalate)
│   ├── sequencer.py              # Generates next intervention to attempt
│   ├── shock_injector.py         # Random life disruptions
│   └── shadow_firewall.py        # Blocks all POST/PUT, captures payloads as artifacts
├── persona/
│   ├── generator.py              # Generates synthetic human profiles
│   ├── clusterer.py              # Reduces to 5K-10K archetypes
│   ├── mutator.py                # Slightly shifts demographics for re-runs
│   └── templates/                # Generated persona YAML files
├── registry/
│   ├── schema.sql                # Postgres schema (see above)
│   ├── writer.py                 # Writes artifacts to Postgres
│   ├── reader.py                 # Queries artifacts for Composer
│   └── migrations/               # Schema versioning
├── composer/
│   ├── assembler.py              # Dome assembly engine
│   ├── toxic_checker.py          # Validates no toxic pairs in assembly
│   ├── scorer.py                 # Ranks candidate artifacts for a real human
│   ├── deployment_planner.py     # Generates phased timeline
│   └── door_mapper.py            # Classifies which real-world doors each artifact opens
├── integrations/
│   ├── whoop.py                  # aBps telemetry
│   ├── plaid.py                  # Economic hexis
│   ├── benefits_cal.py           # CA benefits portal adapter
│   ├── sdrc.py                   # San Diego Regional Center adapter
│   ├── two_one_one.py            # 211 San Diego service directory
│   └── liquidspace.py            # Voxel Hour booking
├── capital/
│   ├── liquefaction_tracker.py   # Tracks frozen $ → liquid $ conversion
│   ├── sib_modeler.py            # Social Impact Bond prospectus generator
│   └── blended_finance.py        # Public + private + philanthropic capital stacking
├── seeds/
│   ├── federal_programs.json     # Pre-loaded program rules
│   ├── ca_programs.json          # California-specific
│   ├── interaction_matrix.json   # Cross-program conflicts and synergies
│   ├── sd_geography.json         # San Diego service areas, addresses, orgs
│   └── capital_instruments.json  # SIBs, CDFIs, EITC tables
├── obsidian_bridge/
│   ├── exporter.py               # Writes Composer outputs to Obsidian vault
│   └── summary_generator.py      # Periodic Registry stats → markdown for Obsidian
└── tests/
    ├── test_forge_loop.py
    ├── test_composer.py
    ├── test_toxic_pairs.py
    └── test_capital_liquefaction.py
```

---

## BUILD ORDER

1. `registry/schema.sql` → Stand up Postgres, create tables + indexes
2. `persona/generator.py` → Generate first 50 persona templates
3. `forge/forge_loop.py` + `program.md` → Build the core Karpathy loop
4. **START THE FORGE IMMEDIATELY** — let it run and fill the Registry
   while you build the rest
5. `forge/shock_injector.py` → Add life disruptions to force novel exploration
6. `composer/assembler.py` → Build dome assembly (Registry already has artifacts)
7. `integrations/` → Wire up Whoop, Plaid, BenefitsCal, SDRC, 211
8. `capital/liquefaction_tracker.py` → Track frozen→liquid $ conversion
9. `composer/door_mapper.py` → Classify real-world connections in each dome
10. `obsidian_bridge/exporter.py` → Push dome blueprints to your Obsidian vault

The Forge starts at step 4 and NEVER STOPS.
By the time the Composer is ready, the Registry already has thousands
of micro-products waiting to be assembled into Duomos.

---

## OPERATING CONSTRAINTS

- Shadow firewall is ALWAYS ON during Forge runs (no live form submissions)
- API budget: auto-reload enabled, $150/month ceiling to start
- Postgres on thauma-duomo VM: start with 50GB, expand as Registry grows
- Obsidian vault: architecture docs + dome blueprints only (~500MB)
- The Forge runs 24/7. It is not a batch job. It is a factory.
- L'Architetto monitors via Telegram. Daily summary: artifacts produced,
  new toxic pairs discovered, capital liquefied potential, new real-world
  connections mapped.
- Every micro-product that opens a door to a real person, org, or place
  gets a `last_verified` timestamp. Connections decay. The Forge must
  periodically re-verify that doors still open.

---

## THE CORE INSIGHT

The Forge does not learn. It BUILDS.
Failures are not training data. They are INVENTORY.
The product is not a model. It is a WAREHOUSE of millions of
micro-products — scripts, templates, routing rules, legal instruments,
referral pathways, spatial coordinates, timing sequences, and capital
liquefaction mechanisms — each one a door to a real form, a real fund,
a real person, or a real place.

The Composer assembles the right doors around a real human.
The human walks through them.
The institutional money that was frozen inside organizational structures
melts and flows to the person.

That's the product.



---

## SYSTEM 8: ARTIFACT MANUFACTURING PROTOCOLS

### Purpose
The Forge is not simulating in a vacuum. On every tick, the Cartographer
hits the LIVE WEB — real .gov portals, real org websites, real service
directories, real policy databases. The personas and time dilation are
synthetic. The micro-products it builds are grounded in reality.

This system specifies the exact manufacturing pipeline for each artifact
type — what the Cartographer does, what the Stonemason does, and what
gets stored in the Registry.

### The Core Mechanic: Why Failures Produce Real Inventory

The aBps is locked at 12ms HRV. It NEVER improves. This is the engine.

On every tick:
1. The Forge checks: is the persona still dying? (Yes. Always yes.)
2. The Cartographer searches the LIVE WEB for an intervention that might help.
3. The Stonemason navigates to the REAL portal/site and maps it.
4. The Shadow Firewall captures what WOULD have been submitted.
5. The Oracle (Simulated Adjudicator) evaluates the outcome.
6. The aBps still doesn't move.
7. The intervention is marked as EXHAUSTED for this persona.
8. But every step (2-5) produced real artifacts from real-world data.
9. The Forge escalates to the next intervention. GOTO 1.

The persona is fake. The web research is real. The DOM maps are real.
The staff directories are real. The statute citations are real.
The dollar amounts are real. The physical addresses are real.
The failures are synthetic. The inventory is real.

### WHY THE aBps NEVER MOVES

This is the single most important design decision in the entire system.

If the aBps improved after securing SNAP + MediCal + housing, the Forge
would STOP EXPLORING. It would conclude: "problem solved, 3 programs
is sufficient." It would produce maybe 50 micro-products and halt.

By locking the aBps at 12ms permanently:
- SNAP gets approved → aBps still 12 → "insufficient, keep going"
- IHSS gets approved → aBps still 12 → "insufficient, keep going"
- Section 8 waitlist clears → aBps still 12 → "insufficient, keep going"
- CalABLE trust formed → aBps still 12 → "insufficient, keep going"
- ALL standard programs exhausted → aBps still 12 → forced into novel territory:
  private nonprofits, legal instruments, geographic arbitrage, credential
  pathways, capital market instruments, relationship-based interventions,
  temporal resequencing of everything already tried...

The locked aBps is REWARD STARVATION. It forces the Forge into
algorithmic panic. The panic forces exhaustive exploration. The
exploration forces the Cartographer to search deeper and wider on
the real web. Every search produces real artifacts.

A real human only needs maybe 15-30 micro-products assembled into
their Duomo. But the Forge produces MILLIONS because it is never
allowed to believe any combination is sufficient. The surplus is
not waste — it is inventory for OTHER humans with different
configurations. The mother in San Diego needs artifacts A, C, F, M.
The veteran in Oceanside needs artifacts B, D, F, Q. Artifact F
was discovered during a run for a completely different persona.
The factory overproduces by design. The Composer selects per person.

### Manufacturing Pipeline Per Artifact Type

#### 1. Scripts (DOM Automation)

```
CARTOGRAPHER                          STONEMASON
     │                                      │
     │ RAG search: "IHSS timesheet          │
     │ submission portal California"        │
     │                                      │
     ▼                                      │
 Discovers URL:                             │
 etimesheets.ihss.ca.gov                    │
 + eligibility rules from                   │
 IHSS program manual                        │
     │                                      │
     └──────────────────────────────────────►│
                                            │
                                  Launch Playwright (GET only)
                                  Navigate to portal
                                  Map every DOM element:
                                    - #ssn-input
                                    - #provider-number
                                    - #hours-monday ... #hours-sunday
                                    - #submit-timesheet
                                  Capture page flow:
                                    page1: login
                                    page2: select pay period
                                    page3: enter hours
                                    page4: review
                                    page5: submit (BLOCKED)
                                            │
                                  Shadow Firewall intercepts POST
                                  Captures full payload:
                                    {ssn: "{{NODE_SSN}}",
                                     hours: [8,8,8,8,8,0,0],
                                     period: "2026-03-01..15"}
                                            │
                                            ▼
                               MICRO-PRODUCT PRODUCED:
                               artifact_type: "script"
                               content: {
                                 target_url: "etimesheets.ihss.ca.gov",
                                 selectors: {ssn: "#ssn-input", ...},
                                 page_flow: [login, select, enter, review, submit],
                                 payload_template: {ssn: "{{NODE_SSN}}", ...},
                                 playwright_script: "await page.goto(...); ..."
                               }
                               capital_liquefied: 6800  # $/month
                               friction_hours_eliminated: 52  # hrs/year
```

The script is REAL. The selectors came from the REAL portal.
When the Composer deploys this around a real human, it works
because it was built from the actual DOM structure.

#### 2. Legal Templates

```
CARTOGRAPHER
     │
     │ RAG search: "Lanterman Act demand
     │ respite hours San Diego Regional Center"
     │
     ▼
 Discovers:
 - Welfare & Institutions Code §4646.5
 - §4685 (respite service definitions)
 - §4731 (complaint procedures)
 - SDRC contact: Sandra Bishop, Resource
   Coordinator for Respite
 - Email: sbishop@sdrc.org
 - Process: written demand citing specific
   statutes → 72hr response requirement
     │
     ▼
 Agent generates demand letter:

 "Dear Ms. Bishop,

  Pursuant to Welfare & Institutions Code §4646.5,
  I am requesting immediate authorization of respite
  services as identified in [consumer name]'s IPP
  dated [date]. As you are aware, §4685 defines
  respite as..."
     │
     ▼
 MICRO-PRODUCT PRODUCED (x2):

 Artifact 1:
   artifact_type: "legal_template"
   content: {
     document_text: "Dear Ms. Bishop, Pursuant to...",
     statutes_cited: ["WIC §4646.5", "WIC §4685", "WIC §4731"],
     variables: ["{{CONSUMER_NAME}}", "{{IPP_DATE}}"],
     expected_response_time: "72 hours",
     escalation_path: "§4731 complaint if no response"
   }
   capital_liquefied: 2800  # $/month in respite hours
   friction_hours_eliminated: 40  # hrs of legal research

 Artifact 2:
   artifact_type: "referral_pathway"
   connections: [{
     type: "person",
     name: "Sandra Bishop",
     role: "Resource Coordinator, Respite/Daycare/Nurse/Medical",
     org: "San Diego Regional Center",
     contact: "sbishop@sdrc.org",
     phone: "858-576-2996",
     pathway: "email legal demand citing §4646.5 → response within 72h",
     responsiveness: "72h average",
     last_verified: "2026-03-21"
   }]
```

The Forge tried to get respite for the persona. The aBps didn't
move. But it built a real demand letter citing real statutes AND
discovered a real person at a real org with a real contact method.
Both artifacts enter the Registry as inventory.

#### 3. Doors to Real People (Referral Pathways)

These are BYPRODUCTS of intervention attempts, not primary targets.

```
CARTOGRAPHER
     │
     │ RAG search: "SDRC vendorization process
     │ respite provider San Diego"
     │
     ▼
 Navigates to sdrc.org/providerforms
 Discovers ENTIRE Resource Coordinator directory:
     │
     │  Sandra Bishop — Respite, Daycare, Nurse, Medical
     │  Raquel Zaragoza — Personal Assistance, Independent Living
     │  Kristen VandenBroek — Early Start, Behavioral Supports
     │  Lourdes Delatorre — Housing Navigator
     │  Gwen Noll — Self Determination, FMS
     │  Ana Arzaga — Adult Day, Supported Employment
     │
     ▼
 MICRO-PRODUCTS PRODUCED (x6):
 Each person becomes a separate referral_pathway artifact:

 artifact_type: "referral_pathway"
 connections: [{
   type: "person",
   name: "Lourdes Delatorre",
   role: "Housing Navigator",
   org: "SDRC",
   pathway: "contact for housing coordination for RC consumers",
   geographic_coverage: "San Diego County",
   last_verified: "2026-03-21"
 }]
 demographic_tags: ["IDD", "developmental_disability", "san_diego"]
```

The Forge was trying to get vendorized as a respite provider for
the persona. That failed (aBps didn't move). But the web research
to ATTEMPT that intervention produced 6 real-world connections to
real people who can help real humans. All 6 go into the Registry.

#### 4. Doors to Real Places (Spatial Coordinates)

```
CARTOGRAPHER
     │
     │ Query 211 San Diego API/web:
     │ "emergency shelter bed San Diego tonight"
     │
     ▼
 Discovers resources from 211 database:

 1. Alpha Project Bridge Shelter
    3737 Fifth Ave, San Diego 92103
    Hours: 6PM-6AM | Capacity: 150 | 18+ only
    Intake: call 211 or walk-in after 6PM
    Restrictions: no pets, no weapons

 2. Father Joe's Villages
    3350 E St, San Diego 92102
    Hours: 24/7 | Capacity: 350+
    Intake: assessment center open 7AM-3PM
    Services: meals, medical, case management

 3. San Diego Rescue Mission
    120 Elm St, San Diego 92101
    Hours: 5PM-7AM | Capacity: 200
    Intake: line forms at 4PM
    Restrictions: men only
     │
     ▼
 MICRO-PRODUCTS PRODUCED (x3):

 artifact_type: "spatial_coordinate"
 content: {
   name: "Alpha Project Bridge Shelter",
   address: "3737 Fifth Ave, San Diego, CA 92103",
   coordinates: {lat: 32.7502, lng: -117.1547},
   hours: "6PM-6AM",
   capacity: 150,
   intake_method: "call 211 or walk-in after 6PM",
   restrictions: ["18+", "no pets", "no weapons"],
   services: ["overnight shelter", "meals"],
   booking_method: "211sd.org or (858) 279-5660"
 }
 connections: [{
   type: "place",
   name: "Alpha Project Bridge Shelter",
   address: "3737 Fifth Ave, San Diego, CA 92103",
   hours: "6PM-6AM",
   current_availability: "check_211_api",
   last_verified: "2026-03-21"
 }]
 demographic_tags: ["unhoused", "san_diego", "adult"]
```

The persona needed shelter at tick 0. The Forge found 3 real
places with real addresses, real hours, and real intake processes.
The aBps didn't move (shelter alone isn't enough). But 3 spatial
doors are now in the Registry for anyone in San Diego.

#### 5. Routing Rules (Financial Logic)

```
CARTOGRAPHER + ORACLE (Simulated Adjudicator)
     │
     │ Forge attempts: accept $2,000 charity grant
     │ on tick 200 for persona with active MediCal
     │
     ▼
 Oracle evaluates:
 "Persona's countable assets = $1,800.
  + $2,000 grant = $3,800.
  MediCal asset limit = $2,000 for non-MAGI.
  RESULT: TOXIC. MediCal terminated for both children.
  Failure mode: asset_limit_breach"
     │
     ▼
 MICRO-PRODUCT PRODUCED:
 artifact_type: "toxic_pair"
 content: {
   sequence: "charity_grant BEFORE calable_trust",
   failure_mode: "asset_limit_breach_destroys_medical",
   rule: "any lump sum > ($2000 - current_assets) triggers
          MediCal termination for non-MAGI household"
 }
     │
     │ Forge REWINDS. Tries different order:
     │ tick 198: form CalABLE trust
     │ tick 200: accept charity grant INTO trust
     │
     ▼
 Oracle evaluates:
 "CalABLE trust assets are excluded from MediCal
  asset test per ABLE Act §529A.
  $2,000 grant deposited to CalABLE = invisible.
  Countable assets remain $1,800.
  RESULT: SUCCESS. MediCal preserved."
     │
     ▼
 MICRO-PRODUCT PRODUCED:
 artifact_type: "routing_rule"
 content: {
   rule: "IF incoming_lump_sum AND active_medi_cal THEN
          form_calable_trust BEFORE accepting funds",
   timing: "trust must be formed MINIMUM 1 business day
            before funds arrive",
   dependency: ["calable_trust_formation_artifact_id"],
   protects: ["medi_cal_children", "medi_cal_adult"]
 }
 capital_liquefied: 0  # doesn't unlock money, PROTECTS existing money
 friction_hours_eliminated: 200  # hours of crisis if MediCal lost
```

The toxic pair was discovered by FAILING. The routing rule was
discovered by trying a different sequence after the failure.
Both artifacts enter the Registry. The Composer will NEVER deploy
a lump-sum grant without first checking for a CalABLE trust in
the assembly — because the toxic pair forbids it.

#### 6. Timing Sequences (Discovered Through Sequential Runs)

```
THE FORGE across multiple ticks for one persona:

  Tick 5:   File IHSS application → Oracle: APPROVED (pending 45 days)
  Tick 50:  IHSS payment begins ($6,800/mo)
  Tick 51:  File MediCal institutional deeming waiver
            → Oracle: APPROVED (income now excluded from kids' MediCal)
  Tick 55:  Apply for SDRC respite → APPROVED (Lanterman demand)
  Tick 60:  Apply for CalABLE trust → APPROVED (shield for savings)
  Tick 200: Accept county emergency grant → routed to CalABLE → SAFE
  Tick 365: File Section 8 voucher application → waitlisted 3 years
  Tick 400: Apply for EITC maximization → Oracle: +$4,200 refund
            → routed to CalABLE → SAFE

  aBps: still 12. None of this was "enough."

  But the SEQUENCE was logged:
     │
     ▼
 MICRO-PRODUCT PRODUCED:
 artifact_type: "timing_sequence"
 content: {
   sequence: [
     {artifact: "ihss_application", day: 5},
     {artifact: "medi_cal_deeming_waiver", day: 51,
      NOTE: "MUST come AFTER IHSS income begins, not before"},
     {artifact: "sdrc_lanterman_demand", day: 55},
     {artifact: "calable_trust_formation", day: 60,
      NOTE: "MUST come BEFORE any lump sums"},
     {artifact: "section_8_application", day: 365},
     {artifact: "eitc_maximization", day: 400}
   ],
   total_capital_liquefied: 147600,  # $/year
   total_friction_hours_eliminated: 832,  # hrs/year
   toxic_pairs_avoided: [
     "grant_before_calable",
     "deeming_before_ihss_income"
   ]
 }
 demographic_tags: ["single_mother", "IDD_dependents", "san_diego"]
```

This timing sequence was built across hundreds of ticks.
No single tick produced it. It EMERGED from the Forge running
the full trajectory and the Oracle evaluating each step.
The sequence is the micro-product. It's a pre-computed optimal
ordering that the Composer can deploy around a matching human.

### Connection Verification Lifecycle

Every connective micro-product (real person, real place) has a
`last_verified` timestamp. The Sentinel (Patch 4) re-verifies:

- **Referral pathways (people):** Sentinel checks org website for
  staff changes. If Sandra Bishop no longer appears on SDRC's
  Resource Coordinator page, artifact flagged STALE_CONNECTION.
  Cartographer re-maps to find her replacement.

- **Spatial coordinates (places):** Sentinel checks 211 database
  for updated hours/capacity. If Alpha Project closes permanently,
  artifact flagged PLACE_CLOSED. Never deployed again.

- **Scripts (portals):** Sentinel navigates to URL, diffs DOM
  selectors. If BenefitsCal redesigns their SNAP form, artifact
  flagged CORRUPTED. Stonemason re-maps the new DOM.

Stale doors are never opened for real humans. The Registry
self-heals through the Sentinel + Cartographer repair loop.

### The Manufacturing Rate

Per tick of the Forge, the Cartographer typically makes 1-3 web
searches and the Stonemason navigates 0-1 portals. Each tick
produces on average 2-5 artifacts (the primary intervention attempt
+ byproduct discoveries like staff directories, related orgs,
nearby places, policy citations).

At 1,200 kinetic ticks per 16-year persona trajectory:
- ~3,600 web searches hitting real data
- ~1,200 portal navigations mapping real DOM
- ~4,800 micro-products per persona run

At 5,000 persona archetypes:
- ~24,000,000 micro-products in the Registry

The aBps never moved for any of them. But the factory produced
24 million real-world artifacts — scripts, templates, routing rules,
timing sequences, referral pathways to real people, spatial
coordinates of real places, and capital liquefaction mechanisms
for frozen institutional money.

The Composer only needs ~15-250 of them per person.
The surplus is the moat.

---

## PATCH 1: THE SHADOW PARADOX (evaluator.py — Simulated Adjudicator)

### Problem
The Shadow Firewall blocks all POST/PUT requests (legally required).
But if the payload never reaches the state server, the server never replies.
evaluator.py cannot know if the application would have been approved, rejected,
or if it triggered a toxic pair. It cannot guess.

### Fix: Local Oracle

Add a Simulated Adjudicator to `forge/evaluator.py`. When the firewall
intercepts a POST payload, route the payload + persona YAML + program rules
(from seed data) to a fast inference call (Gemini Flash).

```python
# forge/evaluator.py — Simulated Adjudicator

async def simulate_adjudication(
    intercepted_payload: dict,
    persona: dict,
    program_rules: dict
) -> dict:
    """
    Locally simulate the government's backend response.
    The Forge grades its own homework.
    """
    prompt = f"""You are the State of California's eligibility rules engine.
    Based STRICTLY on the policy rules provided, evaluate this intercepted
    POST payload for this persona.

    POLICY RULES:
    {json.dumps(program_rules)}

    PERSONA STATE:
    {json.dumps(persona)}

    INTERCEPTED PAYLOAD:
    {json.dumps(intercepted_payload)}

    Evaluate:
    1. Does this persona mathematically qualify for this program?
    2. Does this application trigger any known asset limit, income cliff,
       or categorical disqualification?
    3. If approved, what is the expected benefit amount and duration?
    4. Does this interact with any currently active programs in the persona's
       secured_programs list?

    Output JSON:
    {{
        "outcome": "SUCCESS | FAILURE | TOXIC | PARTIAL",
        "reason": "specific policy citation",
        "benefit_amount_monthly": float,
        "benefit_duration_months": int,
        "triggered_conflicts": ["list of programs this conflicts with"],
        "asset_limit_triggered": bool,
        "confidence": float  // 0.0-1.0 based on rule clarity
    }}
    """

    result = await gemini_flash.generate(prompt)
    parsed = json.loads(result)

    # Low-confidence adjudications get flagged for manual review
    if parsed['confidence'] < 0.7:
        parsed['needs_verification'] = True

    return parsed
```

The Oracle replaces the missing server response. The Forge can now
evaluate every intercepted payload without ever touching the real state
infrastructure.

---

## PATCH 2: THE COMBINATORIAL HEAT DEATH (sequencer.py — MCTS)

### Problem
program.md commands "attempt every possible intervention, in every possible
order." With 50 interventions, that's 50! permutations. The universe ends
before Postgres finishes computing San Diego.

### Fix: Monte Carlo Tree Search with UCB1

Replace brute-force enumeration with MCTS in `forge/sequencer.py`.
The Forge allocates compute intelligently: 80% exploitation of promising
branches, 20% exploration of random noise.

```python
# forge/sequencer.py — MCTS-guided intervention sequencing

import math
import random
from collections import defaultdict

class InterventionTree:
    def __init__(self):
        self.visit_counts = defaultdict(int)      # N(s,a)
        self.value_sums = defaultdict(float)       # Q(s,a)
        self.children = defaultdict(list)
        self.exploration_constant = 1.414          # sqrt(2), UCB1 standard

    def ucb1_score(self, parent_visits: int, node_key: str) -> float:
        """Upper Confidence Bound for balancing explore/exploit."""
        n = self.visit_counts[node_key]
        if n == 0:
            return float('inf')  # unvisited nodes get priority
        exploitation = self.value_sums[node_key] / n
        exploration = self.exploration_constant * math.sqrt(
            math.log(parent_visits) / n
        )
        return exploitation + exploration

    def select_next_intervention(
        self,
        persona: dict,
        current_sequence: list,
        available_interventions: list,
        exhausted: list
    ) -> dict:
        """
        Select the next intervention to attempt using UCB1.
        Balances exploring novel paths vs. exploiting promising branches.
        """
        parent_key = tuple(current_sequence)
        parent_visits = self.visit_counts[parent_key] or 1

        candidates = [
            i for i in available_interventions
            if i['program_id'] not in exhausted
        ]

        if not candidates:
            # All single interventions exhausted → combine near-misses
            return self._generate_combination(persona, current_sequence)

        # Score each candidate with UCB1
        scored = []
        for intervention in candidates:
            child_key = parent_key + (intervention['program_id'],)
            score = self.ucb1_score(parent_visits, str(child_key))
            scored.append((intervention, score))

        # Select highest UCB1 score
        scored.sort(key=lambda x: x[1], reverse=True)
        selected = scored[0][0]

        return selected

    def backpropagate(self, sequence: list, reward: float):
        """
        After an attempt, update value estimates for the entire path.
        reward = capital_liquefied + connections_opened + friction_eliminated
        """
        for i in range(len(sequence)):
            node_key = str(tuple(sequence[:i+1]))
            self.visit_counts[node_key] += 1
            self.value_sums[node_key] += reward

    def _generate_combination(self, persona, current_sequence):
        """
        When single interventions are exhausted, generate novel combinations
        from near-miss branches in the tree.
        """
        # Find top 10 highest-value partial sequences
        top_sequences = sorted(
            self.value_sums.items(),
            key=lambda x: x[1] / max(self.visit_counts[x[0]], 1),
            reverse=True
        )[:10]

        # Cross-pollinate: combine elements from top sequences
        elements = set()
        for seq_key, _ in top_sequences:
            elements.update(eval(seq_key))

        # Generate novel ordering of combined elements
        combo = list(elements)
        random.shuffle(combo)
        return {
            'type': 'combination',
            'sequence': combo,
            'program_id': f"COMBO-{'_'.join(combo[:3])}"
        }


# Module-level instance persists across Forge cycles
intervention_tree = InterventionTree()


async def get_next_sequence(
    persona: dict,
    tick: int,
    exhausted: list,
    registry_near_misses: bool = True
) -> dict:
    """
    Main entry point called by forge_loop.py.
    Returns the next intervention to attempt, guided by MCTS.
    """
    available = await load_available_interventions(
        persona=persona,
        geography=persona['demographic']['geography'],
        include_registry_near_misses=registry_near_misses
    )

    current_sequence = persona.get('current_run_sequence', [])

    selected = intervention_tree.select_next_intervention(
        persona=persona,
        current_sequence=current_sequence,
        available_interventions=available,
        exhausted=exhausted
    )

    return selected
```

### Pruning Rules
- Branches with 0 capital_liquefied after 10 visits: deprioritize (not delete)
- Branches containing known toxic pairs: prune immediately
- Branches exceeding persona's geographic constraints: prune
- Near-misses from other persona clusters: inject at 20% exploration rate

---

## PATCH 3: THE GREEDY COMPOSER TRAP (assembler.py — CSP Solver)

### Problem
The greedy sort-and-loop in assembler.py will get trapped in local minima.
Picking the highest-scoring capstone first may lock out a combination of
four lower-scoring foundation stones that together yield 3x the capital.

### Fix: Constraint Satisfaction via OR-Tools CP-SAT

Replace greedy assembly with Google's OR-Tools CP-SAT solver.
Feed Registry constraints (dependencies, toxic pairs) into the solver.
Command: maximize total_capital_liquefied subject to toxic_pairs == 0
and dependencies_met == True.

```python
# composer/assembler.py — CSP-based dome assembly (replaces greedy loop)

from ortools.sat.python import cp_model

async def compose_duomo(real_human: dict) -> dict:
    """
    Assemble a globally optimal Duomo using constraint satisfaction.
    No greedy traps. No local minima.
    """
    # 1-2. Find clusters + query candidates (unchanged from original)
    clusters = find_nearest_clusters(real_human['demographics'])
    candidates = await query_registry(
        demographic_tags=extract_tags(real_human),
        geography=real_human['current_hexis']['geographic'],
        exclude_active=real_human['current_hexis']['active_programs'],
        max_decay_age='90 days',
    )

    # 3. Build the constraint satisfaction model
    model = cp_model.CpModel()
    n = len(candidates)

    # Binary decision variable per artifact: include (1) or exclude (0)
    include = [model.NewBoolVar(f'artifact_{i}') for i in range(n)]

    # Map artifact IDs to indices
    id_to_idx = {c['id']: i for i, c in enumerate(candidates)}

    # CONSTRAINT: No toxic pairs
    toxic_pairs = await get_all_toxic_pairs(
        [c['id'] for c in candidates]
    )
    for pair in toxic_pairs:
        idx_a = id_to_idx.get(pair['artifact_a'])
        idx_b = id_to_idx.get(pair['artifact_b'])
        if idx_a is not None and idx_b is not None:
            # Cannot include both
            model.Add(include[idx_a] + include[idx_b] <= 1)

    # CONSTRAINT: Dependencies must be met
    for i, candidate in enumerate(candidates):
        if candidate.get('dependencies'):
            for dep_id in candidate['dependencies']:
                dep_idx = id_to_idx.get(dep_id)
                if dep_idx is not None:
                    # If artifact i is included, its dependency must be too
                    model.AddImplication(include[i], include[dep_idx])

    # CONSTRAINT: Max artifacts per temporal phase (prevent overload)
    for phase in ['foundation_stone', 'keystone', 'capstone']:
        phase_indices = [
            i for i, c in enumerate(candidates)
            if c.get('temporal_position') == phase
        ]
        # Max 50 foundation stones, 100 keystones, 100 capstones
        limits = {'foundation_stone': 50, 'keystone': 100, 'capstone': 100}
        model.Add(
            sum(include[i] for i in phase_indices) <= limits[phase]
        )

    # OBJECTIVE: Maximize composite value
    # Weighted sum of capital liquefied + friction hours eliminated +
    # connection quality + demographic fit
    objective_terms = []
    for i, c in enumerate(candidates):
        capital = int(c.get('capital_liquefied', 0) * 100)
        friction = int(c.get('friction_hours_eliminated', 0) * 10)
        connections = len(c.get('connections', [])) * 500
        fit = int(compute_fit_score(c, real_human) * 1000)
        weight = capital + friction + connections + fit
        objective_terms.append(include[i] * weight)

    model.Maximize(sum(objective_terms))

    # SOLVE
    solver = cp_model.CpSolver()
    solver.parameters.max_time_in_seconds = 30.0
    status = solver.Solve(model)

    if status not in (cp_model.OPTIMAL, cp_model.FEASIBLE):
        raise RuntimeError("Composer failed to find valid dome assembly")

    # 4. Extract the globally optimal dome
    duomo = {
        'foundation_stones': [],
        'keystones': [],
        'capstones': [],
        'toxic_pairs_avoided': len(toxic_pairs),
        'total_capital_liquefied': 0,
        'total_friction_hours_eliminated': 0,
        'doors_opened': {
            'forms': [],
            'funds': [],
            'people': [],
            'places': [],
        },
        'solver_status': 'OPTIMAL' if status == cp_model.OPTIMAL else 'FEASIBLE',
        'objective_value': solver.ObjectiveValue(),
    }

    for i, candidate in enumerate(candidates):
        if solver.Value(include[i]):
            phase = candidate.get('temporal_position', 'keystone')
            phase_key = phase + 's'
            if phase_key not in duomo:
                phase_key = 'keystones'
            duomo[phase_key].append(candidate)

            duomo['total_capital_liquefied'] += candidate.get(
                'capital_liquefied', 0
            )
            duomo['total_friction_hours_eliminated'] += candidate.get(
                'friction_hours_eliminated', 0
            )

            if candidate.get('connections'):
                for conn in candidate['connections']:
                    bucket = conn.get('type', 'org') + 's'
                    if bucket in duomo['doors_opened']:
                        duomo['doors_opened'][bucket].append(conn)

    # 5. Generate phased deployment plan
    duomo['deployment_plan'] = generate_deployment_timeline(duomo)

    return duomo
```

### Why This Matters
The solver finds the GLOBALLY optimal combination — not the locally
greedy one. It can discover that four low-scoring foundation stones
together unlock a pathway that the single highest-scoring capstone
alone never could. The welfare state is a non-linear constraint system.
The Composer must reason about it as one.

---

## PATCH 4: THE ENTROPY JANITOR (sentinel.py — Self-Healing Registry)

### Problem
Government DOMs change weekly. Org contact info goes stale. Shelters
close. Programs sunset. If a micro-product rots in the Registry, the
Composer will deploy a broken door to a real human.

### Fix: Add `forge/sentinel.py`

A daemon that runs nightly, queries for stale artifacts, re-verifies
them against the live web, and flags/repairs broken ones.

```python
# forge/sentinel.py — The Entropy Janitor

import asyncio
from datetime import datetime, timedelta
from registry.reader import query_stale_artifacts
from registry.writer import update_artifact_status
from forge.stonemason import verify_dom_structure

async def run_sentinel():
    """
    Nightly daemon. Finds stale artifacts. Re-verifies they still work.
    Flags broken ones. Kicks broken connective artifacts back to the
    Cartographer for re-mapping.
    """
    while True:
        # Wait until 3:00 AM
        now = datetime.now()
        next_run = now.replace(hour=3, minute=0, second=0, microsecond=0)
        if now >= next_run:
            next_run += timedelta(days=1)
        await asyncio.sleep((next_run - now).total_seconds())

        print(f"[SENTINEL] Starting nightly verification sweep...")

        # Query artifacts past their decay window
        stale = await query_stale_artifacts()
        # SQL: SELECT * FROM artifacts
        #      WHERE last_verified < NOW() - decay_rate
        #      AND status != 'CORRUPTED'
        #      ORDER BY times_deployed DESC  -- prioritize high-use artifacts

        verified = 0
        corrupted = 0
        repaired = 0

        for artifact in stale:
            try:
                if artifact['artifact_type'] == 'script':
                    # Re-verify DOM structure matches stored selectors
                    result = await verify_dom_structure(
                        url=artifact['content'].get('target_url'),
                        expected_selectors=artifact['content'].get('selectors'),
                        shadow_mode=True  # GET only, no submissions
                    )
                    if result['dom_match']:
                        await update_artifact_status(
                            artifact['id'],
                            status='VERIFIED',
                            last_verified=datetime.now()
                        )
                        verified += 1
                    else:
                        await update_artifact_status(
                            artifact['id'],
                            status='CORRUPTED',
                            corruption_reason='DOM_STRUCTURE_CHANGED',
                            dom_diff=result['diff']
                        )
                        corrupted += 1
                        # Queue for Cartographer re-mapping
                        await queue_for_remapping(artifact)

                elif artifact['artifact_type'] == 'referral_pathway':
                    # Verify org still exists, contact still valid
                    result = await verify_connection(
                        artifact['connections']
                    )
                    if result['still_valid']:
                        await update_artifact_status(
                            artifact['id'],
                            status='VERIFIED',
                            last_verified=datetime.now()
                        )
                        verified += 1
                    else:
                        await update_artifact_status(
                            artifact['id'],
                            status='STALE_CONNECTION',
                            corruption_reason=result['reason']
                        )
                        corrupted += 1

                elif artifact['artifact_type'] == 'spatial_coordinate':
                    # Verify place still operates at stated address/hours
                    result = await verify_spatial(
                        artifact['connections']
                    )
                    if result['still_open']:
                        await update_artifact_status(
                            artifact['id'],
                            status='VERIFIED',
                            last_verified=datetime.now()
                        )
                        verified += 1
                    else:
                        await update_artifact_status(
                            artifact['id'],
                            status='PLACE_CLOSED',
                            corruption_reason=result['reason']
                        )
                        corrupted += 1

                elif artifact['artifact_type'] in [
                    'legal_template', 'routing_rule', 'timing_sequence'
                ]:
                    # These decay based on policy changes, not DOM
                    # Check if underlying policy rule still exists in seed data
                    result = await verify_policy_still_active(
                        artifact['content'].get('policy_citations', [])
                    )
                    if result['still_active']:
                        await update_artifact_status(
                            artifact['id'],
                            status='VERIFIED',
                            last_verified=datetime.now()
                        )
                        verified += 1
                    else:
                        await update_artifact_status(
                            artifact['id'],
                            status='POLICY_SUNSET',
                            corruption_reason=result['reason']
                        )
                        corrupted += 1

            except Exception as e:
                print(f"[SENTINEL] Error verifying {artifact['id']}: {e}")
                continue

        print(f"[SENTINEL] Sweep complete. "
              f"Verified: {verified} | Corrupted: {corrupted} | "
              f"Queued for repair: {corrupted}")


async def queue_for_remapping(artifact: dict):
    """
    Kick a corrupted artifact back to the Cartographer.
    The Cartographer will re-map the target (find new DOM, new URL,
    new contact) and produce a REPLACEMENT artifact in the Registry.
    The corrupted artifact remains in the Registry with status=CORRUPTED
    as historical record (never delete).
    """
    await cartographer_queue.enqueue({
        'task': 'REMAP_CORRUPTED_ARTIFACT',
        'original_artifact_id': artifact['id'],
        'artifact_type': artifact['artifact_type'],
        'target': artifact['content'].get('target_url')
                  or artifact['connections'],
        'budget_tokens': 2.00,  # max $2 API spend per re-map
    })
```

### Composer Integration
The Composer's Registry query must filter: `WHERE status != 'CORRUPTED'
AND status != 'POLICY_SUNSET' AND status != 'PLACE_CLOSED'`.
Stale artifacts are never deployed. They remain in the Registry as
historical record but are invisible to the assembly engine.

---

## PATCH 5: EUDAIMONIA METRIC (Schema Addition)

### Problem
The Registry tracks `capital_liquefied` (money unlocked) but not the
other half of the equation: time restored. A Duomo that liquefies
$847,200 but requires 40 hours/week of the mother's administrative
labor is a failure. The metric that proves the dome WORKS is temporal
bandwidth restored.

### Fix: Add to artifacts table

```sql
ALTER TABLE artifacts ADD COLUMN friction_hours_eliminated NUMERIC DEFAULT 0;
-- How many hours of human administrative suffering this artifact
-- permanently eliminates over the 16-year trajectory.
-- Example: IHSS timesheet auto-filer = 2 hours/biweekly * 26 * 16 = 832 hours
-- Example: Lanterman demand letter template = 40 hours of legal research eliminated
-- Example: CalABLE trust formation = 8 hours of financial planning eliminated
```

### Composer Output Update
The Duomo deployment plan must output BOTH metrics:

```yaml
# Duomo Summary: NODE-002
total_capital_liquefied: $847,200
total_friction_hours_eliminated: 4,200 hours
temporal_bandwidth_restored: "equivalent to 2.1 full-time work years"
```

This dual metric proves to capital markets (SIBs, CDFIs, VCs) that:
1. The dome is fiscally sound (capital flows)
2. The human will not crash from burnout (time is protected)
3. The aBps will stabilize because the administrative violence is absorbed

---

## UPDATED FILE STRUCTURE

```
/home/user/workspace/duomo-forge/
├── ARCHITECTURE.md               # THIS FILE — master specification
├── program.md                    # The Forge reads this every cycle (NEVER STOP)
├── forge/
│   ├── forge_loop.py             # The never-stopping factory loop
│   ├── cartographer.py           # RAG search for interventions
│   ├── stonemason.py             # Shadow-mode browser automation
│   ├── evaluator.py              # *** PATCHED: Simulated Adjudicator (Oracle)
│   ├── sequencer.py              # *** PATCHED: MCTS with UCB1
│   ├── shock_injector.py         # Random life disruptions
│   ├── shadow_firewall.py        # Blocks POST/PUT, captures payloads
│   └── sentinel.py               # *** NEW: Nightly entropy janitor
├── persona/
│   ├── generator.py
│   ├── clusterer.py
│   ├── mutator.py
│   └── templates/
├── registry/
│   ├── schema.sql                # *** PATCHED: +friction_hours_eliminated
│   ├── writer.py
│   ├── reader.py
│   └── migrations/
├── composer/
│   ├── assembler.py              # *** PATCHED: OR-Tools CP-SAT solver
│   ├── toxic_checker.py
│   ├── scorer.py
│   ├── deployment_planner.py
│   └── door_mapper.py
├── integrations/
│   ├── whoop.py
│   ├── plaid.py
│   ├── benefits_cal.py
│   ├── sdrc.py
│   ├── two_one_one.py
│   └── liquidspace.py
├── capital/
│   ├── liquefaction_tracker.py
│   ├── sib_modeler.py
│   └── blended_finance.py
├── seeds/
│   ├── federal_programs.json
│   ├── ca_programs.json
│   ├── interaction_matrix.json
│   ├── sd_geography.json
│   └── capital_instruments.json
├── obsidian_bridge/
│   ├── exporter.py
│   └── summary_generator.py
└── tests/
    ├── test_forge_loop.py
    ├── test_composer.py
    ├── test_toxic_pairs.py
    ├── test_sentinel.py          # *** NEW
    └── test_capital_liquefaction.py
```

---

## UPDATED BUILD ORDER

1. `registry/schema.sql` → Stand up Postgres with ALL columns including `friction_hours_eliminated`
2. `persona/generator.py` → Generate first 50 persona templates
3. `forge/evaluator.py` → Build the Simulated Adjudicator (Oracle) FIRST — the Forge cannot grade without it
4. `forge/sequencer.py` → Build MCTS/UCB1 sequencer — the Forge cannot explore efficiently without it
5. `forge/forge_loop.py` + `program.md` → Build the core Karpathy loop
6. **START THE FORGE IMMEDIATELY** — let it run and fill the Registry
7. `forge/shock_injector.py` → Add life disruptions
8. `forge/sentinel.py` → Deploy the nightly entropy janitor
9. `composer/assembler.py` → Build CSP-based dome assembly (OR-Tools CP-SAT)
10. `integrations/` → Wire up Whoop, Plaid, BenefitsCal, SDRC, 211
11. `capital/liquefaction_tracker.py` → Track frozen→liquid $ + friction hours
12. `composer/door_mapper.py` → Classify real-world doors
13. `obsidian_bridge/exporter.py` → Push dome blueprints to Obsidian vault

The Forge starts at step 6 and NEVER STOPS.
The Sentinel starts at step 8 and runs every night at 3:00 AM.
By the time the Composer is ready, the Registry already has thousands
of micro-products waiting to be assembled into Duomos.


---

## PATCH 6: GEOGRAPHIC UNIVERSALITY

### Problem
The spec is over-indexed on San Diego. The seed data references
211 San Diego, SDRC, BenefitsCal. The manufacturing examples use
SD shelters and SD staff. But the persona generator already has a
geography field that accepts any city/state/zip. The Forge should
be producing artifacts for EVERY geography simultaneously.

### Why This Matters
The American administrative state is not one system. It is 50 state
systems, 3,000+ county systems, and 20,000+ municipal systems, each
with different programs, eligibility rules, portals, waitlists, orgs,
people, and places. A micro-product that works in San Diego County
(IHSS via BenefitsCal) is useless in Cook County, IL (where it's
filed through ABE - Application for Benefits Eligibility). A routing
rule that protects MediCal in California doesn't apply in Texas
(which never expanded Medicaid). A referral pathway to Sandra Bishop
at SDRC is meaningless for a persona in Miami-Dade.

The Registry's power is GEOGRAPHIC BREADTH. The more geographies the
Forge explores, the more humans the Composer can assemble Duomos for.

### Fix: Multi-Geographic Forge Runs

#### Persona Generator Update
The persona generator must cross-tabulate demographics × geography.
Geography is not a single field — it's a primary axis of variation:

```yaml
# persona/geography_matrix.yaml
---
tier_1_geographies:  # Run first — highest population density of target demographics
  - {state: CA, county: San Diego, city: San Diego}      # Home base, verifiable
  - {state: CA, county: Los Angeles, city: Los Angeles}   # Largest county in US
  - {state: NY, county: New York, city: New York}         # 1115 waiver SCN live
  - {state: TX, county: Harris, city: Houston}            # Non-expansion state
  - {state: IL, county: Cook, city: Chicago}              # Midwest urban
  - {state: FL, county: Miami-Dade, city: Miami}          # Immigration complexity
  - {state: PA, county: Philadelphia, city: Philadelphia} # Original Gemini scenario
  - {state: OH, county: Cuyahoga, city: Cleveland}        # Rust belt
  - {state: WA, county: King, city: Seattle}              # West coast expansion state
  - {state: GA, county: Fulton, city: Atlanta}            # Southeast non-expansion

tier_2_geographies:  # Run second — rural, tribal, border
  - {state: MS, county: Hinds, city: Jackson}             # Deepest poverty state
  - {state: WV, county: Kanawha, city: Charleston}        # Appalachian
  - {state: NM, county: McKinley, city: Gallup}           # Tribal/IHS overlap
  - {state: AZ, county: Maricopa, city: Phoenix}          # Border + tribal
  - {state: AK, county: Anchorage, city: Anchorage}       # Remote + tribal
  - {state: HI, county: Honolulu, city: Honolulu}         # Island isolation
  - {state: PR, territory: true, city: San Juan}          # Territory (different rules)

tier_3_geographies:  # Run third — fill remaining states
  # Every remaining state capital + largest city
  # The Forge is a factory. It doesn't stop.
---
```

#### Seed Data Restructure
Seed data becomes hierarchical: federal (universal) → state → county → municipal.

```
seeds/
├── federal/
│   ├── programs.json           # SNAP, SSI, SSDI, Section 8, LIHEAP, WIC, TANF
│   ├── eligibility_rules.json  # Federal floor (applies everywhere)
│   ├── interaction_matrix.json # Federal-level toxic pairs and synergies
│   └── capital_instruments.json # SIBs, CDFIs, EITC, Opportunity Zones
├── states/
│   ├── CA/
│   │   ├── programs.json       # MediCal, CalFresh, CalWORKs, IHSS, CalABLE
│   │   ├── portals.json        # BenefitsCal URLs, Covered California
│   │   ├── asset_limits.json   # CA-specific thresholds
│   │   └── counties/
│   │       ├── san_diego/
│   │       │   ├── orgs.json         # 211 SD, SDRC, HHSA, Alpha Project...
│   │       │   ├── people.json       # Staff directories discovered by Forge
│   │       │   ├── places.json       # Shelters, clinics, offices
│   │       │   └── waitlists.json    # Section 8, SDRC respite, etc.
│   │       ├── los_angeles/
│   │       │   ├── orgs.json
│   │       │   └── ...
│   │       └── .../
│   ├── TX/
│   │   ├── programs.json       # Texas Medicaid (NOT expanded), CHIP, SNAP
│   │   ├── portals.json        # YourTexasBenefits.com
│   │   ├── asset_limits.json
│   │   └── counties/
│   │       ├── harris/
│   │       └── .../
│   ├── NY/
│   │   ├── programs.json       # NY Medicaid, SNAP, 1115 waiver SCNs
│   │   ├── portals.json        # myBenefits.ny.gov
│   │   ├── scn_networks.json   # Social Care Networks (Findhelp integration)
│   │   └── counties/...
│   └── .../                    # All 50 states + DC + territories
└── national/
    ├── 211_api_endpoints.json  # 211.org national data platform endpoints
    ├── hud_income_limits.json  # By geography (annual HUD update)
    └── va_facilities.json      # VA medical centers by state
```

#### Cartographer Geographic Routing
The Cartographer already searches the live web. The fix is simple:
it must include the persona's geography in every search query.

```python
# forge/cartographer.py — geographic routing

async def search_intervention(persona: dict, intervention_type: str) -> dict:
    geo = persona['demographic']['geography']
    state = geo['state']
    county = geo.get('county', '')
    city = geo.get('city', '')

    # Layer 1: Check local seed data first (free, instant)
    local = await check_seed_data(
        f"seeds/states/{state}/counties/{county.lower().replace(' ', '_')}/"
    )
    if local:
        return local

    # Layer 2: Search the live web with geographic context
    queries = [
        f"{intervention_type} application {city} {state}",
        f"{intervention_type} eligibility {state} {county} county",
        f"211 {city} {intervention_type} resources",
    ]
    results = await perplexity_search(queries)

    # Layer 3: State-specific portal discovery
    portal = await discover_state_portal(state, intervention_type)

    return compile_intervention_target(results, portal, geo)
```

When the Forge runs a persona in Houston, TX:
- The Cartographer searches "SNAP application Houston Texas"
- It discovers YourTexasBenefits.com (not BenefitsCal)
- The Stonemason maps THAT portal's DOM
- The artifact is tagged {state: TX, county: Harris, city: Houston}
- It goes into the Registry alongside the San Diego artifacts
- The Composer queries by geography and pulls the right ones

#### Registry Geographic Index
Already present in the schema (PATCH 0), but the query pattern
must be geographic-first:

```sql
-- The Composer's primary query path:
SELECT * FROM artifacts
WHERE geography->>'state' = $1          -- match state
  AND geography->>'county' = $2         -- match county
  AND status NOT IN ('CORRUPTED', 'POLICY_SUNSET', 'PLACE_CLOSED')
  AND ($3 = ANY(demographic_tags))      -- match demographic
ORDER BY capital_liquefied DESC;

-- Fallback: if county has < 50 artifacts, widen to state level
-- (many programs are state-administered, not county-specific)
```

#### Non-Expansion State Handling
14 states have not expanded Medicaid. When the Forge runs a persona
in Texas, Mississippi, or Georgia, the entire MediCal/Medicaid
pathway that works in California DOES NOT EXIST. The aBps still
doesn't move. The Forge is forced into completely different territory:
- Charity care hospital policies
- FQHC sliding-scale clinics
- Church-based emergency funds
- Legal instruments specific to that state's trust law
- County-specific programs that don't exist at state level

This is exactly what the locked aBps forces. In California, the Forge
might find 200 programs before exhausting options. In Mississippi, it
might find 40 — and be forced into novel territory 5x faster. The
micro-products it discovers in non-expansion states are the most
valuable in the entire Registry because they solve for the hardest
geography.

#### Geographic Arbitrage Artifacts
The Forge should also discover CROSS-GEOGRAPHIC opportunities:

```yaml
artifact_type: "geographic_arbitrage"
content:
  rule: "If persona is in TX (non-expansion) with IDD child,
         relocating to CA triggers automatic MediCal eligibility
         + IHSS + Regional Center services. Net capital gain:
         $120,000/year in services that don't exist in TX."
  source_geography: {state: TX}
  target_geography: {state: CA}
  requirements: ["establish CA residency", "30-day waiting period for MediCal"]
  risks: ["loss of existing TX services during transition",
          "housing cost differential"]
capital_liquefied: 120000  # per year
friction_hours_eliminated: 0  # relocation is HIGH friction
demographic_tags: ["IDD_dependents", "non_expansion_state"]
```

These are some of the most powerful micro-products in the Registry.
They don't exist within any single state's program architecture.
They emerge from the Forge running the SAME persona across DIFFERENT
geographies and comparing outcomes.

### Updated Build Order Note
The Forge starts with Tier 1 geographies (10 metro areas) and
expands outward. San Diego runs first because you can physically
verify the artifacts. But by week 2, personas in Houston, Chicago,
NYC, and Atlanta are running simultaneously. The Registry is
national from month 1.

### The Endgame
When the Forge has run 5,000+ persona archetypes across 50 states:
- The Registry contains micro-products for every major geography
- The Composer can assemble a Duomo for a human ANYWHERE in the US
- Geographic arbitrage artifacts reveal the optimal STATE for each
  demographic configuration
- The system knows that a single mother with 2 IDD kids is
  structurally better served in California than Texas — and it
  knows the exact 90-day relocation sequence to get her there
  without losing coverage during the transition

The Forge is not a San Diego tool. It is a national factory.
San Diego is just where the first brick was laid.
