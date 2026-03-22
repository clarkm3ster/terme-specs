# XP SPORTS — THE COMPLETE SYSTEM BIBLE
## Four Sports. Four Combat Systems. One Engine.

> CourtXP (Basketball × Tekken 8) | PaddleXP (Pickleball × Mortal Kombat 1) | GlassXP (Padel × Sekiro) | BombXP (Long Drive × Kerbal Space Program)

---
---

# BOOK 0 — SHARED ENGINE SPEC

Everything below applies identically to all four apps. The engine is sport-agnostic. The content layer (moves, categories, language, archetypes) is sport-specific and defined in Books 1-4.

---

## 0.1 — THE CORE THESIS

Every sport is a combat system. Every athlete is a fighter learning moves, chaining them into combos, and reading opponents. Skill development is not a checklist — it is a progression tree with locked gates, pass/fail trials, and a rank that means something because you earned it.

The XP Sports engine applies three design principles stolen from the best competitive games ever made:

1. LOCKED SEQUENTIAL LAYERS (from Rocket League): You cannot see the next layer of content until you have passed every trial in the current layer. The game does not show you what is ahead. Mastery of what you have is the price of entry.

2. FOUNDATIONAL MOVES BEFORE COMBOS (from fighting games): You cannot chain a combo until you own every individual move in that combo. Prerequisites are enforced. Skipping foundations is structurally impossible.

3. PASS/FAIL TRIALS (from competitive ranked systems): Completion is not a checkbox. Every move has a measurable trial. You pass or you fail. Failure tells you exactly why. Rank is earned through demonstrated performance, not time spent.

---

## 0.2 — SEVEN SEQUENTIAL LAYERS

Every XP Sports app has exactly 7 layers (0-7). Layer content is sport-specific, but the structure is universal:

| Layer | Universal Function | Gate |
|-------|-------------------|------|
| 0 | Tutorial / Foundation / Stance | Must certify all moves before Layer 1 is visible |
| 1 | Core Sequences / Neutral Game | Must certify all moves before Layer 2 is visible |
| 2 | Individual Techniques / Specials | Must certify all moves before Layer 3 is visible |
| 3 | Partner/System Integration | Must certify all moves before Layer 4 is visible |
| 4 | Combo Routes / Chained Sequences | Must certify all moves before Layer 5 is visible |
| 5 | Mix-Ups / Advanced Tactics / Meta-Game | Must certify all moves before Layer 6 is visible |
| 6 | Boss-Level Mastery / Elite Execution | Must certify all moves before Layer 7 is visible |
| 7 | Complete System Integration / Teaching / Creation | Final rank earned on completion |

Layers are INVISIBLE until unlocked. A player at Layer 2 does not know Layer 3 exists. This is intentional — it prevents intimidation and focuses attention on the current challenge.

---

## 0.3 — RANK LADDER (Universal Across All Apps)

All four apps use the same rank structure, mapped to Rocket League's ladder:

| Rank | Divisions | Layer Required |
|------|-----------|----------------|
| Unranked | — | Not started |
| Bronze III–I | Div 1–4 each | Layer 0 complete |
| Silver III–I | Div 1–4 each | Layer 1-2 complete |
| Gold III–I | Div 1–4 each | Layer 3 complete |
| Platinum III–I | Div 1–4 each | Layer 4 complete |
| Diamond III–I | Div 1–4 each | Layer 5 complete |
| Champion III–I | Div 1–4 each | Layer 6 complete |
| Grand Champion III–I | Div 1–4 each | Layer 7 in progress |
| Legend | No divisions | Layer 7 complete |

Each rank tier has 3 levels (III, II, I) and 4 divisions within each level, for 84 total sub-ranks before Legend. Division promotion is based on trial performance and freshness maintenance within each layer.

Rank is the HEADLINE metric on the home screen. Any secondary rating (OVR, Δv efficiency, posture score) is subordinate.

---

## 0.4 — MOVE CERTIFICATION & TRIALS

Every move in every app has a TRIAL — a specific, measurable, pass/fail performance test. There are no checkboxes. You pass or you repeat.

### Universal Trial Types

| Trial Type | Description | Standard Pass Criteria |
|------------|-------------|----------------------|
| Rep Trial | Perform a specific action a set number of times | 3-of-5 or 7-of-10 successful reps |
| Sequence Trial | Execute a complete multi-step sequence | 3-of-5 full completions; dropping a step fails the attempt |
| Partner Trial | Execute a coordination-dependent action with a real partner | Both players succeed 3-of-5 times |
| Film Trial | Record yourself and review against a rubric | Pass all rubric criteria |
| Live Trial | Execute in live play or competitive drill | Complete with real opponents/resistance |
| Boss Trial | Film submission for Layer 6-7 content | External reviewer confirms execution and conditions |

Failing a trial shows the SPECIFIC REASON for failure — not a generic "keep practicing." The system identifies the exact sub-skill that broke down.

---

## 0.5 — FRESHNESS DECAY ENGINE

All certified moves decay over time. The decay system is identical across all four apps; only the language changes per sport.

### Decay Tiers

| Freshness | Status | Effect |
|-----------|--------|--------|
| 100-70 | SHARP | Recently certified; move is clean and reliable |
| 70-50 | FADING | Getting stale; needs a training session soon |
| 50-25 | COMPROMISED | Significant decay; unreliable under pressure |
| 25-10 | CRITICAL | Major decay; technique collapses in live play |
| Below 10 | LOST | Must re-certify from scratch |

### Decay Rate Formula

```
decayPerDay = max(1, round(8 / sqrt(certificationCount)))
```

- 1st certification: 8 points/day (sharp for ~4 days, fading by day 7)
- 4th certification: 4 points/day (sharp for ~8 days)
- 16th certification: 2 points/day (sharp for ~15 days)
- 64th certification: 1 point/day (sharp for a month)

This simulates muscle memory — the more times you've certified a move, the slower it decays.

Re-certifying a move:
1. Resets freshness to 100
2. Increments certification count (slowing future decay)
3. Awards reduced XP (diminishing returns to prevent farming)

### Sport-Specific Decay Language

| Tier | CourtXP (Tekken) | PaddleXP (MK1) | GlassXP (Sekiro) | BombXP (KSP) |
|------|-----------------|-----------------|-------------------|---------------|
| 100-70 | SHARP | SHARP | STABLE | NOMINAL |
| 70-50 | FADING | FADING | WAVERING | DEGRADING |
| 50-25 | MOVE FORGOTTEN | GUARD BROKEN | POSTURE BROKEN | WARNING |
| 25-10 | RUSTY | RUSTY | CRUMBLING | CRITICAL |
| <10 | LOST | LOST | SHATTERED | OFFLINE |

---

## 0.6 — SIX MOVE CATEGORIES PER SPORT

Every sport has exactly 6 move categories. The categories serve the same structural function across all apps but are themed to match each sport's combat system:

| Structural Role | CourtXP (Tekken) | PaddleXP (MK1) | GlassXP (Sekiro) | BombXP (KSP) |
|----------------|-----------------|-----------------|-------------------|---------------|
| Stance / Foundation | Stance Moves | Basic Attacks | Guard Posture | VAB: Vehicle Assembly |
| Safe / Reliable | Pokes | Strings | Deflections | Staging |
| Attack Initiators | Launchers | Special Moves | Attacks (Posture Damage) | Propulsion |
| Combo Extenders | Extenders | Kameo Moves | Perilous Attacks | Guidance |
| Finishers | Finishers | Fatal Blows | Deathblows & Combat Arts | Mission Profiles |
| Situational / System | Off-Ball / Situational | Defense & Meter | Prosthetic Tools (Glass) | Telemetry & Fuel |

Each category contains 15 moves (10-15 minimum). Total moves per sport: 85-90+.

---

## 0.7 — FIVE ARCHETYPES PER SPORT

Each sport has exactly 5 archetypes that replace traditional position/role classifications. Archetypes determine:
- Which combo routes are available
- Which stats/metrics are weighted more heavily
- Which Layer 6 Boss content is assigned
- The player's identity label on the home screen

| Structural Role | CourtXP | PaddleXP | GlassXP | BombXP |
|----------------|---------|----------|---------|--------|
| Balanced / All-Round | POINT GOD | SURGEON | SHINOBI | ORBITER |
| Power / Aggression | SLASHER | ENFORCER | ISSHIN | BOOSTER |
| Precision / Range | SNIPER | ASSASSIN | GENICHIRO | NAVIGATOR |
| Defense / Control | ENFORCER | WALL | SCULPTOR | ENGINEER |
| System / Team Play | GHOST | GENERAL | OWL | COMMANDER |

---

## 0.8 — COMBO ROUTES (Layer 4+ Content)

Combo routes are multi-move sequences that chain moves from Categories 1-5. They are the "combos" of each sport — pre-planned decision trees executed against an opponent who is reacting to you.

Every combo route has:
- A NAME
- PREREQUISITE MOVES (specific moves from lower layers that must all be certified)
- A SEQUENCE (ordered steps, each referencing a specific move)
- A HIT COUNT (how many steps in the sequence)
- A TRIAL (execute the full route against resistance)

Combo routes are NOT visible until all prerequisite moves are certified. The app shows them as locked silhouettes with a prerequisite checklist. As the player certifies prerequisite moves, the route gradually "reveals" itself.

---

## 0.9 — AGENT SYSTEM (Background Alerts)

Three background agents analyze game state and generate contextual alerts on the home screen. The agent architecture is shared; only the copy changes per sport.

### Decay Agent
Finds the move with the lowest freshness score. Generates alerts based on severity:
- Freshness < 10 → HIGH priority (red) — "[MOVE] IS LOST"
- Freshness < 30 → HIGH priority (orange) — "[MOVE] IS FADING"
- Freshness < 60 → MEDIUM priority (yellow) — "[MOVE] NEEDS WORK"

### Coach Agent
Identifies the weakest category or layer and recommends focus:
- No certified moves → Onboarding alert
- Trained today → "SESSION COMPLETE" (green)
- Not trained today → "TODAY'S MISSION: [WEAKEST AREA]"

### Streak Guardian
Fires when training streak is at risk:
- Streak ≥ 3 + not trained today → HIGH priority
- Streak = 0 → LOW priority "CLEAN SLATE"

Alert ordering: Streak → Decay → Coach. Highest urgency first.

---

## 0.10 — TECH STACK (Shared Across All Apps)

| Component | Technology |
|-----------|-----------|
| Framework | Expo React Native (TypeScript) |
| Navigation | Expo Router (file-based) |
| State | React Context + AsyncStorage |
| Animations | React Native Reanimated |
| Icons | MaterialCommunityIcons |
| Fonts | Inter (400, 600, 700, 800) |
| Video | expo-web-browser (in-app) |
| Haptics | expo-haptics |
| Storage Key | `[appname]_game_state_v3` |

Design system is shared: dark background (#0A0A0A), card surfaces (#111111), muted text (#888888), with a per-app accent color:
- CourtXP: #FF6B1A (orange)
- PaddleXP: #00C9A7 (teal)
- GlassXP: #E63946 (crimson)
- BombXP: #4361EE (electric blue)

---

## 0.11 — UNIQUE MECHANIC PER SPORT

Each app has ONE signature mechanic that makes it structurally different from the others:

| App | Unique Mechanic | Description |
|-----|----------------|-------------|
| CourtXP | Heat System | After 3+ consecutive successful possessions, a "Rhythm State" unlocks bonus finisher options — higher-risk moves become available that are inaccessible in cold play. Mirrors Tekken 8's Heat system. |
| PaddleXP | Kameo Gauge | Your doubles partner's positional readiness tracked as a resource gauge (Full / Half / Empty / Cooldown). Kameo moves require gauge availability. Mirrors MK1's Kameo system. |
| GlassXP | Dual Gauge (Vitality + Posture) | Every opponent has two bars — Vitality (direct damage/points) and Posture (accumulated pressure). Posture recovers if you stop pressuring. Lower vitality = slower posture recovery. Deathblows only available on posture break. Mirrors Sekiro's core mechanic. |
| BombXP | Δv Budget | Total energy allocation across swing stages visualized as a stacked bar. Teaches efficient fuel distribution — less on backswing, more on downswing. Tracked per-swing AND per-set for endurance. Mirrors KSP's delta-v staging readout. |

---

## 0.12 — SEASONAL RESET

Every 3-4 months, a soft rank reset occurs (matching Rocket League's seasonal cadence):
- Rank set to Unranked
- Internal progress maintained (all certifications preserved)
- 10 "placement trials" required to re-establish rank
- Result ≈ previous rank, possibly 1 tier lower
- Freshness decay continues during the reset period — moves that weren't maintained will have decayed
- No rank decay from inactivity between seasons (you keep your certifications; rank adjusts on return)

This prevents stagnation and ensures that rank always reflects CURRENT skill, not historical peak.

---

## 0.13 — XP & LEVELING

XP is earned from:
- Certifying a move for the first time (full XP)
- Re-certifying a decayed move (reduced XP, diminishing returns)
- Completing a combo route trial (bonus XP)
- Completing Boss trials (large XP)

XP thresholds:
```
[0, 500, 1200, 2200, 3500, 5200, 7200, 9800, 13000, 17000, 22000]
```

Titles (universal structure, sport-specific names):
```
Level 1-10 titles, sport-themed
```

XP level is a SECONDARY metric. Rank is primary. A high-XP player with decayed moves will have a lower rank than a moderate-XP player with all moves fresh.


---
---
---

# BOOK 1 — COURTXP (Basketball × Tekken 8)

---

# PART 1 — THE PHILOSOPHY

CourtXP treats basketball as a 1v1 fighting game. In Tekken, you control space through footwork, test the opponent with safe pokes, launch them when they commit, extend the combo while they're in recovery, and finish with a high-damage ender. Basketball is structurally identical: you control space through off-ball movement and triple threat, test the defender with jab steps and catch-and-shoot threats, launch past them with a first-step drive or step-back, extend the advantage with dribble moves while they scramble, and finish at the rim or with a pull-up.

The thesis: Basketball is a combat game where you are constantly choosing attack height (rim/mid/three), managing space, reading opponent commitment, and punishing mistakes. Every skill unlocked is a new move in your personal moveset.

Tekken's Heat system maps to basketball's "rhythm" — after 3+ consecutive successful possessions, you enter a powered-up state where higher-risk moves (difficult finishers, deep threes, creative passes) become available because you've earned the right to attempt them.

---

# PART 2 — THE SIX MOVE CATEGORIES


## CATEGORY 1 — STANCE MOVES (Triple Threat / Pre-Action Positions)

The Tekken equivalent of standing neutral — the position from which all attacks originate.

| # | Move | Description | Diff | Exploits / Creates |
|---|------|-------------|------|-------------------|
| 1 | Triple Threat | Balanced stance (feet shoulder-width, ball at hip) where player can shoot, pass, or drive | 1 | Forces defender to honor all 3 options simultaneously |
| 2 | Jab Step (Lead Foot) | Short aggressive step toward defender's lead foot to test commitment | 1 | Reads if defender is flat-footed or over-committed |
| 3 | Cross Jab | Longer jab across body to outside of defender's foot; moves them laterally | 2 | Opens baseline or cross-drive lane |
| 4 | Shot Fake (High) | Quick upward pump of ball + shoulders to lift defender off feet | 1 | Exploits shot-blocking defenders who jump early |
| 5 | Shot Fake / Rip-Through | Rip ball through defender's outstretched arm to draw foul | 2 | Exploits defenders reaching in on fake |
| 6 | Jab-and-Shoot | Jab step, defender retreats, immediately rise into shot | 2 | Exploits defender who gives ground on jab |
| 7 | Jab-and-Drive Same Direction | Jab toward defender, they retreat, attack that exact lane | 2 | Exploits defender who over-retreats |
| 8 | Jab-and-Cross | Jab one direction, cross-step and drive opposite way | 3 | Exploits defender who shifts weight to jab foot |
| 9 | Double Jab | Two jabs in rapid succession in multiple directions | 3 | Creates momentum-read opportunity |
| 10 | Trigger Step / Toe Tap | Fake shot, change speeds, beat defender downhill | 3 | Exploits flat-footed help defenders |
| 11 | Ball-Fake + Step-Through | Fake a pass, step through the gap it creates | 2 | Exploits help defenders cheating on pass lane |
| 12 | Sweep / Draw | Low ball sweep to bait reach-in foul, then rise into shot | 3 | Exploits aggressive defenders who can't keep hands still |
| 13 | Inside Pivot + Face-Up | Quick pivot from post catch to face basket, read defense | 2 | Forces defender to choose top or baseline overplay |
| 14 | Side Step / Push-Out | Small lateral step to create horizontal separation before pull-up | 2 | Creates separation space before shooting |
| 15 | Front Pivot + Square-Up | Using pivot foot to immediately square to basket on any catch | 1 | Creates immediate triple threat from any position |


## CATEGORY 2 — POKES / SAFE MOVES

Like Tekken jabs: safe on block, low risk, creates frame advantage or tests the defense.

| # | Move | Description | Diff | Exploits / Creates |
|---|------|-------------|------|-------------------|
| 1 | Catch-and-Shoot | Catch in rhythm, set feet, release without dribble | 1 | Exploits lazy close-outs |
| 2 | One-Dribble Pull-Up | Single hard dribble, gather, rise into mid-range shot | 2 | Exploits defender who doesn't anticipate quick stop |
| 3 | Pull-Up Mid (Keepout) | Controlled pull-up from mid-range that holds defender at distance | 2 | Creates keepout threat that prevents full denial |
| 4 | Pocket Pass (PnR) | Low quick bounce pass to rolling big when defense collapses | 2 | Exploits help defender rotating too late |
| 5 | Skip Pass | Long overhead pass across court to weak-side shooter | 3 | Exploits help rotation leaving corner unguarded |
| 6 | Quick Release Chest Pass | Fast two-handed pass on time to open cutter | 1 | Exploits lazy rotations |
| 7 | Lob Pass | High-arcing pass over defender to rolling/cutting player | 3 | Exploits switch defense leaving roller unguarded |
| 8 | Drive-and-Kick | Attack paint, draw help, kick out to open shooter | 2 | Exploits help defense collapsing on drive |
| 9 | Drive-and-Dump | Attack, draw defender, dump off to cutting teammate | 3 | Exploits help defender leaving cutter |
| 10 | Swing Pass | Sideline-to-sideline pass to advance ball and shift defense | 1 | Creates defensive scramble in transition |
| 11 | Hand-Off (DHO) | Dribble hand-off to cutting teammate; reads defensive switch | 2 | Exploits switch confusion |
| 12 | Short Roll Dump Pass | Quick hit to rolling big on blitz/hedge coverage | 3 | Exploits aggressive blitz leaving roller open |
| 13 | Catch-and-Drive (No Hesitation) | Immediate attack off catch using speed to beat flat-footed closeout | 2 | Exploits closeout defenders who arrive off-balance |
| 14 | Hesitation Pull-Up | Drive + sudden stop + rise into pull-up | 3 | Exploits over-aggressive on-ball defenders |
| 15 | Post Feed (High-Low) | Entry pass into post from wing | 2 | Creates paint presence forcing defense to adjust |


## CATEGORY 3 — LAUNCHERS (Moves That Put Defender in Recovery)

Like Tekken launchers that begin a juggle — once these connect, the defender is reacting to you.

| # | Move | Description | Diff | Creates |
|---|------|-------------|------|---------|
| 1 | First Step Drive (Strong Hand) | Explosive first dribble to dominant side | 2 | Defender backpedaling |
| 2 | First Step Drive (Weak Hand) | Same attack to weak side; more deceptive | 3 | Defender losing lateral position |
| 3 | Spin Move Entry | Reverse spin off dribble to change attack angle | 3 | Defender spinning out, losing contain |
| 4 | Euro Step Entry | Two-step misdirection past help defender | 3 | Help defender committed wrong direction |
| 5 | Step-Back (Pull-Back) | Explosive backward step creating separation | 3 | Defender closing out from behind, off balance |
| 6 | Crossover Drive | Sharp crossover that beats defender to create drive lane | 2 | Defender on wrong foot |
| 7 | Behind-the-Back Drive | Behind-back dribble that changes attack angle; hides ball | 3 | Defender committed wrong direction |
| 8 | Hesitation-Into-Drive | Hesitation freeze + explosive drive | 3 | Defender's momentum frozen then beaten |
| 9 | Post Seal (Body Seal) | Using body to pin defender on hip | 3 | Defender behind with no contest angle |
| 10 | Drop Step Baseline | Reverse pivot inside foot, attack baseline | 2 | Defender on high side, baseline open |
| 11 | Drop Step Middle | Reverse pivot outside foot, attack toward lane | 2 | Defender locked on hip side |
| 12 | Up-and-Under Setup | Fake jump hook to get defender airborne, step through | 4 | Defender in air, neutralized |
| 13 | Pro-Hop | Two-foot jump-stop toward/past defender; draws contact | 3 | Defender committed to block attempt |
| 14 | Jab-and-Go (Same Direction) | Jab + immediate full-speed drive same direction | 2 | Defender caught shifting weight wrong way |
| 15 | Side-Step Drive (Shake) | Lateral step creates horizontal gap then attack | 3 | Defender off angle |


## CATEGORY 4 — EXTENDERS (Dribble Moves That Maintain Advantage)

Like Tekken filler hits in a juggle — keep the combo alive while the defender recovers.

| # | Move | Description | Diff | Maintains |
|---|------|-------------|------|-----------|
| 1 | Crossover | Ball from one hand to other, basic direction change | 1 | Lateral advantage |
| 2 | Between-the-Legs | Ball through legs to change hands; harder to steal | 2 | Ball security while changing direction |
| 3 | Behind-the-Back | Ball wraps behind to opposite hand; deceptive | 3 | Advantage while protecting ball |
| 4 | Hesitation | Sudden pace change + upright body + re-accelerate | 2 | Keeps defender off-rhythm |
| 5 | In-and-Out | Ball moves toward crossover then returns to same hand | 2 | Direction advantage while confusing defender |
| 6 | Snatch-Back | Quick retreat dribble to reset position and escape trap | 3 | Repositions to attack new angle |
| 7 | Push Cross (Lift) | Low push crossover, then rise into next action | 3 | Flow into pull-up or continue drive |
| 8 | Cross-Cross (Double Crossover) | Two crossovers in rapid succession | 3 | Continued direction confusion |
| 9 | Cross-Behind | Crossover immediately into behind-the-back | 4 | Extreme deception two-part combo |
| 10 | Between-Behind | Through-legs immediately into behind-the-back | 4 | Extreme multi-direction misdirection |
| 11 | Inside-Out + Cross | In-and-out then crossover; multi-fake chain | 3 | Multi-direction confusion |
| 12 | Wrap-Around (Sit & Wrap) | Double behind-the-back from stationary | 4 | Ball security against reaching defenders |
| 13 | Lateral Behind-Back Hesi | Moving laterally with behind-back hesitation | 4 | Pull-up threat while moving side-to-side |
| 14 | Pound Dribble | Hard low dribble to stabilize and reset rhythm | 1 | Control position while reading defense |
| 15 | Figure-8 Flow | Through-legs → behind-back in continuous pattern | 3 | Rhythm and timing base |


## CATEGORY 5 — FINISHERS (How You Cash In the Advantage)

Like Tekken enders — chosen for damage, wall carry, or style.

| # | Move | Description | Diff | Exploits |
|---|------|-------------|------|---------|
| 1 | Standard Layup (Strong Hand) | Basic two-step driving finish at rim | 1 | Clear lane, minimal contact |
| 2 | Reverse Layup | Finish on opposite side of basket, body shields ball | 2 | Shot-blocker under basket |
| 3 | Inside-Hand Layup | Finish with hand closest to basket | 3 | Shot-blocker reaching from dominant side |
| 4 | Floater (One-Foot) | High-arc teardrop released early over defender | 3 | Tall shot-blocker waiting at rim |
| 5 | Floater (Two-Foot / Scoop) | Jump-stop then float; more controlled | 3 | Help defense gathering under rim |
| 6 | Euro Step Finish | Two-step misdirection sidestep | 3 | Help defender committed to one side |
| 7 | Pro-Hop Finish | Two-foot jump-stop then power up through contact | 3 | Defenders who go straight up to block |
| 8 | Up-and-Under Finish | Fake + step-through + close-range layup | 4 | Shot-blocker who left feet on fake |
| 9 | Jump Hook | One-hand hook shot off jump, ball shielded by body | 3 | Taller defender who can't reach over |
| 10 | Drop Step Finish | Power dribble + drop step + aggressive finish | 2 | Defender pinned on hip side |
| 11 | Two-Hand Power Dunk | Authority two-handed dunk through contact | 4 | Smaller or weaker help defenders |
| 12 | Finger Roll | Delicate roll off fingertips at top of jump arc | 4 | Shot-blocker who jumps but can't time contest |
| 13 | Putback | Catch missed shot in air, finish before landing | 4 | Defense falling out of rebound position |
| 14 | Pull-Up at Rim (Runner) | Short pull-up just inside paint | 3 | Defender waiting to contest a layup |
| 15 | Bank Shot (Glass) | Intentional backboard use from mid-range or close | 2 | Any situation where angle favors the glass |


## CATEGORY 6 — SITUATIONAL / OFF-BALL MOVES

Context-dependent options — like Tekken wall-specific or stance-specific moves.

| # | Move | Description | Diff | Exploits |
|---|------|-------------|------|---------|
| 1 | V-Cut | Move toward basket, plant, cut sharply to perimeter | 1 | Flat-footed defense |
| 2 | L-Cut | Move toward paint, cut out to perimeter in L-shape | 2 | Defender caught in mid-transition |
| 3 | Backdoor Cut | When defender overplays, cut hard behind them to basket | 2 | Over-aggressive denial defense |
| 4 | Curl Cut | Curved cut tightly around screener toward basket | 2 | Defender trailing over screen |
| 5 | Flare Cut | Cut away from screener toward perimeter | 2 | Defender going under screen |
| 6 | Straight Cut (Pin-Down) | Read pin-down screen and cut directly to shooting spot | 2 | Defender caught on screener |
| 7 | Slip Screen | Begin setting screen, cut immediately to basket | 3 | Switching or over-helping defense |
| 8 | Ghost Screen (Fake Screen) | Fake setting screen, defender commits, slip to open space | 3 | Defensive switch triggered by screen threat |
| 9 | Flare Slip | Fake flare screen, immediately slip to space | 4 | Switching defense + pre-rotating help |
| 10 | Stagger Screen Cut | Cut off two consecutive screens | 3 | Defender who can only chase one screen |
| 11 | DHO Cut | Accept dribble hand-off and immediately attack gap | 2 | Switch confusion on hand-off |
| 12 | Step-Up Screen Cut | After post feed, use step-up screen to free shooter | 3 | Help rotation vacancy |
| 13 | Back Cut (Screen Reject) | Reverse cut when defender anticipates screen | 3 | Defender cheating over the top |
| 14 | Gate Screen Navigation | Running through two defenders forming a gate screen | 3 | Tunnel vision defense |
| 15 | Post Isolation (Off Switch) | After screen forces switch, post up smaller defender | 3 | Mismatch created by forced switch |


---

# PART 3 — SEVEN SEQUENTIAL LAYERS

## LAYER 0 — STANCE (The Body)
Equivalent to learning to move in Tekken before throwing a single punch. Pure athleticism and court IQ prerequisites.

Content: Lateral quickness, change-of-direction, jump mechanics, body positioning, court vision (reading 3 players simultaneously), game film basics.

Trial: Pass/fail physical benchmarks + 1-rep film review. No checkboxes.

## LAYER 1 — NEUTRAL (Space Control)
The Tekken equivalent of footwork, back-dashing, and controlling range. All attacks come from a position in space.

Content: Spacing principle (12-15 ft separation), the sweet spot (threat range distance), backdoor read (whiff punishing), deny + react, dead ball positioning.

Trial: Demonstrate correct spacing in a 3-on-0 walkthrough + identify 2 whiff-punish opportunities from film.

## LAYER 2 — POKE (Safe, Reliable Moves)
In Tekken, jabs are safest — fast, low-commitment, create frame advantage. Basketball translation: safe scoring and passing options that don't gamble.

Content: Jab step, catch-and-shoot, quick first step, short roll pass, pull-up mid.

Trial: Execute each poke with correct form against a defender. Rep trial format.

## LAYER 3 — PRESSURE (Forcing Decisions)
Once you have frame advantage, apply pressure strings — sequences that force the opponent to guess. Every option they pick to defend opens a different punish.

Content: Drive or pop read, jab-into-drive (frame trap), hip seal, dribble-at (pressure pass), screen + react.

Trial: Execute each pressure move in live drill. Demonstrate at least 2 different reads off the same setup.

## LAYER 4 — COMBO ROUTES (Sequential Attack Chains)
A combo is a series of moves that are unblockable once the first one connects. Once you've beaten your defender, you enter a combo state — the defense must respond, creating predictable rotations.

Content: 8 combo routes, each requiring specific L2 + L3 prerequisites:
- Iso → Shot Fake → Drive → Finish at Rim (4-hit starter)
- Screen → Drive → Kick Out → Corner Three (PnR combo)
- Post Entry → Up-and-Under → Kick Out (Post combo)
- Skip Pass → Corner Catch → Drive → Floater (Pass-led combo)
- Drive → Stop → Pull-Up → Off-Balance Finish (Floater combo)
+ 3 additional archetype-specific routes

Trial: Execute full combo sequence with a defender. 3-of-5 successful executions.

## LAYER 5 — MIX-UP (Defeating Pattern Recognition)
High-level Tekken is about being unreadable. Change timing, change height, go the other way.

Content: Counter-scout (conditioning), level change (attack height mixing), tempo kill, second action reads, reverse counterhit (attacking during help defender's recovery).

Trial: Film review of 3 games showing 2+ conditioning sequences, 3+ level changes, and zero predictable patterns.

## LAYER 6 — BOSS COMBOS (Signature Sequences)
Optimal combos are character-specific, high-damage sequences that require mastery of everything below.

Content: Archetype-specific boss combos:
- POINT GOD: Dribble-at → backdoor → lob → skip → corner three in one possession
- SNIPER: Pull-up → offensive rebound → put-back
- SLASHER: Drive → draw foul → and-one → full-court pressure
- ENFORCER: Post-catch → up-and-under → kick out → drive on scramble
- GHOST: 4 correct off-ball cuts in one possession → open three

Trial: Film submission + external review. Cannot be self-certified.

## LAYER 7 — MASTER RANK (Full System Integration)
You are now reading the player, not the character.

Content: Opponent model, combo creation, teaching rep, flow state protocol.

Trial: Portfolio submission with film evidence.


---

# PART 4 — ARCHETYPES

| Archetype | Tekken Analog | Core Identity | Primary Combos |
|-----------|-------------|---------------|----------------|
| POINT GOD | Kazuya/Mishima | High execution, playmaking-first | Pass-led and screen combos |
| SNIPER | Bryan Fury | Range, patience, whiff-punish specialist | Pull-up, catch-and-shoot, deep range |
| SLASHER | Devil Jin / Akuma | Aggressive pressure, drive-first | Drive-heavy, floater, and-one combos |
| ENFORCER | Gigas / Jack-8 | Physical dominance, post control | Post combos, seal, putback routes |
| GHOST | Master Raven | Off-ball movement, misdirection | Cut-based, backdoor, skip-pass combos |


---

# PART 5 — LANGUAGE MAP

| Concept | CourtXP Term |
|---------|-------------|
| Complete a move | Certify this move |
| Drill | Trial / Sparring rep |
| Coach tip | Tekken Note |
| Stat boost | Frame Advantage |
| Move decayed | MOVE FORGOTTEN |
| Move getting stale | FADING — re-certify |
| My Board | Combo Book |
| Achievements | Titles ("Whiff Punisher", "Pressure Merchant") |
| OVR number | GOLD I — Division 3 |
| Practice session | Sparring Session |
| Combo route | Combo Route |

---

# PART 6 — UNIQUE MECHANIC: HEAT SYSTEM

After 3+ consecutive successful possessions (scored, assisted, or drew a foul), the player enters HEAT STATE for a limited window. During Heat:
- Layer 4+ combo routes that are normally locked become temporarily available
- Speed-up bonuses on trial performance
- "Heat Smash" equivalent: a single high-risk, high-reward play attempt (like a deep step-back three or a showtime dunk)

Heat is consumed after one use or expires after a set time window. It mirrors Tekken 8's once-per-round Heat system — earned through aggressive play, spent on a decisive moment.

---

# PART 7 — RANK LADDER (Tekken-Themed)

| Rank | Sekiro Equivalent (for reference) | Tekken Equivalent |
|------|----------------------------------|-------------------|
| Unranked | — | 1st Dan |
| Bronze | Ashina Outskirts | Beginner ranks |
| Silver | Hirata Estate | Fighter → Marauder |
| Gold | Ashina Castle | Warrior → Juggernaut |
| Platinum | Sunken Valley | Destroyer → Vanquisher |
| Diamond | Ashina Depths | Ruler → Overlord |
| Champion | Fountainhead Palace | Fujin → Raijin |
| Grand Champion | Endgame | Tekken King → Emperor |
| Legend | Inner Isshin | Tekken God Omega |


---
---
---



---
---
---

# BOOK 2 — PADDLEXP (Pickleball × Mortal Kombat 1)

# PADDLEXP — FULL SYSTEM SPEC
## Pickleball × Mortal Kombat 1

---

# PART 1 — THE PHILOSOPHY

PaddleXP treats pickleball as a tag-team fighting game. In MK1, you control a main fighter AND a Kameo partner. Your main fighter has dial-up strings (pre-set attack sequences you must input in order), special moves (motion-input techniques that cancel out of strings), and a Super Meter that fuels enhanced specials and a once-per-round Fatal Blow. Your Kameo partner jumps in on a cooldown gauge to extend combos, create mix-ups, or bail you out of pressure.

Pickleball doubles is structurally identical. You are the main fighter. Your partner is the Kameo. The serve-return-third sequence is a mandatory dial-up string that must be executed before the real fight begins. The kitchen line is the close-quarters battle zone where the highest-skill exchanges happen. Speed-ups and Ernes are your finishers. And the entire game revolves around meter management — building momentum through patient dink exchanges until you earn the right to spend it on a high-risk attack.

Every category in PaddleXP is named after an MK1 system. Every move is classified by its combat function. Every layer gates content the way Kombat Akademy gates its tutorial sections — you cannot see the next section until the current one is complete.

---

# PART 2 — THE SIX MOVE CATEGORIES

In MK1, a character's movelist is organized into: Basic Attacks, Kombo Attacks (Strings), Special Moves, Kameo Moves, Throws, and Fatal Blow. PaddleXP mirrors this exactly.


## CATEGORY 1 — BASIC ATTACKS (Stance & Ready Position)

In MK1, basic attacks are your single-button normals — standing 1, standing 2, down+3, etc. They are the fastest, safest actions in the game. They don't do much damage alone, but they are the building blocks that strings and specials are built from.

In pickleball, basic attacks are your ready positions and single-contact fundamentals — the things you must be able to do before any sequence makes sense.

| # | Move | Description | Diff | Defensive State Exploited |
|---|------|-------------|------|--------------------------|
| 1 | Continental Grip (Neutral Stance) | Standard paddle grip with V-shape on edge; enables all shot types without grip change | 1 | Prerequisite — no exploit, pure foundation |
| 2 | Athletic Ready Position | Knees bent, paddle at 10 o'clock, weight on balls of feet, eyes tracking ball | 1 | Enables reaction to any incoming shot type |
| 3 | Split Step | Small hop-and-land timed to opponent's contact; loads legs for any direction | 1 | Resets your movement state after every shot — the "neutral reset" |
| 4 | Forehand Volley (Punch) | Compact forward-press volley, no backswing, forehand side | 1 | Absorbs pace; safe response to any ball at chest height |
| 5 | Backhand Volley (Punch) | Same as forehand but backhand side; paddle face stays firm | 1 | Absorbs pace from backhand side |
| 6 | Forehand Groundstroke | Full-swing forehand off the bounce; generates pace | 2 | Attacks high-bouncing or slow returns |
| 7 | Backhand Groundstroke | Full-swing backhand off the bounce | 2 | Same as forehand from backhand side |
| 8 | Underhand Serve (Basic) | Legal underhand contact below waist; deep and consistent | 1 | Starts the point; pins receiver at baseline |
| 9 | Return of Serve (Deep) | High-margin return aimed deep to server's feet | 1 | Pins serving team at baseline; buys time to reach kitchen |
| 10 | Overhead (Standing) | Basic overhead smash on a short lob; full extension | 2 | Punishes weak lobs that land short |
| 11 | Block Return (Absorb) | Paddle-face absorb of a hard drive; no swing, just redirect | 2 | Neutralizes pace from aggressive drives |
| 12 | Toe Drag Adjustment | Small lateral shuffle at NVZ line to maintain optimal spacing | 1 | Keeps you in position for any kitchen exchange |
| 13 | Paddle-Up Guard | Holding paddle at 10-11 o'clock position while at NVZ; faster reaction | 1 | Prepares for sudden speed-ups; reduces reaction time |
| 14 | Cross-Step Recovery | Quick cross-step to recover center position after wide ball | 2 | Returns to neutral after being pulled wide |
| 15 | Two-Hand Backhand Base | Two-handed backhand grip for added stability and power | 2 | Extra control against hard drives to backhand side |


## CATEGORY 2 — STRINGS (Mandatory Shot Sequences)

In MK1, strings are dial-up combos — pre-set sequences of buttons that must be input in order (like Forward+1, 2, 3). You cannot skip the second hit to get to the third. The entire sequence must be executed. If you drop a hit, the string ends.

In pickleball, the serve-return-third shot sequence IS a mandatory string. The two-bounce rule literally forces this — the ball must bounce once on each side before volleys are legal. This means every single point in pickleball begins with a 3-hit dial-up string that must be completed before the real game starts. No other sport has this.

Each string below is a complete serve-to-transition sequence. The string ends when both teams reach the kitchen line or when a winner/error occurs.

| # | String Name | Sequence (Inputs) | Diff | What It Creates |
|---|-------------|-------------------|------|-----------------|
| 1 | Basic Serve String | Serve deep → Return deep → Third shot drop | 2 | Neutral position — both teams at kitchen, dink game begins |
| 2 | Drive String | Serve deep → Return deep → Third shot drive → Fifth shot drop | 3 | Forces pop-up or error on third; resets with fifth if drive is absorbed |
| 3 | Shake & Bake String | Serve deep → Return deep → Player A drives third → Player B crashes and volleys | 4 | Two-hit finishing sequence — the drive creates the pop-up, the crash finishes it |
| 4 | Lob Return String | Serve deep → Lob return over server → Server retreats → Fifth shot from mid-court | 3 | Buys maximum time; forces server into awkward transition shot |
| 5 | Body Serve String | Body serve (jams hip) → Weak return → Aggressive third shot drive | 3 | Serve disrupts receiver's mechanics; third shot punishes the weak return |
| 6 | Angle Serve String | Wide angle serve → Receiver pulled off court → Third to open middle | 3 | Creates court geometry advantage from the serve |
| 7 | Drop-Drop String | Serve → Return → Third shot drop → Opponent drives → Fifth shot drop | 3 | Patient double-drop — refuses to engage in drive battle; forces opponent to kitchen |
| 8 | Stack Serve String | Stacked serve position → Serve → Switch sides → Third from preferred forehand | 4 | Stacking puts stronger forehand to the middle for the third shot |
| 9 | Return-and-Crash String | Serve → Hard drive return → Receiver crashes to kitchen immediately | 3 | Aggressive return puts immediate pressure; receiver at net before server can react |
| 10 | Middle Confusion String | Serve down middle → Return to middle → Third to middle seam | 2 | Three consecutive middle balls create communication chaos between opponents |
| 11 | Changeup String | Power serve → Soft return → Drop third | 3 | Speed changes on every shot; nobody can find rhythm |
| 12 | Poach Setup String | Zone serve to forehand → Predictable cross-court return → Partner poaches | 4 | The serve direction engineers the return angle for a pre-planned poach |
| 13 | Fake Drop String | Serve → Return → Fake drop motion then drive | 4 | Body language says drop; ball says drive. Exploits opponents reading your motion |
| 14 | Short Angle Return String | Serve → Short angle return to sideline → Server jammed on third | 3 | Pulls server wide; third shot is from a compromised position |
| 15 | Double Drive String | Serve → Drive return → Drive third → Drive fifth (all pace) | 3 | Pure aggression; overwhelms teams that cannot block-and-reset |


## CATEGORY 3 — SPECIAL MOVES (High-Skill Techniques)

In MK1, special moves are motion-input attacks (Down, Forward+1 or Back, Down+2) that have unique properties — they launch, they're safe on block, they have armor, they create mix-ups. They are what define a character's identity. Enhanced versions (EX specials) cost meter and have additional properties (armor, more damage, juggle extension).

In pickleball, specials are the individual high-skill techniques that define your game — the third shot drop, the speed-up, the reset dink, the erne. Each one has a specific tactical function and a specific defensive state it exploits. "Enhanced" versions of these specials cost more commitment (risk, energy, positioning) but yield greater reward.

| # | Move | Description | Diff | Exploits | Enhanced Version |
|---|------|-------------|------|----------|-----------------|
| 1 | Third Shot Drop | Soft arcing shot from baseline into opponent's kitchen; the defining pickleball special | 3 | Neutralizes NVZ advantage; buys time to advance | EX: Topspin drop that kicks up and forward, harder to attack |
| 2 | Third Shot Drive | Low, fast topspin drive through the transition zone | 2 | Weak volleyers; teams that can't reset | EX: Body drive aimed at hip; jams their paddle mechanics |
| 3 | Speed-Up (Flick) | Sudden wrist-driven attack from a dink exchange; minimal backswing | 3 | Opponents in passive dink stance; paddle low | EX: Cross-court speed-up to far corner; maximum angle change |
| 4 | Reset Dink | Absorb a hard drive or speed-up and drop it softly into kitchen | 3 | Opponent committed to high-tempo attack; expects you to pop up | EX: Reset with slight topspin that lands deeper, harder to re-attack |
| 5 | Erne | Jump/step outside NVZ to volley a dink early at extreme angle | 4 | Opponent dinking too wide near sideline; predictable cross-court pattern | EX: Double Erne — execute, recover, execute again from other side |
| 6 | ATP (Around the Post) | Shot hit around the side of the net post; no net clearance needed | 5 | Opponent pulled you extremely wide; ball is below net height but angle exists | No enhanced version — this is already the ultimate |
| 7 | Lob (Offensive) | High arc over net player's head to deep court | 3 | Opponent crowding kitchen line too aggressively | EX: Topspin lob that accelerates downward after clearing opponent |
| 8 | Overhead Smash (Jump) | Full-swing overhead hit while jumping to intercept deep lob | 4 | Opponent's lob is deep but not out; intercept before bounce | EX: Angled overhead to sideline; placement over power |
| 9 | Half Volley | Contact ball immediately after bounce while still rising | 3 | Ball too low to volley, too fast to let bounce fully; emergency technique | EX: Half volley with topspin; turns defense into offense |
| 10 | Topspin Dink | Dink with forward rotation; kicks up off bounce, lands deeper in kitchen | 3 | Opponent standing too close to NVZ line; pushes them back | EX: Backhand topspin dink; more deceptive, harder angle |
| 11 | Roll Dink (Inside-Out) | Wrist roll at contact gives ball top-and-sidespin for curving trajectory | 4 | Curves into opponent's body or off court; very hard to read | No enhanced — already high difficulty |
| 12 | Punch Volley | Firm compact drive volley from chest height; no wrist, no backswing | 2 | Pop-up at chest level; opponent expected soft dink | EX: Directed punch volley to specific body part (hip, shoulder) |
| 13 | Transition Drop Volley | Soft volley taken out of the air in transition zone; drops into kitchen | 4 | Takes ball before bounce to speed up your advance to kitchen | EX: Drop volley with slice; skids and stays extra low |
| 14 | Backhand Flick | Quick wrist-snap attack from backhand side; deceptive because backhand usually defensive | 4 | Opponent cheating to your forehand side; backhand looks passive | No enhanced — surprise factor is the point |
| 15 | Counter Speed-Up | Block opponent's speed-up and immediately return with equal or greater pace | 4 | Opponent's speed-up is too central or too predictable; fire it back | EX: Counter speed-up redirected to partner instead of attacker |


## CATEGORY 4 — KAMEO MOVES (Partner Actions)

In MK1, the Kameo is your tag-team partner. They have their own gauge (starts full, recharges over time, divided into actions that cost different amounts). The Kameo can extend combos mid-sequence, create mix-ups that the main fighter can't do alone, and rescue you from pressure. If your Kameo is on cooldown (gauge empty) or has been hit, they're unavailable — you're on your own.

In pickleball doubles, your partner IS the Kameo. They have a "gauge" — their court position and readiness. If they're out of position (gauge depleted), they can't assist. If they're at the kitchen line with paddle up (gauge full), they can extend your attack, cover your gap, or finish your combo. Every Kameo move requires coordination — calling the assist at the wrong time (partner not ready) wastes it.

| # | Move | Description | Diff | Gauge Cost | What It Creates |
|---|------|-------------|------|------------|-----------------|
| 1 | Crash Volley (Shake & Bake Finish) | Partner rushes forward to volley the pop-up created by your drive | 4 | High — partner fully commits forward; if drive doesn't create pop-up, partner is exposed | Point-ending finish off your drive setup |
| 2 | Standard Poach | Partner crosses center to intercept opponent's predictable cross-court shot | 3 | Medium — partner leaves their side temporarily | Surprise interception; changes opponent's safe patterns |
| 3 | Fake Poach (Poach-and-Pick) | Partner shows poach movement but holds; opponent adjusts to cover poach, leaving line open for you | 4 | Low — partner barely moves; the threat does the work | Opens the line without partner committing |
| 4 | Switch Call | Mid-rally call to switch sides with partner to cover a gap or exploit a mismatch | 3 | Medium — both players must execute simultaneously | Closes a gap or puts stronger player on the active side |
| 5 | Cover Call | After your wide ball pulls you off court, partner slides to cover your vacated space | 2 | Medium — partner sacrifices their optimal position to cover yours | Prevents opponent from attacking the gap you left |
| 6 | Stack Switch (Serve) | Pre-planned position swap after serve to put both players on preferred sides | 3 | Low — executed before point is live | Aligns forehands optimally for the rally |
| 7 | Stack Switch (Return) | Same as serve stack but from return side | 3 | Low — executed before point is live | Same alignment benefit from receiving side |
| 8 | Bert (Partner-Side Erne) | Partner executes an Erne on YOUR side of the court — the far-side ambush | 5 | Very High — partner completely abandons their side; if read, entire court is open | Ultimate surprise; opponent dinking to "safe" side gets ambushed |
| 9 | Tandem Advance | Both players move forward together in sync after a successful drop | 2 | Low — both players advancing is standard good play | Establishes kitchen line control as a unit |
| 10 | Signal Poach (Pre-Planned) | Before point, agree on specific trigger for poach — a hand signal or pattern recognition | 3 | Low — coordination cost, not positioning cost | Higher success rate than reactive poach; partner is already moving |
| 11 | Middle Ownership Call | Verbal call establishing who takes the middle ball (forehand priority or positional) | 1 | None — pure communication | Eliminates the most common doubles error: both players reaching for middle |
| 12 | Two-Ball Defense | When opponents attack with pace, both partners absorb and reset together; neither attacks | 3 | Medium — both players must resist the urge to counter-attack | Survives opponent's pressure string; resets to neutral |
| 13 | Offensive Lob Cover | You lob over opponent's head; partner immediately adjusts position for the expected return | 3 | Low — positional adjustment only | Ensures partner is ready for whatever comes back after your lob |
| 14 | Drive-and-Slide | You drive third shot; partner slides to the center of the court to cover the likely response angle | 3 | Medium — partner must read your drive and move simultaneously | Partner covers the most dangerous return angle |
| 15 | Kameo Bait (Leave Gap) | Deliberately leave a gap in your coverage that looks like an error; partner is already moving to intercept | 5 | Very High — if opponent doesn't bite, you're genuinely out of position | Pre-set trap; opponent hits into the gap, partner is already there |


## CATEGORY 5 — FATAL BLOWS & FINISHERS (Gated High-Risk Attacks)

In MK1, the Fatal Blow is a cinematic, devastating attack available only when your health drops below 30% AND your Kameo is available (not on screen, not in cooldown, not locked out from being hit). It's once per round. If blocked or whiffed, it goes on a long cooldown. It is the ultimate high-risk, high-reward option — and it's gated by TWO conditions being true simultaneously.

In pickleball, Fatal Blows are the spectacular, point-ending attacks that require specific conditions to be available. You can't just throw an Erne anytime. You need the court position (your "health" state — are you at the right spot?), your partner must be covering (Kameo available), and you get limited attempts before the opportunity window closes.

| # | Move | Description | Diff | Gate Conditions | Risk if Missed |
|---|------|-------------|------|-----------------|----------------|
| 1 | Erne (Forehand) | Jump/step outside NVZ to intercept dink at sharp downward angle | 4 | Opponent dinking wide + you're at NVZ + partner can cover your vacated spot | Partner exposed 2v1; you're outside the court |
| 2 | Erne (Backhand) | Same as forehand Erne but from backhand side; more deceptive | 5 | Same as forehand Erne + backhand comfort | Same as forehand; harder recovery |
| 3 | ATP (Around the Post) | Hit ball around the net post after being pulled extremely wide | 5 | You must be pulled past the sideline + ball must be below net height + angle to post must exist | If missed, you're 10 feet off court; point is essentially over |
| 4 | Overhead Winner (Jump Smash) | Maximum-power overhead aimed at open court for outright winner | 4 | Opponent lob must be short enough to attack + you must have time to load full swing | If blocked, opponent has easy counter; you're mid-air |
| 5 | Speed-Up Winner (Body Shot) | Full-commit speed-up aimed directly at opponent's dominant shoulder | 3 | Opponent must be in passive dink stance + their paddle must be low + your ball must be above net height | If blocked/countered, opponent has pace advantage |
| 6 | Inside-Out Winner | Forehand inside-out speed-up that pulls across opponent's body | 4 | Must have forehand setup + opponent leaning wrong direction | Telegraphs your position; opponent can redirect |
| 7 | Drop Shot Winner | After establishing drive pattern, feathered drop shot that dies at net | 4 | Opponent must be retreating expecting another drive + you need touch control at full speed | If it sits up, opponent smashes it |
| 8 | Tweener (Between-the-Legs) | Emergency between-legs lob or passing shot when ball is past you | 5 | Ball must be past your body + you must be moving away from net + any return keeps point alive | Extremely low percentage; but any contact is a win |
| 9 | Fake Erne into ATP | Show Erne movement, opponent adjusts wide, you go around the post instead | 5 | Need Erne position established + opponent must respect Erne + wide-enough angle for ATP | Double commitment — if neither works, you're completely out |
| 10 | Crash Overhead (Partner Fatal) | Partner crashes from mid-court to smash a pop-up overhead at the kitchen line | 4 | Your drive must create a pop-up + partner must be advancing + ball must be high enough to smash | Partner is at net with no time to recover if smash fails |


## CATEGORY 6 — DEFENSE & METER (Blocks, Resets, Resource Management)

In MK1, defense is not passive. Blocking is active (hold back), Flawless Block requires frame-perfect timing (block within 2 frames of an attack connecting), and Breakers cost 3 full meter bars plus your Kameo must be available. The defender actually GAINS more meter for being hit than the attacker gains for hitting — this is MK1's built-in catch-up mechanic. Meter management determines whether you can use EX specials, attempt a Breaker, or just have to eat the pressure.

In pickleball, the equivalent is the reset game and momentum management. The receiving team starts every point with an inherent advantage (they're already moving to the kitchen while the serving team is trapped at baseline). That IS the catch-up mechanic — the team that just got scored on (lost the serve) now gets the positional advantage. Meter in PaddleXP represents momentum: consecutive successful resets and patient dink exchanges build your meter; getting sped-up or making errors drains it.

| # | Move | Description | Diff | MK1 Equivalent | What It Does |
|---|------|-------------|------|----------------|--------------|
| 1 | Standard Block (Reset Dink) | Absorb opponent's speed-up and softly drop ball into kitchen | 3 | Standing Block | Neutralizes attack; returns to neutral; you survive |
| 2 | Flawless Block (Perfect Reset) | Frame-perfect reset that not only absorbs the speed-up but places the ball in an unattackable spot (deep cross-court kitchen corner) | 4 | Flawless Block | Negates opponent's attack AND denies them any advantage from the exchange; you gain momentum |
| 3 | Low Block (Dig) | Get paddle under a ball aimed at your feet; scoop it up and back into play | 3 | Low Block (crouch block) | Survives attacks aimed at your most vulnerable zone |
| 4 | Breaker (Emergency Lob Reset) | Under heavy sustained pressure at the kitchen, throw up an offensive lob to force opponents back and break their pressure string | 3 | Combo Breaker (3 bars) | Costs momentum (you lose kitchen position advantage) but escapes the pressure sequence entirely |
| 5 | Getup Option (Transition Recovery) | After being pushed back from kitchen by a lob or drive, execute the correct recovery sequence to re-establish NVZ position | 3 | Getup Attack / Delay Getup | Returns you to the "standing" state (kitchen line) from a "knockdown" state (baseline/transition) |
| 6 | Meter Gain: Patient Dink Rally | Each quality dink that lands in the intended zone builds your momentum meter | 1 | Meter gain from landing attacks | Builds resource toward EX specials (enhanced shots) and Fatal Blow availability |
| 7 | Meter Gain: Receiving Team Advantage | As the returning team, you start with partial meter because the rules give you NVZ access first | 1 | Defender gains more meter than attacker | Built-in catch-up: team that just lost a point now has positional + meter advantage |
| 8 | Meter Spend: Enhanced Third Shot Drop | Spend momentum to attempt the enhanced (topspin) version of the third shot drop | 3 | EX Special Move (1 bar) | Better version of the fundamental special; costs accumulated momentum |
| 9 | Meter Spend: Enhanced Speed-Up | Commit to a speed-up that you've earned through a patient dink exchange; the "earned" speed-up is more effective than a random one | 3 | EX Special Move (1 bar) | Your patience built the meter; now you spend it on a higher-percentage attack |
| 10 | Armor Move (Drive Through Contact) | Hit a drive with full commitment, accepting that you may get hit simultaneously; your shot has priority because of full commitment | 3 | Power Crush / Armor Move | Trades with opponent's attack; your drive continues despite their counter-attack |
| 11 | Delay Getup (Slow Transition) | Deliberately take extra time in transition zone to read opponent's positioning before advancing to kitchen | 2 | Delay Getup (timing mix-up) | Forces opponent to wait for you; disrupts their timing for an attack on your approach |
| 12 | Chip Damage (Pressurizing Dink) | A dink that's intentionally hard to handle — not an attack, but not neutral either — that slowly wears down opponent's patience | 3 | Chip Damage on Block | Doesn't win the point outright but accumulates small advantages that eventually force an error |
| 13 | Frame Trap (Fast Dink into Speed-Up) | Quick dink that forces opponent to react, then immediate speed-up before they can recover guard position | 4 | Frame Trap (plus frames into attack) | Opponent blocks the dink (resets guard low), but the speed-up arrives before guard comes back up |
| 14 | Throw (Body Dink) | Dink aimed directly at opponent's hip or dominant shoulder to jam their mechanics | 3 | Throw (unblockable) | Attacks the one zone that's hardest to block; forces awkward paddle angle |
| 15 | Reversal (Counter Speed-Up) | Opponent commits to speed-up; you time your counter perfectly and send it back harder | 4 | Reversal (immediate counter after blocking) | Turns their offense into your offense in one action |


---

# PART 3 — SEVEN SEQUENTIAL LAYERS

Content is gated exactly like MK1's Kombat Akademy: you cannot see the next section until the current one is fully certified. Layers are invisible until unlocked. This is the Rocket League rank-lock philosophy — you earn the right to see what's next.


## LAYER 0 — BASIC TUTORIAL (Kombat Akademy: Basics)

The mandatory entry point. Every player completes this before anything else unlocks.

Content: All 15 Basic Attacks (Category 1). Athletic ready position, split step, continental grip, forehand/backhand volley, groundstrokes, basic serve, basic return, overhead, block return, paddle-up guard.

Trial: Execute each basic attack in isolation. 3-of-5 successful reps per move. Film yourself performing all 15. Total time: 2-3 sessions.

Pass: All 15 moves certified. Layer 1 appears.

Rank earned: UNRANKED → BRONZE III


## LAYER 1 — STRINGS (Kombat Akademy: Offense — Kombo Attacks)

The serve-return-third sequence is pickleball's mandatory dial-up string. You cannot play the real game without executing these in order.

Content: First 8 Strings (Category 2, #1-8). Basic Serve String, Drive String, Shake & Bake String, Lob Return String, Body Serve String, Angle Serve String, Drop-Drop String, Stack Serve String.

Trial: Execute each complete string in a live drill (3v3 or 2v2). The entire sequence must be completed — if you drop the string mid-sequence (miss the third shot drop, serve into the net), the trial attempt fails. 3-of-5 successful completions per string.

Pass: All 8 strings certified. Layer 2 appears.

Rank earned: BRONZE II → BRONZE I


## LAYER 2 — SPECIAL MOVES (Kombat Akademy: Offense — Special Moves)

Now that you can execute the mandatory strings, you learn the individual high-skill techniques that make your game unique.

Content: First 8 Special Moves (Category 3, #1-8). Third shot drop, third shot drive, speed-up (flick), reset dink, Erne, ATP, offensive lob, jump overhead.

Trial: Each special move has a specific pass/fail test. Third shot drop: 7-of-10 land in the kitchen from behind the baseline. Speed-up: 5-of-8 result in a winner or forced error in a live dink exchange. Erne: 3-of-5 successful executions in a controlled drill.

Pass: All 8 specials certified. Layer 3 appears.

Rank earned: SILVER III → SILVER I


## LAYER 3 — KAMEO SYSTEM (Kombat Akademy: Offense — Kameo)

You now learn how your partner fits into your game. Every Kameo move requires coordination — your partner must be in position (gauge available) for the move to work.

Content: First 8 Kameo Moves (Category 4, #1-8). Crash volley, standard poach, fake poach, switch call, cover call, stack switch (serve), stack switch (return), Bert.

Trial: Each Kameo move must be executed with a real partner. Both players must understand the trigger and timing. Crash volley: your partner successfully finishes 3-of-5 drive setups. Poach: partner intercepts 3-of-5 cross-court patterns. Bert: 2-of-5 successful executions.

Pass: All 8 Kameo moves certified. Layer 4 appears.

Rank earned: GOLD III → GOLD I


## LAYER 4 — KOMBO ROUTES (Strings + Specials + Kameo Chained)

This is where the MK1 architecture becomes most direct. A kombo in MK1 is: String → Special Cancel → Kameo Extension → Ender. In PaddleXP, a kombo route is a complete multi-shot sequence from serve to point completion.

Content: 8 Kombo Routes, each requiring specific Strings + Specials + Kameo moves as prerequisites.

Example Kombo Routes:

ROUTE 1 — "The Pressure String"
Prerequisite: Basic Serve String (L1) + Third Shot Drive (L2) + Crash Volley (L3)
Sequence: Serve deep → Return deep → Drive third shot → Partner crashes → Partner smash volley
Hits: 5 | Damage: Point-ending

ROUTE 2 — "The Patient Finish"
Prerequisite: Drop-Drop String (L1) + Third Shot Drop (L2) + Speed-Up Flick (L2) + Tandem Advance (L3)
Sequence: Serve → Return → Drop third → Drop fifth → Both advance to kitchen → 4+ dink exchange → Speed-up winner
Hits: 8+ | Damage: Point-ending after extended exchange

ROUTE 3 — "The Erne Trap"
Prerequisite: Angle Serve String (L1) + Reset Dink (L2) + Erne (L2) + Signal Poach (L3)
Sequence: Angle serve → Return → Drop third → Advance → Dink exchange → Force opponent to dink wide → Erne finish
Hits: 7+ | Damage: Point-ending with spectacle

ROUTE 4 — "The Body Lock"
Prerequisite: Body Serve String (L1) + Third Shot Drive (L2) + Punch Volley (L2) + Drive-and-Slide (L3)
Sequence: Body serve → Jammed return → Hard drive at body → Partner slides center → Partner punch volley finish
Hits: 5 | Damage: Point-ending through pressure

ROUTE 5 — "The Counter-Strike"
Prerequisite: Return-and-Crash String (L1) + Reset Dink (L2) + Counter Speed-Up (L2) + Cover Call (L3)
Sequence: Receive serve → Deep return → Crash to kitchen → Absorb opponent's drive → Reset → Counter their speed-up
Hits: 6 | Damage: Turns defense into offense

ROUTE 6 — "Kameo Bait Finish"
Prerequisite: Basic Serve String (L1) + Topspin Dink (L2) + Offensive Lob (L2) + Kameo Bait (L3)
Sequence: Serve → Return → Drop → Advance → Pressurizing dinks → Leave gap → Partner intercepts opponent's attack into gap
Hits: 7+ | Damage: Deception-based point winner

ROUTE 7 — "The Middle Lockdown"
Prerequisite: Middle Confusion String (L1) + Third Shot Drop (L2) + Middle Ownership Call (L3) + Tandem Advance (L3)
Sequence: Serve middle → Return middle → Drop to middle → Both advance → Continue attacking middle seam → Force error
Hits: 6+ | Damage: Communication destruction

ROUTE 8 — "The Full Fatal"
Prerequisite: Shake & Bake String (L1) + Erne (L2) + ATP (L2) + Bert (L3)
Sequence: Drive third → Partner crash → If opponent resets, cycle dinks → If Erne opportunity, take it → If pulled wide, attempt ATP
Hits: Variable | Damage: Adapts to opponent's response at each decision point

Trial: Execute each complete kombo route in a live drill with defenders. 3-of-5 successful full-sequence completions. The route must be executed in order — skipping a step fails the attempt.

Pass: All 8 routes certified. Layer 5 appears.

Rank earned: PLATINUM III → PLATINUM I


## LAYER 5 — MIX-UPS & METER MANAGEMENT

High-level MK1 is about being unreadable. Once your opponent knows your strings and specials, you vary the timing, change the sequence, and condition them to expect one thing then do another. This layer teaches you to weaponize your opponent's scouting against them.

Content: Advanced Strings (#9-15), Advanced Specials (#9-15), all Defense & Meter moves (Category 6).

Focus areas:

CONDITIONING — Establish a pattern over several points (always dink cross-court), then break it deliberately (speed-up down the line). The pattern WAS the setup. The break IS the attack.

METER MANAGEMENT — Understand when you've "earned" a speed-up through patient dink exchanges (full meter) vs. when you're speed-up is random and low-percentage (empty meter). Learn to feel when your momentum gauge is full.

ENHANCED SPECIALS — Execute EX versions of your specials: topspin third shot drop, body-targeted speed-up, deep cross-court perfect reset. These cost more commitment but yield more advantage.

FRAME TRAPS — Sequences where your first shot forces opponent to reset their guard, and your second shot arrives before their guard recovers. Fast dink → immediate speed-up. Pressurizing dink → body attack.

Trial: Film review of 3 complete games where you demonstrate: at least 2 successful conditioning sequences, at least 3 earned speed-ups (patient buildup → attack), at least 2 successful frame traps, and zero random unearned speed-ups.

Pass: Film reviewed and certified. Layer 6 appears.

Rank earned: DIAMOND III → DIAMOND I


## LAYER 6 — FATAL BLOW MASTERY

All 10 Fatal Blows (Category 5) are now available. These are the spectacular, gated finishers that require specific conditions to be legal.

Content: Erne (forehand), Erne (backhand), ATP, overhead winner, speed-up winner (body shot), inside-out winner, drop shot winner, tweener, fake Erne into ATP, crash overhead (partner fatal).

The key learning at this layer is not just executing the moves — it's recognizing when the gate conditions are met. An Erne attempted without the right setup is a wasted Fatal Blow that goes on cooldown (opponent now knows you'll try it and adjusts). An Erne executed when all conditions are met is devastating.

Trial: Live match film submission showing at least 5 successful Fatal Blow executions across at least 3 different types. External review (coach, certified player, or structured rubric) confirms that gate conditions were genuinely met for each attempt — no random Ernes.

Pass: External reviewer certifies. Layer 7 appears.

Rank earned: CHAMPION III → CHAMPION I


## LAYER 7 — MASTER RANK (Kombat Mastery)

You are no longer learning moves. You are reading players. You are building new kombo routes. You are teaching others.

Content:

OPPONENT MODEL — Build an accurate mental model of a specific opponent pair during a match. Identify their tendencies within 3 points. Exploit the tendency by point 5.

KOMBO CREATION — Design a new kombo route from existing certified moves. Document it in your Combo Book with notation, prerequisites, and the defensive state it exploits. Submit for community review.

TEACHING REP — Successfully coach a Layer 0-2 concept to another player. The learner must be able to pass the trial after your instruction.

ADAPTATION PROTOCOL — In a match, demonstrate switching between at least 3 different kombo routes based on what the opponent is showing you. Film review confirms reads, not randomness.

Trial: Portfolio submission — all four components documented with film evidence. External review required.

Pass: Full system mastery certified.

Rank earned: GRAND CHAMPION → SUPERSONIC LEGEND (SSL equivalent)


---

# PART 4 — RANK LADDER

PaddleXP uses the same Rocket League rank structure as CourtXP, with MK1 language for the milestones:

| Rank | Divisions | Layer Required | MK1 Equivalent |
|------|-----------|----------------|----------------|
| Unranked | — | Not started | No rank |
| Bronze III–I | Div 1–4 | Layer 0 complete | Kombat Akademy: Basics |
| Silver III–I | Div 1–4 | Layer 1–2 complete | Kombat Akademy: Offense |
| Gold III–I | Div 1–4 | Layer 3 complete | Kombat Akademy: Kameo |
| Platinum III–I | Div 1–4 | Layer 4 complete | Kombo Trial certified |
| Diamond III–I | Div 1–4 | Layer 5 complete | Mix-Up master |
| Champion III–I | Div 1–4 | Layer 6 complete | Fatal Blow certified |
| Grand Champion III–I | Div 1–4 | Layer 7 in progress | Approaching mastery |
| Legend | No divisions | Layer 7 complete | Kombat Mastery |


---

# PART 5 — LANGUAGE MAP

All in-app copy uses MK1's combat language, never the game title itself:

| Concept | PaddleXP Term |
|---------|--------------|
| Complete a move | Certify this move |
| Drill | Trial / Sparring rep |
| Coach tip | Kombat Note |
| Stat boost | Frame Advantage |
| Move decayed | MOVE FORGOTTEN |
| Move getting stale | GUARD BROKEN — re-certify |
| My Board | Combo Book |
| Achievements | Titles (e.g., "Flawless Blocker", "String Master", "Fatal Blow Artist") |
| OVR number | GOLD I — Division 3 |
| Practice session | Sparring Session |
| Combo route | Kombo Route |
| Partner play | Kameo Assist |
| Speed-up | Finisher |
| Reset dink | Block / Flawless Block |
| Momentum | Meter |
| Random unearned attack | Mashing (negative — the app discourages this) |
| Earned calculated attack | Meter Spend (positive — the app rewards this) |
| Serve-return-third | Opening String |
| Dink exchange | Neutral Game |
| Kitchen line control | Stage Control |


---

# PART 6 — ARCHETYPES (Replace Position)

Instead of "doubles position" as identity, players choose a fighting archetype that determines combo route availability and stat weights:

| Archetype | MK1 Analog | Core Identity | Primary Routes |
|-----------|-----------|---------------|----------------|
| SURGEON | Liu Kang | Precision, timing, patient dink dominance | Dink-based kombos, frame traps, earned speed-ups |
| ENFORCER | Shao | Power drives, body attacks, overwhelming force | Drive-heavy strings, crash volleys, body shots |
| ASSASSIN | Scorpion | Speed-ups, Ernes, ambush attacks, explosive finishers | Fatal Blow routes, Erne setups, ATP attempts |
| WALL | Kenshi | Elite defense, Flawless Blocks, counter-attacks | Reset-based kombos, counter speed-ups, patience routes |
| GENERAL | Johnny Cage | Kameo mastery, partner coordination, team play | Poach routes, Shake & Bake, stacking, Bert setups |


---

# PART 7 — TRIAL TYPES

| Trial Type | Description | Pass Criteria |
|------------|-------------|---------------|
| Rep Trial | Perform a specific action a set number of times | 3-of-5 or 7-of-10 successful reps |
| String Trial | Execute a complete multi-shot sequence from start to finish | 3-of-5 full sequence completions; dropping a shot fails the attempt |
| Kameo Trial | Execute a partner-dependent action with a real partner | Both players succeed in their roles 3-of-5 times |
| Film Trial | Record yourself and review against a rubric | Pass all rubric criteria |
| Live Trial | Execute in a live game or competitive drill | Complete with real opponents present |
| Kombo Trial | Execute a full kombo route in sequence against resistance | 3-of-5 complete routes; skipping a step fails |
| Boss Trial | Film submission for Layer 6-7 moves | External reviewer confirms execution AND gate conditions were met |


---

# PART 8 — FRESHNESS DECAY

Same engine as CourtXP. All certified moves decay over time:

SHARP (100-70): Recently certified. Move is clean.
FADING (70-50): Getting stale. Needs a sparring rep soon.
GUARD BROKEN (50-25): Significant decay. Move quality is degraded.
RUSTY (25-10): Major decay. Barely usable in live play.
FORGOTTEN (below 10): Effectively lost. Must re-certify from scratch.

Decay rate slows with repeated certification (muscle memory). First certification: 8 points per day. Fourth certification: 4 points per day. Sixteenth certification: 2 points per day.

Re-certifying a move resets freshness to 100 and increments the certification count, slowing future decay.


---

# PART 9 — THE KAMEO GAUGE SYSTEM (Unique to PaddleXP)

This is the mechanic that makes PaddleXP different from CourtXP. Because pickleball doubles has a literal partner, PaddleXP tracks a "Kameo Gauge" concept:

FULL GAUGE: Your partner is at the kitchen line, paddle up, in the correct position, and aware of the play call. All Kameo moves are available.

HALF GAUGE: Your partner is in transition or slightly out of position. Only basic Kameo moves (cover call, middle ownership) are available. Crash volleys and poaches are unavailable.

EMPTY GAUGE: Your partner is at the baseline, recovering from a lob, or out of position entirely. No Kameo moves available. You are fighting alone.

COOLDOWN: After a Kameo move is used (poach, crash, Bert), there is a positional recovery period before the next Kameo move is available. Your partner must physically reset to ready position.

The app does not literally track a gauge number — this is a mental model the player learns to read. The trials test whether the player can correctly identify their partner's gauge state before attempting a Kameo move. Attempting a Kameo move with an empty gauge (partner out of position) is the equivalent of calling a Kameo assist when the gauge is depleted — nothing happens, and you're punished.


---

END OF PADDLEXP SPEC


---
---
---

# BOOK 3 — GLASSXP (Padel × Sekiro: Shadows Die Twice)

# GLASSXP — FULL SYSTEM SPEC
## Padel × Sekiro: Shadows Die Twice

---

# PART 1 — THE PHILOSOPHY

GlassXP treats padel as a sword duel fought inside a glass cage. In Sekiro, you do not win by mashing attack. You win by accumulating posture damage through relentless, well-timed pressure — deflecting the opponent's attacks back at them, chipping their vitality to slow their recovery, and recognizing the exact moment their posture breaks so you can execute the Deathblow. Raw vitality damage (health) works, but it is slow and inefficient. The real path to victory is posture destruction.

Padel is structurally identical. You almost never win a point with a single shot. You win by building pressure — deep lobs that push opponents back, tight bandejas that force awkward returns, chiquitas to their feet that demand a difficult low pickup — until the opponent's "posture" breaks: they pop up a weak ball, leave a gap, or misread the glass. That moment of broken posture is your Deathblow window. If you don't take it, they recover, and you start the pressure cycle again.

Sekiro has three additional systems that map perfectly to padel:

PERILOUS ATTACKS (the red kanji warning). In Sekiro, certain attacks cannot be blocked — they require a specific counter. A thrust requires a Mikiri Counter (step into it). A sweep requires a jump. A grab requires a dodge. If you use the wrong counter, you take massive damage. Padel has the same structure: a vibora requires you to let it hit the glass and play it low; a power smash requires you to read the trajectory and use the glass to survive; a bajada requires you to lob over the net player. Each perilous attack has ONE correct counter.

PROSTHETIC TOOLS. Sekiro's prosthetic arm carries special tools — shuriken, firecrackers, flame vent, loaded axe — that cost Spirit Emblems and serve specific tactical purposes. Padel's prosthetic tool is the glass wall itself. No other racket sport has walls. The glass is a tool with specific techniques: back wall returns, side wall returns, double glass navigation, contrapared (hitting your own wall to return), and the spectacular por tres / por cuatro exits. Each glass technique costs energy (positioning, timing, court awareness) and serves a specific tactical purpose.

RESURRECTION. Sekiro can die and resurrect once before a true death. In padel, a seemingly lost point — opponent has smashed, you are retreating, the ball is behind you — can be resurrected with a desperate glass recovery that keeps the rally alive. Resurrection is not a skill you plan; it is a skill you earn through mastering the glass.

---

# PART 2 — THE DUAL GAUGE SYSTEM

This is the core mechanic that makes GlassXP unique among all four XP Sports apps.

Every opponent (and every player) has TWO gauges running simultaneously:

VITALITY GAUGE — Represents direct scoring damage. A clean winner, an unforced error, a point won outright. Vitality damage is permanent within the point — it does not recover. When vitality reaches zero, the point is over. In Sekiro terms, vitality is the red health bar.

POSTURE GAUGE — Represents accumulated rally pressure. Every quality shot you hit fills the opponent's posture gauge. Deep lobs, tight bandejas, well-placed chiquitas, consistent volleys — each one adds posture damage. When the posture gauge is full (posture breaks), the opponent is forced into a weak reply and you get a Deathblow window. However, posture recovers naturally if you stop pressuring. And critically: the lower the opponent's vitality (the more tired, stretched, or out of position they are), the SLOWER their posture recovers. This is Sekiro's most important mechanic — you chip vitality to make posture breaks easier.

In padel terms:
- A fresh, well-positioned opponent recovers posture quickly. If you hit two good lobs but then float one short, they reset.
- A tired, stretched opponent recovers posture slowly. If you have been moving them for 15 shots, even a mediocre ball will keep their posture gauge climbing because they cannot reset.
- Deathblows are only available when posture is broken. Smashing a ball when the opponent is still in position (posture intact) is not a Deathblow — it is a regular attack that they can deflect. A true Deathblow is hitting the winner AFTER you have broken their posture through the rally.

The app teaches players to read both gauges in real time: "Is my opponent's posture climbing or recovering? Have I chipped enough vitality to slow their recovery? Is this the Deathblow window or am I attacking too early?"

---

# PART 3 — THE SIX MOVE CATEGORIES


## CATEGORY 1 — GUARD POSTURE (Stance & Ready Positions)

In Sekiro, guard posture is your default state. You hold block, you maintain stance, you wait for the right moment to deflect or attack. Your posture gauge is always present — if you drop guard (let go of block), your posture recovers faster but you are vulnerable. If you hold guard too long without deflecting, your own posture fills and you stagger.

In padel, guard posture is your ready position at the net and at the baseline — the physical and mental stance that lets you react to anything. Hold it too rigidly (static feet, locked position) and you become vulnerable. Move and reset correctly and you maintain your posture indefinitely.

| # | Move | Description | Diff | Function |
|---|------|-------------|------|----------|
| 1 | Continental Grip | Standard grip with V on bevel edge; enables all padel shots without switching | 1 | Foundation — required for every other move |
| 2 | Net Ready Position | Feet shoulder-width, knees bent, paddle at chest height, weight forward | 1 | Default guard at the net; enables volley and overhead reactions |
| 3 | Baseline Ready Position | Wider stance, slightly lower center of gravity, paddle centered, prepared for glass reads | 1 | Default guard at the back; enables glass returns and lob retrieval |
| 4 | Split Step | Small hop-and-land timed to opponent's contact; loads both legs for any direction | 1 | Posture reset — returns you to neutral after every shot |
| 5 | Recovery Step (Net) | After hitting a volley, immediate return to center of your half at the net | 1 | Prevents posture from staying broken after an attack |
| 6 | Recovery Step (Baseline) | After hitting from the back, return to center behind the service line | 2 | Same principle from the defensive position |
| 7 | Side-Shuffle Position | Lateral shuffle maintaining net-facing orientation while moving to the ball | 1 | Maintains guard posture while moving; never turn your back |
| 8 | Cross-Step Sprint | Cross-step to cover distance for wide balls while keeping paddle ready | 2 | Emergency movement that preserves some guard posture |
| 9 | Back-to-Glass Position | Standing with back near the glass, reading trajectory, paddle low and ready | 2 | Specific guard for defending against deep smashes and lobs |
| 10 | Partner Alignment | Both players positioned with correct spacing — one up, one back, or both at net | 1 | Team posture — the doubles equivalent of a stable guard stance |
| 11 | Wall Awareness Stance | Peripheral awareness of glass proximity without looking at it | 2 | Prevents crashing into glass; maintains spatial orientation |
| 12 | Serve Ready Position | Feet behind service line, ball in non-dominant hand, paddle drawn back | 1 | Opening stance for every service point |
| 13 | Return Ready Position | Positioned to receive serve; weight slightly forward, anticipating depth | 1 | Guard posture for receiving |
| 14 | Overhead Preparation | Non-paddle hand points at incoming lob; paddle loaded behind head; sideways stance | 2 | Specific guard for transitioning to overhead attack |
| 15 | Low Ball Stance | Deep knee bend with paddle face open below the net; prepared for a ball at ankle height | 2 | Guard posture for the most difficult defensive position |


## CATEGORY 2 — DEFLECTIONS (Active Defense That Deals Posture Damage Back)

In Sekiro, a deflect is NOT a passive block. Blocking absorbs damage but fills YOUR posture gauge. A deflect — pressing guard at the exact moment an attack lands — absorbs zero posture damage and fills the ATTACKER'S posture gauge instead. Consecutive perfect deflects are the fastest way to break an enemy's posture. The entire game rewards precision defense over passive blocking.

In padel, a deflection is a defensive shot that does not merely survive — it puts the attacker under pressure. A weak defensive lob (passive block) keeps you in the point but gives the opponent another free overhead. A deep, well-placed defensive lob (deflection) forces the opponent to retreat, reset, and lose their attacking position. The attacker's posture fills because their smash accomplished nothing.

| # | Move | Description | Diff | Posture Damage to Attacker |
|---|------|-------------|------|---------------------------|
| 1 | Deep Defensive Lob (Globo) | High, deep lob to opponent's baseline corner after their smash | 2 | High — forces attacker to retreat fully; resets their position |
| 2 | Low Defensive Return | Compact volley-return of a hard drive; ball stays low over the net | 3 | Medium — absorbs pace and returns it as a difficult low ball |
| 3 | Glass-Assisted Lob | Let the smash hit the back glass, read trajectory, play a lob off the glass rebound | 3 | High — uses the glass tool to turn defense into a deep, pressuring lob |
| 4 | Bandeja Return | Controlled slice overhead return that maintains your net position | 3 | Medium — you survive the lob AND keep net position; attacker gains nothing |
| 5 | Contrapared (Own Wall Return) | Deliberately hit ball into your own glass so it clears the net and lands deep | 4 | Very High — spectacular; opponent's attack completely neutralized by creative defense |
| 6 | Chiquita Off Defense | After retrieving a difficult ball, play a low chiquita to attacker's feet | 3 | High — forces attacker from overhead position down to a difficult low ball |
| 7 | Block Volley (Absorb) | Firm paddle face, no swing; redirect opponent's hard shot back with their own pace | 2 | Low-Medium — survival; maintains rally; modest posture damage |
| 8 | Side Wall Redirect | Use the side glass to redirect an angle shot back into play from a seemingly impossible position | 4 | Very High — spectacular recovery; attacker expected a winner and got nothing |
| 9 | Drop Shot Off Defense | After a deep push to the back, play a delicate drop shot that dies at the net | 4 | High — opponent invested energy in pushing you back; you negate it with touch |
| 10 | Double Glass Recovery | Ball hits back glass then side glass (or reverse); read both bounces and return | 4 | Very High — the most complex deflection; two glass reads in sequence |
| 11 | Between-Legs Emergency | Desperate between-the-legs return on a ball that has passed your body | 5 | Maximum — Resurrection-tier move; opponent thought the point was over |
| 12 | Running Lob | Full sprint to retrieve a wide ball, then lob over the net player's head | 3 | High — physical commitment deflection; attacker's angle shot neutralized |
| 13 | Backhand Slice Redirect | Low backhand slice that keeps the ball at net height; difficult to attack | 3 | Medium — consistent rallying deflection that accumulates small posture damage |
| 14 | Transition Zone Pickup | Ball in the mid-court dead zone; scoop it up before it bounces twice | 3 | Medium — denies the attacker's half-volley attempt; maintains the rally |
| 15 | Overhead Defensive Retrieve | Jumping backward overhead (gancho) to retrieve a lob that went over your head | 4 | High — opponent's lob was supposed to win; you kept it alive from behind |


## CATEGORY 3 — ATTACKS (Posture Damage Dealers)

In Sekiro, regular attacks chip vitality and fill the enemy's posture bar. The key is relentlessness — attacking, retreating, attacking again, never giving the enemy time to recover posture. An attack that is deflected by the enemy still fills THEIR posture bar (because deflecting costs posture to the deflector too, just less than blocking). The only way the enemy recovers posture is if you stop attacking entirely and give them space.

In padel, attacks are shots that fill the opponent's posture gauge — pushing them deeper, pulling them wider, forcing them lower, making each subsequent return harder than the last. No single attack wins the point. But the cumulative effect of 6-8 consecutive quality attacks breaks their posture and opens the Deathblow window.

| # | Move | Description | Diff | Posture Damage Dealt |
|---|------|-------------|------|---------------------|
| 1 | Deep Lob (Offensive Globo) | High lob aimed at opponent's baseline corner; forces full retreat | 2 | Medium — pushes opponent to back wall; they must play from deep |
| 2 | Cross-Court Volley | Firm volley hit diagonally across the court at medium pace | 2 | Medium — angle forces lateral movement; disrupts positioning |
| 3 | Chiquita (to Feet) | Low, soft shot aimed at opponent's feet while they are at the net | 3 | High — forces them to hit upward from below the net; very likely to produce weak return |
| 4 | Bandeja (Slice Overhead) | Controlled, flat overhead with underspin; maintains net position while keeping pressure | 3 | Medium — opponent gets the ball back but you maintained net; sustained pressure |
| 5 | Flat Volley (Directed) | Firm flat volley aimed at the open space between opponents | 2 | Medium — exploits the middle seam; communication pressure |
| 6 | Deep Serve | Heavy serve to opponent's baseline corner; starts the posture pressure from shot one | 2 | Low-Medium — initiates the posture-building sequence |
| 7 | Wide Angle Shot | Shot aimed to pull opponent completely off court to the side wall | 3 | High — maximum lateral displacement; recovery distance is large |
| 8 | Body Shot | Direct shot at opponent's hip or dominant shoulder; jams their mechanics | 3 | High — not a positional disruption but a mechanical disruption; difficult to return cleanly |
| 9 | Topspin Drive | Full topspin groundstroke that kicks up after the bounce | 3 | Medium — heavy ball that pushes opponent back and demands respect |
| 10 | Slice Approach | Low slice while moving forward to the net; skids and stays low | 3 | Medium — forces opponent to lift the ball; transitions you to attacking position |
| 11 | Drop Shot (Dormilona) | Feathered drop shot that dies just over the net | 3 | High — forces opponent to sprint forward; position completely disrupted |
| 12 | Quick Volley Exchange | Rapid-fire volley exchange at the net; first player to blink pops up | 2 | Cumulative — each volley adds small posture damage; the sequence breaks posture |
| 13 | Wall-Targeting Smash | Smash aimed to hit the glass at a difficult angle for the opponent to read | 3 | High — forces glass read under pressure; common source of posture break |
| 14 | Switch Shot (Direction Change) | After establishing a pattern to one side, suddenly redirect to the other | 3 | High — positional expectation broken; opponent caught moving wrong way |
| 15 | Fake Drop into Lob | Show drop shot motion then lift a lob over the rushing opponent | 4 | Very High — opponent sprinted forward on the fake; now must reverse fully |


## CATEGORY 4 — PERILOUS ATTACKS (Red Kanji — Unblockable; Require Specific Counter)

In Sekiro, certain attacks flash a red kanji symbol (the "danger" warning). These attacks CANNOT be blocked. If you try to block them, you take full damage and your posture shatters. Each perilous attack type has exactly ONE correct counter:

- THRUST → Mikiri Counter (step INTO the attack; stomp on the blade)
- SWEEP → Jump (leap over the low attack; stomp the enemy's head)
- GRAB → Dodge (sidestep or sprint away; grabs cannot be blocked or deflected)

Using the wrong counter on a perilous attack is catastrophic. Jumping a thrust does nothing. Mikiri on a sweep gets you hit. The player must read which type of perilous attack is coming and respond with the correct counter in real time.

In padel, perilous attacks are specific overhead and aggressive shots that cannot be "blocked" (passive defense does not work). Each one requires a specific counter-technique. If you use the wrong counter, you lose the point or give up a massive positional advantage.

| # | Perilous Attack | Description | Type | Correct Counter (Only One) | Wrong Counter Penalty |
|---|----------------|-------------|------|---------------------------|----------------------|
| 1 | Vibora (Snake Shot) | Fast overhead with heavy sidespin and slice; ball curves off the glass unpredictably | THRUST | MIKIRI: Step INTO the ball's trajectory after the glass bounce; play it low off the glass rebound before it curves away | Retreating or passive blocking — ball spins away from you; point lost |
| 2 | Power Smash (Remate Plano) | Maximum-force flat smash aimed at the back glass | THRUST | MIKIRI: Read trajectory, let it hit the back glass, step forward into the rebound and play a deep lob | Trying to volley it before the glass — ball is too fast; racket blasted out of position |
| 3 | Kick Smash (Remate con Efecto) | Topspin smash designed to bounce high off the back glass, potentially exiting the court (por tres) | SWEEP | JUMP: Position behind the back glass bounce point; if ball bounces high enough to exit, let it go (your point). If it stays in, play it at the peak of the high bounce | Staying flat-footed — ball bounces over your head; cannot reach it |
| 4 | Bajada (Aggressive Glass Attack) | Hard drive played off the glass descent after an opponent's lob; aggressive timing, hits ball early | THRUST | MIKIRI: Recognize it early, hold position, absorb the pace with a compact low volley or chiquita to their feet | Retreating — gives attacker free run of the net; posture shattered |
| 5 | Par Tres (Ball Exits Over Back Wall) | Smash so powerful the ball bounces off the court surface and over the 3-meter back glass | SWEEP | JUMP: Sprint behind the back glass wall and play the ball OUTSIDE the court, returning it over or around the glass back into play | Staying inside the court — ball exits and you cannot reach it |
| 6 | Par Cuatro (Ball Exits Over Side Wall) | Smash angled so the ball bounces off the court and over the 4-meter side glass | SWEEP | JUMP: Sprint to the side door/opening and play the ball outside the court | Same as par tres — must exit the court to retrieve |
| 7 | Gancho (Reverse Overhead) | Overhead played behind the head (like a backward smash) when a lob goes over the player | GRAB | DODGE: Recognize the gancho motion early and anticipate a non-standard trajectory; be ready for an unusual angle and pace | Treating it like a normal overhead return — trajectory is reversed from expectation; wrong positioning |
| 8 | Rulo (Wrist Roll) | Volley with heavy wrist roll creating exaggerated sidespin; ball curves dramatically after the bounce | THRUST | MIKIRI: Let the ball bounce and read the spin AFTER the bounce, not before; play it once the spin has taken effect and the trajectory is readable | Trying to predict the spin before the bounce — you move the wrong direction |
| 9 | Speed-Up Body Shot | Sudden hard flat shot aimed directly at the body at the net | GRAB | DODGE: Quick reflexive paddle position change; do not swing, just redirect with the paddle face already in guard position | Trying to wind up a full volley — ball arrives before your swing completes; jammed |
| 10 | Wide Angle Vibora | Vibora aimed to hit the side glass and curl away from the court | THRUST | MIKIRI: Move to the side glass early, let the ball come off the glass, step into the rebound with a compact low return | Chasing the ball's flight path instead of reading the glass exit trajectory — you run to the wrong spot |


## CATEGORY 5 — PROSTHETIC TOOLS (Glass Wall Techniques)

In Sekiro, the Prosthetic Arm carries specialized tools — Loaded Shuriken, Flame Vent, Firecrackers, Loaded Axe, Mist Raven, Sabimaru, etc. Each tool costs Spirit Emblems (limited resource), serves a specific tactical purpose, and is devastatingly effective in the right situation but useless in the wrong one. The Shuriken interrupts airborne enemies. Firecrackers stagger beasts. The Flame Vent damages red-eyed enemies. Choosing the right tool for the situation is a core Sekiro skill.

In padel, the glass walls ARE your prosthetic tools. No other racket sport has them. The glass is not a passive boundary — it is an active weapon and an active defensive resource. Each glass technique costs energy (positioning, timing, spatial awareness) and serves a specific tactical purpose. Mastering the glass is what separates padel from tennis, and it is what makes GlassXP's identity unique.

| # | Tool (Glass Technique) | Description | Diff | Sekiro Equivalent | Tactical Purpose |
|---|----------------------|-------------|------|-------------------|-----------------|
| 1 | Back Glass Return (Salida de Pared) | Let the ball hit the back glass, read the rebound trajectory, hit after it bounces off the wall | 2 | Loaded Shuriken (basic, versatile) | Fundamental tool; turns a defensive situation into a controlled return |
| 2 | Side Glass Return | Ball hits side glass and rebounds; read the angle change and play the return | 3 | Flame Vent (situational, effective) | Handles wide balls that would be unreachable without the wall |
| 3 | Double Glass: Back-Side | Ball hits back glass then side glass; two trajectory changes in sequence | 4 | Loaded Axe (powerful, demanding) | Most complex defensive read; two bounces, two direction changes |
| 4 | Double Glass: Side-Back | Ball hits side glass then back glass; different trajectory than back-side | 4 | Loaded Axe (variant) | Same complexity, different read pattern; must distinguish from back-side |
| 5 | Contrapared (Own Wall Shot) | Deliberately hit ball into YOUR OWN back glass so it clears the net on the rebound | 4 | Mist Raven (evasion + counter) | Spectacular; turns an impossible defensive position into an offensive return |
| 6 | Side Wall Contrapared | Hit ball into your own side glass to redirect it back over the net at an angle | 5 | Divine Abduction (disorienting) | Even more spectacular; creates an angle that is nearly impossible to read |
| 7 | Glass Read (Trajectory Prediction) | Before the ball hits any glass, predict which wall(s) it will contact and where it will exit | 3 | Shuriken tracking (anticipation) | Not a shot — a read skill. Determines whether you get to the ball at all |
| 8 | Par Tres Retrieval | Sprint behind the back wall through the door, play the ball outside the court back over the wall | 5 | Loaded Umbrella (desperate defense) | Emergency prosthetic use; last resort that requires extreme athleticism |
| 9 | Par Cuatro Retrieval | Sprint to the side opening, play the ball outside the court back over the side glass | 5 | Loaded Umbrella (variant) | Same desperation, different spatial challenge |
| 10 | Glass Boast (Side Wall Redirect) | Intentionally use the side glass as a bank shot to create an angle that would be impossible straight | 4 | Sabimaru (poison, indirect damage) | Offensive tool — the glass creates angles you cannot hit directly |
| 11 | Deep Glass Positioning | Position yourself optimally relative to the back glass — not too close, not too far — for clean returns | 2 | Prosthetic basic mastery | Foundation of all glass tool use; wrong distance = mistime every read |
| 12 | Corner Glass Navigation | Ball goes into the corner where back and side glass meet; read the double-bounce in the tight space | 4 | Finger Whistle (specific, situational) | Corner is the hardest zone; ball behavior is least predictable |
| 13 | Lob Off Glass | Use the glass rebound to set up a deep offensive lob instead of a mere survival return | 3 | Shuriken + followup (tool combo) | Converts a glass read into an attacking deflection |
| 14 | Smash Targeting Glass | Aim your smash to hit a specific wall at a specific angle to create maximum difficulty for the defender | 3 | Flame Vent + followup (offensive tool) | Offensive glass use — the wall is your weapon, not just your shield |
| 15 | Fake Glass Read (Wrong-Foot) | Pretend you are reading one glass trajectory; opponent adjusts; you were actually reading the other | 5 | Lazulite Shuriken (endgame tool) | Deception-level glass mastery; you use the opponent's glass read against them |


## CATEGORY 6 — DEATHBLOWS & COMBAT ARTS (Finishers and High-Commitment Specials)

In Sekiro, a Deathblow is only available when the enemy's posture is fully broken. The red circle appears on their chest. You press the attack button. The Deathblow removes one full health node — it is an instant, devastating, cinematic kill. But if you miss the Deathblow window (you are too far away, too slow), the enemy recovers a portion of their posture and the fight continues.

Combat Arts are equipped special techniques that cost Spirit Emblems. They are high-commitment: big windup, big payoff, but if the enemy deflects them, you are punished. Ichimonji (overhead chop) deals massive posture damage but is slow. Mortal Draw hits through guard but costs health. High Moon is fast but directional.

In padel, Deathblows are the point-ending winners that are ONLY effective when the opponent's posture is broken. Smashing when their posture is intact is just a regular attack. Smashing when their posture is broken — they are out of position, stretched, or their return is floating — is a Deathblow.

Combat Arts are the high-commitment specialty shots that cost more energy and risk but deliver devastating results when used correctly.

### DEATHBLOWS (Winners After Posture Break)

| # | Move | Description | Diff | Posture Break Required |
|---|------|-------------|------|----------------------|
| 1 | Flat Winner Volley | Firm, directed volley to the open court when opponent has left a gap | 2 | Opponent's posture broken by lateral pressure; gap exists |
| 2 | Overhead Smash Winner | Full-power smash on a short ball when opponent is deep and cannot recover | 3 | Opponent's lob was short because their posture was already compromised |
| 3 | Angle Winner | Sharp angled volley to the sideline that opponent cannot reach | 3 | Opponent stretched to the opposite side; angle is fully open |
| 4 | Drop Shot Winner | Feathered drop that dies at the net when opponent is deep behind the baseline | 3 | Opponent pushed deep by accumulated posture pressure; cannot sprint forward |
| 5 | Vibora Winner | Sidespin overhead that curves off the glass and wins outright | 4 | Opponent out of position from previous rally pressure; cannot read glass trajectory in time |
| 6 | Middle Seam Winner | Hard shot directly down the middle between both opponents | 2 | Both opponents' posture broken — communication and positioning both compromised |
| 7 | Lob Winner (Over Net Player) | Lob over the net player when they are too far forward | 3 | Net player's posture is broken — they committed too far forward on the previous shot |
| 8 | Body Shot Winner | Hard drive at the body of an opponent whose paddle is out of position | 3 | Opponent's guard posture broken — paddle is low or to the side from previous recovery |

### COMBAT ARTS (High-Commitment Specials)

| # | Art | Description | Diff | Spirit Cost (Risk) | Payoff |
|---|-----|-------------|------|-------------------|--------|
| 1 | Vibora (Full Power) | Maximum sidespin overhead with aggressive forward positioning | 4 | High — if returned, you are deep in the court with no recovery time | Point winner or massive posture damage |
| 2 | Bajada (Early Attack Off Glass) | Attack the ball as it descends from a glass hit, before it drops to a comfortable height | 4 | High — timing is extremely tight; mistiming = weak return or miss | Denies opponent time; immediate offensive pressure |
| 3 | Gancho (Reverse Overhead) | Behind-the-head overhead when a lob goes past you; played with back to the net | 4 | Medium — unorthodox swing; limited placement control | Keeps point alive offensively from a position that should be defensive |
| 4 | Par Tres Smash | Smash aimed to bounce the ball over the 3-meter back glass, making it unretrievable | 5 | Very High — requires enormous power + precise angle; if it stays in, ball is easy | Outright winner; the most spectacular shot in padel |
| 5 | Par Cuatro Smash | Smash aimed to exit over the 4-meter side glass | 5 | Very High — even harder angle than par tres; extremely rare | Ultimate finisher; crowd-erupting shot |
| 6 | Chiquita Lob Combo | Low chiquita to feet, then immediate offensive lob when opponent reaches down | 4 | Medium — two-shot commitment; second shot must be read instantly | Sequence breaks posture through height change |
| 7 | Fake Overhead into Drop | Full overhead motion but play a touch drop shot instead | 5 | High — if opponent reads the fake, they are already at the net waiting | Deception-based winner; opponent committed to glass defense |


---

# PART 4 — SEVEN SEQUENTIAL LAYERS

Content is gated like Sekiro's boss progression — you cannot fight Genichiro until you have beaten Lady Butterfly, and you cannot reach the Mortal Blade until you have beaten Genichiro. Each boss (layer) requires mastery of the previous layer's skills to survive.


## LAYER 0 — WOLF'S TRAINING (Tutorial: Learn to Guard)

The mandatory entry point. In Sekiro, Wolf begins by learning to deflect basic attacks from the Undying Soldier in the tutorial area.

Content: All 15 Guard Posture moves (Category 1). Ready positions, grips, split step, recovery steps, partner alignment, wall awareness.

Trial: Film yourself demonstrating each of the 15 stances in isolation. 3-of-5 correct executions per move. Coach or self-review.

Pass: All 15 certified. Layer 1 appears.

Rank earned: UNRANKED → BRONZE


## LAYER 1 — DEFLECTION MASTERY (Learn to Parry)

In Sekiro, the first real skill is deflecting — not blocking, but precisely timed parrying that damages the enemy's posture. This layer teaches defensive returns that pressure the attacker.

Content: All 15 Deflection moves (Category 2). Deep lobs, glass-assisted lobs, contrapared, block volleys, double glass recovery.

Trial: In a live rally drill, execute 10 defensive returns where your return lands deeper than your opponent's previous shot. 7-of-10 must push the opponent further back than they were. Film review.

Pass: All 15 deflections certified through drill and film.

Rank earned: BRONZE → SILVER


## LAYER 2 — ATTACK PATTERNS (Learn to Chip Vitality and Build Posture Damage)

Now you learn to attack — not to win immediately, but to accumulate posture damage. Each shot in this layer is a tool for building pressure over a rally.

Content: All 15 Attack moves (Category 3). Lobs, volleys, chiquitas, bandejas, drives, drop shots, body shots, switch shots.

Trial: In a live rally, sustain offensive pressure for 8+ consecutive quality shots (each landing in the targeted zone). 3-of-5 attempts must reach the 8-shot threshold without a major error. Film review.

Pass: All 15 attacks certified.

Rank earned: SILVER → GOLD


## LAYER 3 — PROSTHETIC TOOLS (Master the Glass)

This is GlassXP's signature layer — the one that defines the app. In Sekiro, learning to use prosthetic tools is what separates beginners from intermediate players. Each tool requires specific situational awareness.

Content: All 15 Prosthetic Tool / Glass Techniques (Category 5). Back glass returns, side glass returns, double glass reads, contrapared, corner navigation, glass boasts, par tres/cuatro retrieval.

Trial: In a glass-specific drill:
- 5-of-8 back glass returns land in the targeted zone
- 3-of-5 side glass returns are clean
- 2-of-5 double glass reads result in a quality return
- 1 successful contrapared in a live drill
Film review for all.

Pass: All 15 glass techniques certified.

Rank earned: GOLD → PLATINUM


## LAYER 4 — PERILOUS ATTACK COUNTERS (Read the Red Kanji)

The most Sekiro-specific layer. This teaches players to identify which type of perilous attack is incoming and respond with the ONE correct counter. Every perilous attack in the game is drilled with its specific counter — and every wrong counter is experienced so the player understands why it fails.

Content: All 10 Perilous Attacks (Category 4) + their specific counters. Vibora counter, power smash counter, kick smash counter, bajada counter, par tres retrieval, par cuatro retrieval, gancho read, rulo read, speed-up body deflection, wide vibora counter.

Trial Structure (unique to this layer): For each perilous attack, three separate sub-trials:

1. IDENTIFY — Watch 10 clips. Correctly identify the perilous attack type (thrust/sweep/grab) 8-of-10 times.
2. COUNTER — In a live drill, execute the correct counter 3-of-5 times.
3. WRONG COUNTER — In a live drill, deliberately use the wrong counter 2 times and articulate why it failed. This reinforces the correct choice.

Pass: All 10 perilous attacks mastered (identify + counter + wrong counter articulation).

Rank earned: PLATINUM → DIAMOND


## LAYER 5 — DEATHBLOW TIMING (The Kill Window)

You now know how to build posture damage (L2), use tools (L3), and counter perilous attacks (L4). This layer teaches you to recognize the Deathblow window — the exact moment when the opponent's posture is broken and a winner will succeed.

Content: All 8 Deathblows and all 7 Combat Arts (Category 6). Plus the critical judgment skill: reading WHEN the Deathblow window is open vs. when you are attacking too early (posture still intact).

Trial: Film 5 complete games. Annotate each point:
- Identify 3+ moments where you correctly read a Deathblow window and converted.
- Identify 2+ moments where you attacked when posture was NOT broken and explain why it failed.
- Identify 1+ moment where a Deathblow window opened and you MISSED it (did not attack).

Pass: Film reviewed with annotations. External review confirms reads are accurate.

Rank earned: DIAMOND → CHAMPION


## LAYER 6 — BOSS FIGHTS (Full Rally Mastery)

In Sekiro, boss fights are the test of every skill learned across the game. Genichiro tests deflect timing. Guardian Ape tests prosthetic tool choice. Isshin tests everything simultaneously.

Content: Complete rally sequences ("Boss Fights") that require all previous layers simultaneously:

BOSS 1 — "The Genichiro" (Net Battle): 1-minute continuous net exchange where both teams are at the kitchen. Must demonstrate 3+ deflections, 5+ posture-building attacks, and at least 1 Deathblow winner.

BOSS 2 — "The Guardian Ape" (Glass Rally): Rally that goes to the glass at least 3 times. Must demonstrate correct glass technique each time, including at least 1 double glass read.

BOSS 3 — "The Owl" (Perilous Attack Survival): Opponent deliberately executes 3+ perilous attacks during the rally. Player must identify and correctly counter each one.

BOSS 4 — "The Isshin" (Full Integration): Complete match where player demonstrates ALL layers — guard posture, deflections, attacks, glass techniques, perilous counters, and Deathblow timing — in natural gameplay. Not a drill; a real match.

Trial: Film submission for each Boss Fight. External review confirms each skill requirement was met in live play.

Pass: All 4 Boss Fights certified.

Rank earned: CHAMPION → GRAND CHAMPION


## LAYER 7 — INNER ISSHIN (Mastery Without Thinking)

Sekiro's Reflection of Strength / Inner Isshin fight is the pinnacle — every boss with harder timing, no room for error, total mastery required. At this level, you are not thinking about deflect timing or prosthetic choice. Your body knows. You are reading the opponent's soul.

Content:

POSTURE READING — Build an accurate real-time model of the opponent's posture gauge during a match. Predict within 2 shots when their posture will break.

COMBAT ART CREATION — Design a new sequence using existing moves. Document it with notation, prerequisites, and tactical purpose. Submit for community review.

TEACHING REP — Coach a Layer 0-2 player through a concept. Learner passes their trial.

RESURRECTION MASTERY — In a match, save 3+ seemingly lost points through glass recoveries, desperate deflections, or creative retrievals. Film annotated.

Trial: Portfolio submission — all four components documented with film evidence.

Pass: Full system mastery certified.

Rank earned: GRAND CHAMPION → LEGEND (Sekiro's "Shura" tier — the one who has mastered everything and now defines the art)


---

# PART 5 — RANK LADDER

| Rank | Divisions | Layer Required | Sekiro Equivalent |
|------|-----------|----------------|-------------------|
| Unranked | — | Not started | Dilapidated Temple |
| Bronze III–I | Div 1–4 | Layer 0 complete | Ashina Outskirts |
| Silver III–I | Div 1–4 | Layer 1 complete | Hirata Estate |
| Gold III–I | Div 1–4 | Layer 2 complete | Ashina Castle |
| Platinum III–I | Div 1–4 | Layer 3 complete | Sunken Valley |
| Diamond III–I | Div 1–4 | Layer 4 complete | Ashina Depths |
| Champion III–I | Div 1–4 | Layer 5 complete | Fountainhead Palace |
| Grand Champion III–I | Div 1–4 | Layer 6 complete | Ashina Castle (Endgame) |
| Legend | No divisions | Layer 7 complete | Inner Isshin |


---

# PART 6 — LANGUAGE MAP

All in-app copy uses Sekiro's combat language:

| Concept | GlassXP Term |
|---------|-------------|
| Complete a move | Certify this technique |
| Drill | Trial / Sparring |
| Coach tip | Sculptor's Insight |
| Stat boost | Prayer Bead |
| Move decayed | Posture Broken — re-certify |
| Move getting stale | Posture Wavering |
| My Board | Sculptor's Idol (your save/reference point) |
| Achievements | Memories (earned titles: "Mikiri Master", "Glass Shinobi", "Deflection Artist") |
| OVR number | GOLD I — Division 3 |
| Practice session | Training at the Idol |
| Combo route | Combat Art Sequence |
| Glass techniques | Prosthetic Tools |
| Winner after rally pressure | Deathblow |
| Defensive return that pressures attacker | Deflection |
| Attack that cannot be passively defended | Perilous Attack |
| Specific counter to a perilous attack | Mikiri / Jump / Dodge (depending on type) |
| Rally pressure accumulation | Posture Damage |
| Opponent's breaking point | Posture Break |
| Desperate point save | Resurrection |
| Between-point strategy | Rest at the Idol |
| Random unearned attack | Flailing (negative) |
| Calculated winning shot | Deathblow (positive) |


---

# PART 7 — ARCHETYPES

Instead of position, players choose a fighting archetype that determines tool priority and posture-building style:

| Archetype | Sekiro Analog | Core Identity | Primary Techniques |
|-----------|-------------|---------------|-------------------|
| SHINOBI | Wolf (balanced) | All-round; adapts tools to situation; no weakness | Even distribution across all categories; jack of all trades |
| SCULPTOR | The Sculptor | Prosthetic tool master; lives on the glass; defensive genius | Glass techniques, contrapared, double-glass reads, par retrieval |
| ISSHIN | Isshin Ashina | Relentless attacker; overwhelms posture through volume | Bandejas, volleys, chiquitas, drives; pure posture accumulation |
| OWL | Great Shinobi Owl | Deceptive; perilous attack specialist; punishes counters | Vibora, rulo, fake overhead, misdirection, Combat Arts |
| GENICHIRO | Genichiro Ashina | Lightning-fast finisher; reads Deathblow windows early | Deathblows, speed attacks, overhead winners, angle kills |


---

# PART 8 — TRIAL TYPES

| Trial Type | Description | Pass Criteria |
|------------|-------------|---------------|
| Stance Trial | Demonstrate correct form for a guard posture move | 3-of-5 correct form executions |
| Deflection Trial | Execute a defensive return that pressures the attacker | 7-of-10 returns land deeper than opponent's shot |
| Attack Trial | Sustain offensive pressure for a target number of consecutive quality shots | 3-of-5 attempts reach the shot threshold |
| Glass Trial | Execute a specific glass technique with correct trajectory read | Varies by technique: 5-of-8 for basic, 2-of-5 for advanced |
| Perilous Counter Trial | Identify attack type AND execute the correct counter | 3-of-5 correct identifications + 3-of-5 correct counters |
| Deathblow Trial | Film annotation showing correct kill-window reads | 3+ correct reads, 2+ explained misreads, 1+ missed window |
| Boss Trial | Film submission of a complete match or rally demonstrating multiple layers | External reviewer confirms all skill requirements met |


---

# PART 9 — FRESHNESS DECAY (POSTURE RECOVERY)

Same engine as CourtXP and PaddleXP, but themed as posture:

STABLE (100-70): Recently certified. Technique is sharp. Posture is strong.
WAVERING (70-50): Getting stale. Posture beginning to crack. Needs a training session.
BROKEN (50-25): Significant decay. Posture is compromised under pressure.
CRUMBLING (25-10): Major decay. Technique collapses in live play.
SHATTERED (below 10): Effectively lost. Must re-certify from scratch. Full posture break.

Decay rate slows with repeated certification (muscle memory / Sekiro's "learning the boss's patterns"). First certification: 8 points per day. Fourth certification: 4 points per day. Sixteenth certification: 2 points per day.


---

# PART 10 — THE DUAL GAUGE IN-APP (Unique to GlassXP)

GlassXP is the only XP Sports app with a dual-gauge display on the home screen:

VITALITY BAR: A red health bar showing your direct performance metrics — match results, point differentials, win rates. This is your "HP."

POSTURE BAR: An orange posture bar showing your skill certification status — how many moves are certified, freshness levels, layer completion. When this bar fills (all skills certified and fresh), you are at maximum posture.

The insight: A player can have high Vitality (winning matches) but low Posture (skills are decaying, fundamentals are rusty). Sekiro teaches that this is a dangerous state — high HP but broken posture means one deflect-chain from the opponent will kill you. GlassXP teaches the same: winning on talent without maintaining fundamentals is fragile.

The reverse is also true: a player with low Vitality (losing matches) but high Posture (all skills fresh) is a player who will break through soon — their foundation is solid, they just need reps.


---

END OF GLASSXP SPEC


---
---
---

# BOOK 4 — BOMBXP (Long Drive Golf × Kerbal Space Program)

# BOMBXP — FULL SYSTEM SPEC
## Long Drive Golf × Kerbal Space Program

---

# PART 1 — THE PHILOSOPHY

BombXP treats every long drive swing as a rocket launch. In KSP, you do not simply "press go" and fly to space. You design a multi-stage rocket in the Vehicle Assembly Building, calculate your delta-v budget across each stage, manage your thrust-to-weight ratio on the pad, execute a gravity turn at the precise moment, circularize your orbit at apoapsis, and — only if everything was done correctly — achieve stable orbit. Miss any single step and the rocket either flips, runs out of fuel, or falls back to earth.

A long drive swing is structurally identical. You build your rocket (equipment setup + body positioning), fire Stage 1 (backswing / loading), separate and fire Stage 2 (transition / downswing), achieve maximum thrust at the precise moment (impact), and manage the trajectory post-launch (ball flight). The "grid" in long drive competition — a rectangle 45-60 yards wide and 420+ yards long — is your orbital window. If the ball doesn't land in the grid, the drive does not count, regardless of distance. A 400-yard drive that misses the grid is a sub-orbital flight that crashed back to earth. A 350-yard drive that hits the grid is a successful orbit.

KSP has three additional systems that map perfectly to long drive:

DELTA-V BUDGET (Δv). Your body has a finite amount of energy to distribute across the swing. Wasting Δv in the backswing (excessive tension, over-rotation, unnecessary movement) means less is available for the downswing and impact. The most efficient rockets are not the most powerful — they are the ones that allocate fuel most precisely across stages. The most efficient long drive swings are the same.

THRUST-TO-WEIGHT RATIO (TWR). This is the ratio of force generated to mass being moved. In KSP, a TWR below 1.0 means the rocket cannot lift off. In long drive, TWR is club head speed relative to effort — are you generating maximum speed with minimum wasted energy, or are you muscling the club with enormous effort and getting mediocre speed? High TWR = effortless speed. Low TWR = exhausting, slow, wasted fuel.

GRAVITY TURN. The single most important maneuver in KSP is the gravity turn — the moment you stop going straight up and start going sideways, letting gravity redirect your trajectory toward orbit. In the swing, this is the transition at the top of the backswing: you stop loading (vertical energy storage) and start redirecting all that energy horizontally through the ball. Start the gravity turn too early = not enough altitude (insufficient load). Start too late = wasted fuel fighting gravity straight up (over-the-top, casting). The gravity turn timing IS the swing.

---

# PART 2 — THE STAGING MODEL

This is BombXP's core structural mechanic. Every swing is a multi-stage rocket. Stages fire in sequence. You cannot skip a stage. Each stage must separate cleanly before the next ignites. A failed stage separation (hitch in transition, early release, loss of sequence) causes the rocket to tumble.

STAGE 0 — ON THE PAD (Pre-Launch)
Equipment selected, body positioned, mental mission plan set. The rocket is assembled and on the launch pad. Nothing has fired yet.

STAGE 1 — LAUNCH (Backswing / Loading)
The first stage fires. Energy is being stored — hip load, shoulder turn, wrist hinge, weight shift to trail side. This stage's job is to get the rocket off the pad and build altitude (potential energy). TWR must be above 1.0 — if Stage 1 is too slow or tentative, the rocket never leaves the pad.

STAGE 1 SEPARATION — TOP OF BACKSWING
The first stage is expended. All fuel (loading capacity) has been burned. The first stage must separate cleanly — the pause/transition at the top where the lower body fires before the upper body. If Stage 1 does not separate (no transition, arms and hips fire simultaneously), the rocket has no second stage.

STAGE 2 — GRAVITY TURN (Transition + Downswing)
The second stage fires. This is where the gravity turn happens — energy redirects from vertical (loading) to horizontal (speed through the ball). The hips fire first (pitchover maneuver), then the torso follows, then the arms, then the club. This is the kinetic chain — each link fires in sequence, each one faster than the last.

STAGE 2 SEPARATION — IMPACT
The payload (club head) reaches maximum velocity at the exact moment it contacts the ball. This is the moment of maximum thrust. The ball is the payload being delivered to orbit.

STAGE 3 — ORBITAL INSERTION (Follow-Through + Ball Flight)
The ball is launched. The follow-through is the orbital insertion burn — it doesn't add speed to the ball, but it determines whether the body decelerates safely (successful mission) or crashes (injury, loss of balance). Ball flight is the payload's trajectory — launch angle, spin rate, and wind determine whether orbit (grid) is achieved.

MISSION SUCCESS — The ball lands in the grid. Orbit achieved.
MISSION FAILURE — The ball misses the grid. Sub-orbital. Crashed.

---

# PART 3 — THE SIX MOVE CATEGORIES


## CATEGORY 1 — VAB: VEHICLE ASSEMBLY (Setup & Equipment)

In KSP, the Vehicle Assembly Building (VAB) is where you design your rocket before it ever reaches the launch pad. You select engines, fuel tanks, payload fairings, staging sequences, and structural components. A poorly designed rocket cannot reach orbit regardless of pilot skill. The VAB is where missions succeed or fail before they begin.

In long drive, the VAB is your equipment selection and body setup — everything that happens before the swing starts. Driver specifications, shaft selection, ball choice, tee height, grip, stance width, alignment. A poorly assembled "rocket" (wrong shaft flex, wrong loft, wrong tee height) cannot achieve maximum distance regardless of swing quality.

| # | Move | Description | Diff | KSP Equivalent |
|---|------|-------------|------|----------------|
| 1 | Driver Selection (Loft) | Choose correct driver loft for your swing speed — typically 4-6° for long drive vs. 9-12° for standard golf | 2 | Engine selection — choosing the right thrust profile for the mission |
| 2 | Shaft Selection (Flex + Weight) | Match shaft flex and weight to swing speed — stiffer and lighter for faster swings | 3 | Fuel tank selection — capacity vs. weight tradeoff |
| 3 | Ball Selection | Choose ball optimized for distance (low spin, high compression) vs. control | 2 | Payload fairing — aerodynamic profile of the payload |
| 4 | Tee Height | Set tee height to optimize launch angle for your attack angle — higher tee for ascending blow | 1 | Launch clamp height — starting position on the pad |
| 5 | Grip (Neutral / Strong / Weak) | Grip position determines clubface angle at impact — strong grip reduces slice tendency | 2 | Gimbal angle — engine nozzle alignment |
| 6 | Stance Width | Wider stance for stability and power; must not restrict hip rotation | 1 | Launch pad width — structural foundation |
| 7 | Ball Position | Ball placement relative to stance — forward for ascending blow, center for neutral | 2 | Payload position — center of mass alignment |
| 8 | Alignment (Feet, Hips, Shoulders) | All three alignment points aimed at target line or planned trajectory | 1 | Launch azimuth — direction the rocket faces on the pad |
| 9 | Pre-Shot Routine | Consistent sequence of actions before every swing — same every time | 1 | Mission countdown — standardized pre-launch checklist |
| 10 | Warm-Up Protocol | Progressive speed build from 60% to 100% before competition swings | 2 | Engine pre-fire test — systems check before launch |
| 11 | Speed Training Load Selection | Choose correct overspeed/underspeed training club weights for the session | 3 | Booster configuration — auxiliary thrust for training missions |
| 12 | Trackman / Monitor Setup | Position launch monitor correctly to capture ball speed, launch angle, spin rate | 2 | Telemetry array — mission control data feed |
| 13 | Wind Read | Assess wind speed and direction; adjust aim point and trajectory plan | 3 | Atmospheric data — weather conditions for launch window |
| 14 | Grid Assessment | Evaluate grid dimensions, slope, surface — the "orbit" you're targeting | 2 | Orbital parameters — target altitude and inclination |
| 15 | Mental Mission Brief | Visualize the complete swing and ball flight before stepping to the ball | 2 | Mission brief — full flight plan reviewed before launch |


## CATEGORY 2 — STAGING (Sequential Swing Phases)

In KSP, staging is the sequential firing and separation of rocket stages. Stage 1 fires, burns out, separates. Stage 2 ignites. Stage 2 burns, separates. Stage 3 (orbital stage) circularizes. Every stage fires in order. If staging is out of sequence (Stage 2 fires before Stage 1 separates), the rocket explodes.

In long drive, the swing is a 5-stage rocket. Each stage must fire and separate cleanly. "Casting" (releasing the wrists too early) is Stage 2 firing before Stage 1 separates. "Getting stuck" (hips stall) is a failed stage separation. "Reverse pivot" (weight stays on lead side during backswing) is the rocket falling off the pad before launch.

| # | Stage / Move | Description | Diff | KSP Phase | Failure Mode if Skipped |
|---|-------------|-------------|------|-----------|------------------------|
| 1 | Address Position (Pad) | Final stance, grip, alignment; everything locked; ready to fire | 1 | On the pad, systems armed | No foundation — nothing after this works |
| 2 | Takeaway (Stage 1 Ignition) | First 18 inches of the club's movement — low, slow, one-piece; club, hands, arms move together | 2 | Liftoff — first 100m of altitude | Rushed takeaway = unstable ascent; rocket wobbles immediately |
| 3 | Backswing Load (Stage 1 Burn) | Full shoulder turn, hip resistance, wrist hinge; weight shifts to trail side; shaft loads | 3 | Vertical climb — building altitude | Insufficient load = insufficient fuel; Stage 2 has nothing to work with |
| 4 | Top of Backswing (Stage 1 Burnout) | Maximum energy stored; shoulder turned 90°+; hip resists at ~45°; wrists fully hinged | 3 | Stage 1 burnout — fuel expended | Over-rotation = structural failure; under-rotation = insufficient altitude |
| 5 | Stage Separation (Transition) | Lower body fires FIRST; hips begin rotation toward target while upper body is still completing backswing | 4 | Stage separation — first stage drops away | No separation = arms and body fire together; no speed multiplication |
| 6 | Gravity Turn (Pitchover) | Hips have cleared; energy redirects from vertical load to horizontal acceleration; hands drop | 4 | Gravity turn — trajectory shifts from vertical to horizontal | Too early = over the top, slice; too late = stuck, block right |
| 7 | Downswing Acceleration (Stage 2 Burn) | Sequential acceleration: hips → torso → arms → hands → club; each segment faster than the last | 4 | Main engine burn — maximum acceleration phase | Sequence violation = casting, early release, loss of speed |
| 8 | Lag Retention | Maintaining the angle between lead arm and club shaft deep into the downswing before release | 4 | Fuel conservation — burning efficiently, not all at once | Early release = fuel wasted before optimal altitude; speed peaks too early |
| 9 | Release (Payload Deployment) | Wrists unhinge, club head accelerates to maximum speed, energy transfers from shaft to head | 4 | Payload deployment — final acceleration before separation | Mistimed release = club head speed peaks before or after the ball |
| 10 | Impact (Maximum Thrust) | Club face contacts ball at maximum speed, correct angle, center of face | 5 | Maximum thrust event — all fuel converted to velocity in one instant | Off-center = energy loss; wrong angle = wrong trajectory |
| 11 | Extension (Post-Impact Thrust) | Arms extend fully through the ball; club head continues on the target line past impact | 3 | Post-separation thrust — payload fine-tuning | Deceleration before extension = speed left on the table |
| 12 | Follow-Through (Orbital Insertion) | Full rotation to finish position; weight on lead side; balanced and stable | 2 | Orbital insertion burn — circularization at apoapsis | Incomplete follow-through = deceleration injury risk; no orbit confirmation |
| 13 | Balance Hold (Orbit Confirmed) | Hold the finish position for 3+ seconds; stable, balanced, controlled | 1 | Stable orbit confirmed — mission success if grid hit | Falling off balance = structural failure; rocket broke apart |
| 14 | Speed Reserve Check | After the swing, assess effort level — was this 90% effort or 100%? Sustainable? | 2 | Fuel remaining — is there Δv left for course corrections? | 100% effort every swing = fuel exhaustion; no endurance for the set |
| 15 | Debrief (Post-Flight Analysis) | Review Trackman data: ball speed, launch angle, spin rate, carry, total. Log findings. | 2 | Post-mission telemetry review — what worked, what failed | No debrief = repeating the same failed mission profile |


## CATEGORY 3 — PROPULSION (Power Generation Techniques)

In KSP, propulsion is about generating thrust. Different engines have different thrust profiles, specific impulse (efficiency), and fuel consumption rates. The Mainsail engine has maximum thrust but burns fuel fast. The Nuclear engine is ultra-efficient but low thrust. Choosing and optimizing propulsion is how you reach orbit with fuel to spare.

In long drive, propulsion is the physical mechanics of generating club head speed. Ground force, hip rotation speed, torso separation, wrist snap, shaft kick — each is an "engine" in the kinetic chain. Some generate raw power (ground force = solid rocket booster). Some generate efficiency (wrist mechanics = ion engine). The goal is maximum speed at impact with fuel (energy) to spare for the full set.

| # | Move | Description | Diff | KSP Equivalent | Speed Contribution |
|---|------|-------------|------|----------------|-------------------|
| 1 | Ground Force (Vertical Push) | Push hard into the ground with lead leg during downswing; Newton's third law returns force upward through the body | 3 | Solid rocket booster — raw, immediate thrust | Foundational; provides the initial force the kinetic chain multiplies |
| 2 | Hip Rotation Speed | Speed of hip clearance from closed to open through impact; the primary rotational engine | 3 | Main engine — the core propulsion system | Largest single contributor to club head speed |
| 3 | X-Factor (Shoulder-Hip Separation) | Maximum angle between shoulders and hips at the start of the downswing; energy stored in the torso's elastic stretch | 4 | Fuel tank pressure — stored energy waiting to be converted | The larger the separation, the more energy available for Stage 2 |
| 4 | Torso Rotation Speed | Speed at which the chest unwinds after the hips have cleared; the second rotational engine | 3 | Second stage engine — fires after first stage separates | Multiplies the speed the hips initiated |
| 5 | Arm Speed (Pull-Down) | Speed of the arms pulling the club down from the top of the backswing; initiated by the lats | 3 | Orbital stage engine — fine-tuning velocity | Multiplies what the torso started |
| 6 | Wrist Snap (Ulnar Deviation) | Last-second unhinging of the wrists that whips the club head through impact | 4 | Payload separation charge — final velocity boost | Smallest physical movement, largest speed multiplier |
| 7 | Shaft Kick | Stored energy in the shaft releasing as the club head catches up to the hands through impact | 3 | Spring-loaded decoupler — passive energy release at separation | Adds 2-5 mph of club head speed at no additional effort cost |
| 8 | Weight Transfer (Lateral Shift) | Shifting body weight from trail side to lead side during the downswing; moves the center of mass forward | 3 | Translation burn — shifting the craft's position, not just rotation | Ensures force is directed toward the target, not spinning in place |
| 9 | Step Drill / Happy Gilmore Step | Literal forward step during the swing to add momentum; legal in long drive (not in standard golf) | 4 | Gravity assist — using an external force to add free velocity | Adds 5-10+ mph of ball speed by converting linear momentum to rotational |
| 10 | Overspeed Training (Light Club) | Swinging a lighter-than-normal club at maximum speed to train the neuromuscular system to fire faster | 3 | Reduced payload test — lighter craft reaches higher velocity, training the system | Teaches the body what "faster" feels like; raises the ceiling |
| 11 | Underspeed Training (Heavy Club) | Swinging a heavier-than-normal club to build strength and force production in the specific swing pattern | 3 | Heavy payload test — forces more thrust from the same engines | Builds the raw force capacity; raises the floor |
| 12 | Supramaximal Training | Alternating overspeed and underspeed in the same session to confuse the neuromuscular system into adaptation | 4 | Mixed-payload mission — tests system across multiple configurations | The most effective speed training protocol; forces adaptation |
| 13 | Smash Factor Optimization | Ratio of ball speed to club head speed; perfect center-face contact = 1.50 smash factor; the efficiency metric | 3 | Specific impulse (Isp) — how efficiently fuel converts to thrust | A 150 mph swing with 1.50 smash = 225 mph ball speed; 1.45 smash = 217 mph |
| 14 | Attack Angle Optimization | Hitting up on the ball (+3° to +6° for long drive) to optimize launch conditions | 3 | Launch angle — the initial trajectory off the pad | Ascending blow adds carry distance at the same ball speed |
| 15 | Speed Reserve Building | Training to produce 100% speed in practice so that 90% effort in competition is still maximum competitive speed | 4 | Fuel margin — carrying extra Δv for unexpected course corrections | The key to consistency; your "easy" swing is someone else's maximum |


## CATEGORY 4 — GUIDANCE (Accuracy & Trajectory Control)

In KSP, guidance is how you control where the rocket goes. Without guidance, even a perfectly built rocket with unlimited fuel flies off in a random direction. SAS (Stability Assist System), maneuver nodes, prograde/retrograde markers, and NavBall readings are the guidance systems that let pilots control trajectory. The best KSP players can eyeball a gravity turn; beginners need every guidance tool available.

In long drive, guidance is how you control where the ball goes. Club head speed means nothing if the ball doesn't hit the grid. Guidance is face angle at impact, swing path, spin axis, and launch direction. The grid is your orbit — you must hit it or the drive doesn't count.

| # | Move | Description | Diff | KSP Equivalent | What It Controls |
|---|------|-------------|------|----------------|-----------------|
| 1 | Face Angle Control | Ability to deliver the club face square (or intentionally open/closed) to the target line at impact | 3 | SAS heading hold — keeping the rocket pointed in the right direction | Primary determinant of where the ball starts (70-80% of start direction) |
| 2 | Swing Path Control | Ability to swing the club on the intended path — in-to-out, square, or out-to-in | 3 | Prograde marker — tracking the actual direction of travel vs. intended | Determines spin axis; in-to-out = draw spin; out-to-in = fade/slice spin |
| 3 | Center-Face Contact | Consistently hitting the center of the club face for maximum energy transfer | 3 | Docking alignment — precise contact point matters enormously | Off-center = energy loss + gear effect spin |
| 4 | Launch Angle Management | Controlling the vertical angle the ball leaves the club face | 3 | Apoapsis targeting — how high the trajectory peaks | Optimal long drive launch: 10-14° with low spin |
| 5 | Spin Rate Control | Minimizing backspin for maximum distance; long drive optimal is 1800-2400 RPM | 4 | Orbital velocity — too much = escape trajectory; too little = re-entry | High spin = ball balloons and loses carry; low spin = ball drops too fast |
| 6 | Wind Compensation | Adjusting aim point and trajectory to account for crosswind and headwind/tailwind | 3 | Course correction burn — adjusting trajectory mid-flight | Crosswind moves the ball laterally; must pre-aim to compensate |
| 7 | Shot Shape: Draw | Intentional right-to-left ball flight (for right-handed); adds roll distance | 3 | Gravity assist trajectory — using a force to curve the path beneficially | Draw spin runs out after landing; adds 10-20 yards of roll |
| 8 | Shot Shape: Fade | Intentional left-to-right ball flight; higher trajectory, softer landing | 3 | Aerobrake trajectory — using resistance to control descent | Fade is safer for grid accuracy; less roll variability |
| 9 | Shot Shape: Straight | Minimal curve; ball starts and stays on target line | 4 | Direct transfer orbit — shortest path, least margin for error | Maximum carry distance but least forgiving |
| 10 | Grid Management (Left/Right Bias) | Aiming to the upwind side of the grid so wind pushes the ball toward center, not off the edge | 3 | Orbital inclination correction — adjusting for planetary rotation | Ensures the ball drifts toward the grid center, not away from it |
| 11 | Altitude Adjustment (Elevation) | Adjusting for competition altitude — ball flies farther at altitude due to thinner air | 3 | Atmospheric density calculation — affects drag and required Δv | Denver at 5,280 ft adds ~10% distance; must adjust loft/spin |
| 12 | Temperature Adjustment | Ball compresses differently in heat vs. cold; affects ball speed and spin | 2 | Thermal management — engine efficiency varies with temperature | Hot = lower spin, more distance; cold = higher spin, less distance |
| 13 | Recovery Swing (Miss Adjustment) | After missing the grid, diagnose the miss pattern and adjust the next swing specifically to correct | 3 | Mid-course correction burn — adjusting trajectory after initial error | The most important competitive skill: fixing the miss between swings |
| 14 | Consistent Miss Pattern | Developing a reliable miss direction (always slight fade, never random) so corrections are predictable | 4 | Stable orbit drift — predictable decay is manageable; random is not | A consistent miss is correctable; random misses are not |
| 15 | Competition Targeting (Conservative vs. Aggressive) | Choosing when to aim center-grid for safety vs. edge-grid for maximum distance based on set situation | 3 | Mission profile selection — safe orbit vs. aggressive transfer | Ahead in the set = play safe; behind = go for maximum distance |


## CATEGORY 5 — MISSION PROFILES (Complete Swing-to-Landing Sequences)

In KSP, a mission profile is the complete plan from launch to objective — every stage, every burn, every maneuver planned in sequence. A Kerbin-to-Mun mission profile is: launch → gravity turn → circularize LKO → Hohmann transfer to Mun → capture burn → Mun orbit → deorbit → landing. Each step depends on the previous.

In long drive, a mission profile is the complete swing sequence — from setup through ball flight to grid landing — planned as a unified chain. Each profile is designed for specific conditions (wind, altitude, set situation) and has specific stage parameters.

| # | Mission Profile | Sequence | Diff | When To Use |
|---|----------------|----------|------|-------------|
| 1 | Standard Launch | Full setup → smooth takeaway → full load → clean separation → gravity turn → maximum speed at impact → high draw → grid center | 3 | Default profile; no wind, flat conditions, neutral set situation |
| 2 | Power Launch (Maximum Distance) | Step drill → aggressive load → maximum X-factor → explosive separation → fastest possible gravity turn → ascending blow → low-spin bomb | 4 | Behind in the set; need maximum distance; grid accuracy is secondary |
| 3 | Safety Launch (Grid Priority) | Conservative setup → 85% backswing → controlled separation → smooth gravity turn → center-face priority → slight fade → grid center | 2 | Ahead in the set; only need to hit the grid; distance is secondary |
| 4 | Crosswind Launch (Left-to-Right) | Aim left edge of grid → strong draw setup → in-to-out path → ball starts left, curves right with the wind → lands center grid | 3 | Significant left-to-right crosswind |
| 5 | Crosswind Launch (Right-to-Left) | Aim right edge of grid → slight fade setup → ball starts right, wind pushes left → lands center grid | 3 | Significant right-to-left crosswind |
| 6 | Headwind Launch | Lower trajectory → stronger shaft → more spin → ball climbs through the wind → lands on the grid with extra roll from penetrating flight | 4 | Direct headwind; normal trajectory balloons and loses distance |
| 7 | Tailwind Launch | Higher trajectory → less spin → ball rides the wind → maximum carry → soft landing at end of grid | 3 | Direct tailwind; ball gets free distance from wind push |
| 8 | Altitude Launch | Adjust loft down → reduce spin → thinner air means less lift and less drag → optimize for altitude-specific conditions | 3 | Competition at 4,000+ ft elevation |
| 9 | Cold Weather Launch | Stronger grip pressure → account for reduced ball compression → slightly higher spin to maintain carry | 3 | Below 50°F; ball doesn't compress as much; distance drops |
| 10 | Pressure Launch (Final Swing) | Pre-shot routine extended → breathing protocol → commit to one specific target point → execute with full conviction, no steering | 4 | Final swing of the set with the match on the line |
| 11 | Recovery Launch (Miss Correction) | Diagnose previous miss → adjust ONE variable (face angle OR path OR tee height) → execute corrected profile | 3 | After a grid miss; must correct and land the next one |
| 12 | Speed Reserve Launch | Deliberately swing at 90% effort with focus on center-face contact and grid accuracy → produce 95% of max distance at much higher consistency | 3 | Long set (8+ swings); conserve fuel for later rounds |
| 13 | Happy Gilmore Launch | Full running start → plant → fire through the ball → maximum linear + rotational speed combination → pray for the grid | 5 | Desperation distance attempt; low grid probability but maximum possible yardage |
| 14 | Finesse Launch | Controlled 80% swing with specific shot shape → lands in a specific quadrant of the grid | 3 | Narrow grid or challenging wind; accuracy is everything |
| 15 | Abort and Reset | Mid-backswing recognition that something is wrong → stop the swing → step away → restart pre-shot routine from scratch | 2 | Any time the swing feels wrong before the point of no return; DO NOT complete a bad launch |


## CATEGORY 6 — TELEMETRY & FUEL MANAGEMENT (Data, Recovery, Endurance)

In KSP, Mission Control provides telemetry — real-time data on velocity, altitude, fuel remaining, trajectory, and orbital parameters. Without telemetry, you are flying blind. Fuel management is equally critical: a rocket that burns all its fuel reaching orbit has nothing left for course corrections, landing, or the return trip. The best KSP players always carry a Δv margin.

In long drive, telemetry comes from launch monitors (Trackman, FlightScope, GCQuad) and from your own body's feedback. Fuel management is physical and mental endurance — each swing in a set burns energy. A competitor who gives 100% on swing 1 has nothing left for swings 6-8 when the set is on the line.

| # | Move | Description | Diff | KSP Equivalent | Purpose |
|---|------|-------------|------|----------------|---------|
| 1 | Ball Speed Reading | Primary distance metric — total ball speed off the face in mph | 1 | Velocity readout — your current speed | The single most important number; everything else is secondary |
| 2 | Launch Angle Reading | Vertical angle of the ball's initial trajectory off the face | 1 | Altitude readout — how high are you going | Must be in the optimal window (10-14° for long drive) |
| 3 | Spin Rate Reading | Backspin in RPM; determines how the ball behaves in flight | 2 | Orbital velocity — determines orbit shape | Too high = balloon; too low = nosedive; 1800-2400 RPM optimal |
| 4 | Spin Axis Reading | Tilt of the spin axis; determines curve direction and magnitude | 2 | Inclination readout — orbital plane tilt | Determines draw/fade amount and direction |
| 5 | Smash Factor Calculation | Ball speed ÷ club head speed; measures energy transfer efficiency | 2 | Specific impulse calculation — fuel efficiency | 1.50 = perfect; below 1.45 = energy wasted on off-center contact |
| 6 | Carry Distance Tracking | How far the ball travels in the air before first bounce | 1 | Apoapsis reading — highest/farthest point of the trajectory | Primary distance component; carry + roll = total |
| 7 | Total Distance Tracking | Carry + roll; the number that matters for competition | 1 | Final orbit altitude — mission success metric | The only number that counts if the ball hits the grid |
| 8 | Swing Speed Trend (Per Set) | Tracking club head speed across all swings in a set — is it climbing, stable, or dropping? | 3 | Fuel gauge — how much Δv remains | Dropping speed mid-set = fuel running out; need to manage effort |
| 9 | Effort Level Calibration | Self-rated effort per swing on a 1-10 scale; correlate with actual ball speed | 2 | Throttle setting — what percentage of maximum thrust are you using | 90% effort producing 97% speed = good TWR; 100% effort for 100% speed = no margin |
| 10 | Breathing Protocol (Between Swings) | Specific breathing pattern between competition swings to manage heart rate and recovery | 2 | Life support system — keeping the Kerbal alive between burns | Controls adrenaline; prevents fuel burn from anxiety |
| 11 | Heart Rate Monitoring | Track heart rate during the set; optimal performance zone is elevated but controlled | 3 | Thermal readout — overheating means system failure | Too high = tension, reduced fine motor control; too low = not activated |
| 12 | Set Pacing Strategy | Plan which swings in the set are 100% effort and which are 90% based on set format | 3 | Burn plan — when to fire main engines vs. coast | 8-swing set: swings 1-2 at 90% (find the grid), swings 3-6 at 95-100% (push distance), swings 7-8 based on situation |
| 13 | Competition Warm-Up Protocol | Progressive speed build: 60% → 70% → 80% → 90% → 100% over 15-20 balls before the set | 2 | Engine warm-up sequence — bringing systems to operating temperature | Cold swings are slower and less accurate; warm-up is non-negotiable |
| 14 | Post-Set Recovery | Cool-down, hydration, nutrition, mobility between rounds of a competition | 2 | Craft recovery — refueling and repair between missions | Multi-round competitions require managing physical resources across hours |
| 15 | Session Data Log | Recording all telemetry data from every training session for longitudinal tracking | 2 | Mission log — accumulated flight data that informs future missions | The data compounds; trends emerge over weeks that are invisible in single sessions |


---

# PART 4 — SEVEN SEQUENTIAL LAYERS


## LAYER 0 — VAB TRAINING (Build Your First Rocket)

The mandatory entry point. In KSP, you start in the Vehicle Assembly Building learning how to attach parts, set staging order, and check thrust-to-weight ratio before you ever launch.

Content: All 15 VAB moves (Category 1). Equipment selection, grip, stance, alignment, ball position, warm-up protocol, Trackman setup, wind reading, mental mission brief.

Trial: Demonstrate correct setup for 5 consecutive swings. Film review confirms: grip is correct, stance width is appropriate, alignment is on target, tee height matches attack angle plan. Pre-shot routine is identical all 5 times.

Pass: All 15 certified. Layer 1 appears.

Rank earned: UNRANKED → BRONZE


## LAYER 1 — STAGING (Learn the Launch Sequence)

In KSP, the first real skill is understanding staging — what fires when, and why sequence matters. This layer teaches the full swing as a multi-stage rocket.

Content: All 15 Staging moves (Category 2). Address through follow-through, with specific focus on stage separation (transition) and gravity turn (downswing initiation).

Trial: Execute 10 swings on camera. Slow-motion review confirms:
- Clean takeaway (Stage 1 ignition) 8-of-10
- Full backswing load (Stage 1 burn complete) 8-of-10
- Visible lower body lead (Stage separation) 6-of-10
- Balanced finish held 3+ seconds (orbit confirmed) 8-of-10

Pass: All 15 staging moves certified.

Rank earned: BRONZE → SILVER


## LAYER 2 — PROPULSION (Generate Speed)

Now you learn to generate club head speed — the raw thrust that makes long drive possible. This layer focuses on the physics of speed creation.

Content: All 15 Propulsion moves (Category 3). Ground force, hip speed, X-factor, torso rotation, arm speed, wrist snap, shaft kick, weight transfer, step drill, speed training protocols.

Trial:
- Demonstrate measurable speed increase: baseline ball speed established at Layer 1, must show 5+ mph improvement after Layer 2 training
- Execute 3 different propulsion techniques on command with correct form (film review)
- Complete one full supramaximal speed training session (overspeed + underspeed) with correct protocol

Pass: All 15 propulsion moves certified; speed increase documented.

Rank earned: SILVER → GOLD


## LAYER 3 — GUIDANCE (Hit the Grid)

Speed without accuracy is a sub-orbital flight. This layer teaches trajectory control — getting the ball to land in the grid.

Content: All 15 Guidance moves (Category 4). Face angle, path control, center-face contact, launch angle, spin management, wind compensation, shot shaping (draw/fade/straight), grid management.

Trial:
- Hit 8-of-15 drives in a regulation-width grid (55 yards) from a Trackman/monitor session
- Demonstrate both a draw and a fade on command (2-of-3 each shape)
- Show wind compensation: given a wind direction, explain and execute the correct aim adjustment (3-of-5)

Pass: All 15 guidance moves certified; grid hit rate documented.

Rank earned: GOLD → PLATINUM


## LAYER 4 — MISSION PROFILES (Complete Launch Sequences)

You can now build a rocket (L0), stage it correctly (L1), generate thrust (L2), and control trajectory (L3). This layer chains everything into complete mission profiles.

Content: All 15 Mission Profiles (Category 5). Standard launch, power launch, safety launch, crosswind profiles, headwind/tailwind, altitude, cold weather, pressure launch, recovery launch, abort protocol.

Trial: In a simulated competition format (8-swing set), execute:
- At least 3 different mission profiles across the 8 swings
- At least 1 recovery launch (miss correction after a grid miss)
- At least 1 abort-and-reset (stop a bad swing before impact)
- Grid hit rate of 5-of-8 or better

Pass: Film + Trackman data reviewed; mission profiles correctly matched to conditions.

Rank earned: PLATINUM → DIAMOND


## LAYER 5 — TELEMETRY & FUEL MANAGEMENT (Competition Endurance)

This layer teaches the meta-game — managing physical and mental resources across a full competition day, using data to make decisions, and peaking when it matters.

Content: All 15 Telemetry & Fuel Management moves (Category 6). All data readings, effort calibration, breathing protocols, set pacing, warm-up/recovery, session logging.

Trial:
- Complete a full mock competition (3 rounds of 8 swings each) with telemetry logged for every swing
- Demonstrate stable or increasing ball speed across each set (no significant drop-off in swings 6-8 vs. swings 1-3)
- Explain the set pacing strategy you used and why
- Film review of breathing protocol and pre-shot routine consistency

Pass: Full mock competition data + film reviewed; endurance and strategy confirmed.

Rank earned: DIAMOND → CHAMPION


## LAYER 6 — MISSION COMMANDER (Advanced Flight)

In KSP, advanced missions go beyond basic orbit — Mun landings, interplanetary transfers, gravity assists. This layer pushes beyond standard long drive into elite competitive scenarios.

Content:

MISSION 1 — "Mun Transfer" (Narrow Grid): 8-swing set on a 45-yard grid (narrow). Must hit 5-of-8 with at least 2 drives over 300 yards (or personal distance threshold).

MISSION 2 — "Jool Gravity Assist" (Maximum Distance): 8-swing set where the single longest grid hit counts. Must produce the longest drive of your training history. One successful launch is enough.

MISSION 3 — "Duna Landing" (Variable Conditions): 8-swing set where wind direction changes every 2 swings (simulated). Must adjust mission profile each time and hit 5-of-8.

MISSION 4 — "Eve Return" (Full Competition Simulation): 3 rounds of 8 swings, elimination format. Must advance through each round by having the longest grid hit in a simulated bracket.

Trial: Film + telemetry submission for each mission. External review confirms conditions were met.

Pass: All 4 missions certified.

Rank earned: CHAMPION → GRAND CHAMPION


## LAYER 7 — FLIGHT DIRECTOR (Complete Mastery)

In KSP, the Flight Director doesn't just fly missions — they design them, teach them, and solve problems no one has solved before.

Content:

ROCKET DESIGN — Build a custom mission profile for a specific condition (altitude + wind + temperature combination) that doesn't exist in the standard library. Document it with telemetry targets and staging parameters. Submit for community review.

MISSION TEACHING — Coach a Layer 0-2 player through a concept. Learner passes their trial after your instruction.

ENDURANCE MASTERY — Complete a 5-round competition simulation (40 total swings) maintaining grid hit rate above 60% and speed within 5% of personal best through the final round.

TELEMETRY ANALYSIS — Analyze 3 training sessions of another player's data. Identify the single highest-impact variable to change and explain why.

Trial: Portfolio submission — all four components documented with data and film.

Pass: Full system mastery certified.

Rank earned: GRAND CHAMPION → LEGEND (KSP's equivalent of planting a flag on every planet)


---

# PART 5 — RANK LADDER

| Rank | Divisions | Layer Required | KSP Equivalent |
|------|-----------|----------------|----------------|
| Unranked | — | Not started | No missions completed |
| Bronze III–I | Div 1–4 | Layer 0 complete | VAB certified — first rocket built |
| Silver III–I | Div 1–4 | Layer 1 complete | First launch — sub-orbital flight achieved |
| Gold III–I | Div 1–4 | Layer 2 complete | Orbit achieved — stable Kerbin orbit |
| Platinum III–I | Div 1–4 | Layer 3 complete | Mun flyby — reached another body |
| Diamond III–I | Div 1–4 | Layer 4 complete | Mun landing — mission complete with return |
| Champion III–I | Div 1–4 | Layer 5 complete | Interplanetary — Duna/Eve missions |
| Grand Champion III–I | Div 1–4 | Layer 6 complete | Grand Tour — multiple planet missions |
| Legend | No divisions | Layer 7 complete | Jool 5 — the ultimate challenge completed |


---

# PART 6 — LANGUAGE MAP

All in-app copy uses KSP's space program language:

| Concept | BombXP Term |
|---------|------------|
| Complete a move | Certify this system |
| Drill | Flight test |
| Coach tip | Mission Control Note |
| Stat boost | Science Points |
| Move decayed | System offline — recertify |
| Move getting stale | Signal degrading |
| My Board | Mission Log |
| Achievements | Badges (e.g., "Orbit Achieved", "Mun Lander", "Grid Commander") |
| OVR number | GOLD I — Division 3 |
| Practice session | Test Flight |
| Combo route | Mission Profile |
| Equipment setup | Vehicle Assembly |
| Ball speed | Velocity |
| Club head speed | Thrust |
| Smash factor | Specific Impulse (Isp) |
| Launch angle | Launch azimuth |
| Spin rate | Orbital velocity |
| Grid hit | Orbit achieved |
| Grid miss | Sub-orbital — crashed |
| Follow-through | Orbital insertion |
| Transition (top of backswing) | Stage separation |
| Downswing initiation | Gravity turn |
| Effort level | Throttle setting |
| Endurance / energy management | Fuel management / Δv budget |
| Competition warm-up | Engine pre-fire |
| Between-round recovery | Craft recovery |
| Trackman data | Telemetry |
| Wind reading | Atmospheric data |
| Random uncontrolled swing | Unplanned rapid disassembly (the KSP term for explosion) |
| Controlled, planned swing | Nominal flight |
| Swing that misses everything | Lithobraking (crashing into the ground) |


---

# PART 7 — ARCHETYPES

Instead of generic "hitter type," players choose a flight archetype that determines mission profile priorities and propulsion emphasis:

| Archetype | KSP Analog | Core Identity | Primary Profiles |
|-----------|-----------|---------------|-----------------|
| BOOSTER | Solid Rocket Booster | Raw power; maximum ball speed; accepts lower accuracy for distance | Power launch, Happy Gilmore, maximum distance missions |
| ORBITER | Nuclear Engine | Maximum efficiency; perfect smash factor; clean contact at controlled effort | Safety launch, finesse launch, speed reserve profiles |
| NAVIGATOR | Probe Core | Guidance specialist; grid accuracy above all; shapes shots on command | Crosswind launches, wind compensation, grid management missions |
| ENGINEER | Kerbal Engineer | Data-driven; telemetry obsessed; optimizes every variable through measurement | All telemetry systems, session logging, smash factor optimization |
| COMMANDER | Jebediah Kerman | Fearless competitor; thrives under pressure; best swing is always the last one | Pressure launch, competition targeting, final-swing execution |


---

# PART 8 — TRIAL TYPES

| Trial Type | Description | Pass Criteria |
|------------|-------------|---------------|
| Assembly Trial | Demonstrate correct equipment setup and pre-shot routine | 5 consecutive identical setups on film |
| Staging Trial | Execute the full swing sequence with correct stage separation | Film review: 6-of-10 swings show visible lower body lead |
| Propulsion Trial | Demonstrate measurable speed increase through specific technique | 5+ mph ball speed improvement documented on launch monitor |
| Guidance Trial | Hit the grid at a specified rate | 8-of-15 grid hits minimum |
| Mission Profile Trial | Execute complete profiles in simulated competition | 5-of-8 grid hits with multiple profiles used |
| Endurance Trial | Maintain speed and accuracy across extended set | No significant drop-off in swings 6-8 vs. 1-3 |
| Commander Trial | Film + telemetry submission for elite-level missions | External review confirms all conditions met |


---

# PART 9 — FRESHNESS DECAY (SYSTEM DEGRADATION)

Same engine as all XP Sports apps, themed as system status:

NOMINAL (100-70): Recently certified. All systems operational. Green lights.
DEGRADING (70-50): Signal weakening. System needs a test flight to recalibrate.
WARNING (50-25): System offline risk. Performance unreliable under pressure.
CRITICAL (25-10): Major system failure. Technique collapses in competition.
OFFLINE (below 10): System down. Must recertify from scratch. Full rebuild.

Decay rate slows with repeated certification (muscle memory). First certification: 8 points per day. Fourth certification: 4 points per day. Sixteenth certification: 2 points per day.


---

# PART 10 — THE ΔV BUDGET DISPLAY (Unique to BombXP)

BombXP is the only XP Sports app with a delta-v budget visualization on the home screen:

THE CONCEPT: Your body has a total Δv budget for any given swing — a finite amount of energy that must be allocated across stages. The app visualizes this as a stacked bar (like KSP's staging Δv readout in the VAB):

| Stage | Δv Allocation | Optimal % |
|-------|--------------|-----------|
| Stage 0 — Setup | 0 Δv (free) | 0% — setup costs nothing |
| Stage 1 — Backswing | ~20% of total Δv | Should use minimum necessary; wasted backswing energy = wasted fuel |
| Stage 1 Sep — Transition | ~10% of total Δv | Clean separation; minimal energy spent on the switch |
| Stage 2 — Downswing | ~50% of total Δv | Maximum Δv burn; this is the main engine |
| Impact — Payload | ~15% of total Δv | Energy transfer to ball; smash factor determines efficiency |
| Stage 3 — Follow-through | ~5% of total Δv | Deceleration only; no additional energy needed |

THE INSIGHT: Most amateur long drivers waste 40%+ of their Δv in the backswing (over-rotation, tension, unnecessary effort getting to the top) and have only 30-40% left for the downswing. Elite long drivers use 15-20% on the backswing and have 55-60% available for the downswing. The Δv budget display teaches players to feel where their energy is going and redirect it to where it matters.

THE TRAINING APPLICATION: Each practice session, the player self-rates their Δv allocation across stages. Over time, the app tracks whether the player is becoming more efficient — spending less Δv on setup stages and more on propulsion stages. The trend line IS the progress metric.

THE ENDURANCE APPLICATION: Across a set of 8 swings, total Δv depletes. Swing 1 might have 100% Δv available. Swing 8 might have 85%. The app teaches players to budget their total competition Δv — not just per-swing Δv but per-set and per-round Δv. This is fuel management for the entire mission, not just one launch.


---

END OF BOMBXP SPEC
