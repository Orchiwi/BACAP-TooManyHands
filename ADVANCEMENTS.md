# Every advancement these two add-ons add

Generated from the built packs with `python3 generator/list_advancements.py`.

Legend: `·` task · `◆` goal · `★` challenge · `★★` super challenge

None of these duplicates any of the 1,776 advancements already in BlazeandCave's Advancements Pack or Enhanced Discoveries.

---

# Fellowship

55 advancements that cannot be earned alone. Every one needs between two and five players.

**55 advancements** across 12 tabs, plus 13 progression entries.

| Tab | Count |
|---|---|
| Adventure | 15 |
| Animals | 4 |
| Biomes | 2 |
| Building | 3 |
| Monsters | 4 |
| Nether | 2 |
| Potions | 3 |
| Redstone | 3 |
| Statistics | 1 |
| Super Challenges | 5 |
| The End | 2 |
| Weaponry | 11 |

## Adventure — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Dress Code** | Adventure | Three players in full armour of the same material with the same armour trim | 60 |
| ◆ | **Fair Trade** | Adventure | Swap items with another player: you each pick up what the other dropped within 5 seconds | 40 |
| ★ | **Fashion Police** | Adventure | Five players each wearing a full suit trimmed with a different material at the same time | 160 |
| ◆ | **Group Nap** | Adventure | Every online player sleeps during the same night | 50 |
| ★ | **Hot Potato** | Adventure | Pass items down a line of four players within ten seconds | 150 |
| · | **Matching Outfits** | Adventure | Two players wearing identically dyed leather armour, all four pieces | 25 |
| ★ | **Orchestra** | Adventure | Four players sound four different Goat Horns within five seconds | 150 |
| ★ | **Raid Party** | Adventure | Three players holding Hero of the Village at the same time | 110 |
| ◆ | **Reunion** | Adventure | Meet another player after you have each spent ten minutes with nobody within 5,000 blocks | 35 |
| ★ | **Secret Santa** | Adventure | Four players in one place swapping items within ten seconds | 170 |
| ★ | **Shared Custody** | Adventure | Feed an animal that another player named with a Name Tag | 90 |
| ◆ | **Split the Party** | Adventure | Have three players in three different dimensions at the same moment | 45 |
| · | **Team Photo** | Adventure | Squeeze four players into a three-block radius | 20 |
| ★ | **The Wave** | Adventure | Four players jump one after another, each within half a second of the last | 130 |
| ★ | **Vault Crew** | Adventure | Four players each unlock the same Ominous Vault | 180 |

<details><summary>How these are detected</summary>

- **Dress Code** — Every 5 s the armour material is read with `execute if items` over the four armour slots and the trim material is read from the equipment NBT of the same four slots, giving each player a material index and a trim index. Only `equipment.head/chest/legs/feet` is read: that is the attested player layout at this pack format - bacaped:animal/youre_part_of_a_hive_mind_now tests player NBT as Inventory slots 0-35 plus an `equipment` compound - so the old Inventory slot 100-103 fallback was dead code and doubled the cost of the scan for nothing. Three players inside 16 blocks who share both indices are granted; the proximity is what makes it a dress code rather than three strangers in three dimensions. Live reads replace advancement criteria, so players who already hold it keep counting towards everyone else's three. It keys on trim material, not pattern, exactly as BACAP's own Coordinated Flair does.
- **Fair Trade** — `gave` fires when an item you threw is picked up by another player and `got` fires when you pick up an item another player threw; both carry `entity.distance.absolute.min = 1`, the guard BACAP uses in mining/diamonds_to_you, so picking your own dropped item back up (distance 0) latches neither. Every 0.5 s the detector stamps a 5-second timer on each flag and revokes it, and grants to any player holding both timers at once - which means an item of theirs went to somebody else and somebody else's item came to them inside the same window. Only the claimant needs live criteria, so a partner who already owns the advancement can still trade with a newcomer. Both timers are cleared on the grant.
- **Fashion Police** — Reuses the same live trim index Dress Code computes. Around each trimmed player the detector tags exactly one wearer per trim material - the same one-slot-per-category trick Split the Party uses for dimensions - and grants only to the tagged five or more once five different materials are present within 32 blocks. Crediting every trimmed player in range would have handed the challenge to seven people wearing five materials between them, which is not what the description says. A single player can only ever hold one index, because the index is only set when all four pieces carry the same material, so five tags means five people. Nothing depends on advancement criteria, so a player who already owns it still supplies their colour to the line-up instead of being invisible to the count.
- **Group Nap** — Sleeping is picked up two ways: the `slept` criterion for players who still need the advancement, and the vanilla sleep_in_bed statistic against a mirror for those who already hold it and can no longer latch criteria. Either one stamps a 60-second window on the player, and the grant fires when every non-spectator player online holds a live window at the same time. A real-time window replaces the old 'wipe the latch whenever daytime is under 1000' rule, so a frozen or externally driven clock cannot let people sleep sessions apart and still collect. The mirror is seeded at load and refreshed by an ungated bucket line, and it is not shared with any other advancement.
- **Hot Potato** — The check is driven from a middle link - a player who both received an item from someone and had an item of theirs picked up by someone inside the same 10 seconds, which is what being in the middle of a relay produces and which the min-distance-1 guard stops you from faking with your own item. The chain around that link is givers, plus receivers who did not give, plus players who already hold the advancement and whose Items Dropped statistic rose inside the same 10 seconds - the only live channel a holder still has, since a granted advancement stops latching criteria. Simply being present is not enough for anybody. It counts hand-offs, not item identity, so it cannot prove the same potato made the whole trip. All stamps are zeroed on the grant.
- **Matching Outfits** — Every 5 s each player's four armour slots are read live with `execute if items`, matching the leather item in each slot together with an exact minecraft:dyed_color value, so the check really is leather armour and not merely something carrying that component - the omission BACAP never makes in animal/fashion_statement. The matched colour index is written to a score and any two players inside 16 blocks sharing it are granted; the proximity is what makes it an outfit rather than two strangers in two dimensions. Because nothing lives in advancement criteria, a player who already holds it still counts as somebody's matching partner. Only the sixteen exact vanilla dye values are recognised, not custom mixed shades.
- **Orchestra** — A horn blast is detected from the vanilla used:goat_horn statistic against a per-cycle mirror rather than from advancement criteria, which is what lets a player who already owns the advancement still play their part; the mirror is seeded at load and refreshed by an ungated bucket line, so it can never read a lifetime total as a fresh blast, and it is not shared with the jump or sleep mirrors. The blower's held horn is inspected with `execute if items` to find which of the eight instruments sounded, that instrument's flag is raised, the player is tagged and the window is opened. The window is fixed, not rolling: only the first blast of a chain sets the five-second timer and later blasts do not extend it, so four instruments really do have to sound inside five seconds of the first one rather than inside a chain of blasts spaced under five seconds apart. It grants when four different instrument flags and four different tagged players are live at once, so one player blowing four horns is not an orchestra. Every flag, the timer and the tags are cleared on the grant and when the window lapses.
- **Raid Party** — Every 5 s the detector reads Hero of the Village straight off every non-spectator player's active_effects and grants when three carry it at once. Reading NBT rather than a minecraft:location criterion removes the phase dependence: location fires on each player's own 20-tick cycle, and tagging from it while revoking in the same pass made the count depend on whose cycle happened to align with the sampling pass.
- **Reunion** — Every 5 s each player's isolation streak advances if no other non-spectator player is within 5000 blocks and is wiped to zero the instant one is. Ten minutes of streak (120 cycles) earns a permanent ticket; two ticket holders standing within 3 blocks are reunited. The streak, not a sticky tag, is what makes it honest: hopping through a Nether portal and walking back only earns a ticket if you actually stay away for ten minutes, so the fact that a distance selector cannot see across dimensions no longer buys anything. The ticket is never taken back, so a veteran can be the other half of a newcomer's reunion, and the streak resets at 120 so nothing grows without bound.
- **Secret Santa** — The same self-pickup-guarded give/get pair as Fair Trade on a 10-second timer, so dropping and re-collecting your own item latches nothing. A player who still needs the advancement counts as a participant only by holding both live timers - a real hand-off out and a real hand-off in. A player who already holds it can never latch a criterion again, so they count from a live channel that survives the grant instead: the vanilla Items Dropped statistic, stamped with its own 10-second window by an ungated bucket line whenever it rises. That is deliberately weaker evidence than gave+got, and it is why the description says players swapping items rather than claiming every one of the four is verified to have both given and received; what it buys is that a veteran must actually be throwing items into the pile to make up the numbers for a newcomer, instead of merely standing nearby, and that a player who joins the server late is not locked out forever. Four participants inside 16 blocks grants to the live traders; the timers are reset on the grant.
- **Shared Custody** — Naming an animal stamps the namer's integer player id onto that animal in the bacapfel_owner objective. Feeding an animal whose stamp is somebody else's id grants to the feeder and to the player whose id it is. The comparison is integer-only, so unlike the name-matching version it never puts player-controlled text near a command.
- **Split the Party** — Every 5 s the detector walks every non-spectator player, and the first player found in each dimension raises that dimension's flag and is tagged. When all three flags are up it grants to the three tagged players only, so a crowd standing next to whoever holds the Overworld slot gets nothing. Needs three players online, counted with `store result ... if entity`, or it returns after two commands.
- **Team Photo** — Every 5 s, for each player who still lacks it, the detector counts non-spectator players within 3 blocks (self included) and grants to all of them when the count reaches 4. The count is a real `store result ... if entity` count, not a `limit=4` selector test, and it includes players who already hold the advancement, so veterans can still make up the numbers for a newcomer.
- **The Wave** — A minecraft.custom:minecraft.jump objective is compared against a previous-tick mirror, so a jump is seen on the tick it happens. The mirror is refreshed by an ungated line in bucket_fast that runs every tick whether or not the detector did, and it is seeded at load, so it can never freeze while fewer than four players are online and then read a backlog of jumps as four simultaneous ones the moment a fourth player joins. Each new jumper who is not already in the chain is tagged, bumps the chain counter and refreshes a 10-tick window; four tagged players grant to all of them and the chain resets. The window is rolling, which is why the description says each jump is within half a second of the last rather than claiming all four fall inside one fixed half second. Spectators and creative players are excluded.
- **Vault Crew** — The `unlock` criterion is BACAP's own Revaulting condition - an ominous trial key used on a vault whose ominous state is true. It is now only a trigger, not the whole count. When it fires, a short twelve-step line-of-sight walk from the player's eyes finds the ominous vault they just used the key on and reads `server_data.rewarded_players` off the block: a vault keeps a list of every player it has already rewarded, so 'the same vault, four different people' is read from the world instead of guessed. Reaching four grants. A second, independent path covers a crew that opens one vault together in one go: four live unlockers inside 8 blocks and 10 seconds. Neither path counts a player merely because they already hold the advancement and happen to be standing there - the previous version did, and one unlocker beside three idle veterans was enough to finish it. Stamps are zeroed on the grant.

</details>

## Animals — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| · | **Carpool** | Animals | Share a boat with another player | 15 |
| ◆ | **Cavalry Charge** | Animals | Four players in the saddle on four Horses, all inside fifteen blocks | 50 |
| ★ | **Pack Leaders** | Animals | Three players each with an armoured Wolf at heel, all within ten blocks | 140 |
| · | **Two-Hump Transit** | Animals | Take a Camel out with a second player riding the other hump | 15 |

<details><summary>How these are detected</summary>

- **Carpool** — For each player still missing it, the detector walks 'execute on vehicle ... on passengers' and counts how many of that vehicle's passengers are non-spectator players; if the vehicle is in #blazeandcave:all_boats and the count is two or more, every player aboard is granted. A pure started_riding criterion cannot express this because its vehicle.passenger predicate also matches the mounting player themselves, and players are never written into a vehicle's Passengers NBT, so the passenger walk is the only reliable count. Per-rider counting is correct here because the requirement is two riders in the same boat.
- **Cavalry Charge** — Run at a player who lacks it: every non-spectator within 15 blocks is stepped onto their vehicle, and each vehicle that is a minecraft:horse inside 15 blocks is tagged. The count is then of TAGGED HORSES, not of riders, so the threshold cannot be met by stacking riders on one animal even if a future mount gains extra seats; at four or more distinct mounted horses the passengers of those horses are granted. The tag is cleared before and after the count, and both clears are radius-limited to the same 15 blocks, which is exact because no time passes inside one function execution.
- **Pack Leaders** — Two radii, both stated: wolves are searched and tagged within 24 blocks of the running player, and the qualifying players are the non-spectators within 10 blocks of them. Wolves within 24 blocks are tested with 'if items entity @s armor.body minecraft:wolf_armor' and tagged bacapfel_armored. Each candidate player then CLAIMS one armoured wolf within 8 blocks that no one else has claimed: if such a wolf exists the player is tagged bacapfel_leader and the nearest free wolf is tagged bacapfel_claimed, so one shared wolf can satisfy exactly one player. Three leaders are therefore three players each with their own armoured wolf; the separate 'three wolves in the area' count is gone because the claim already implies it. Wolf Armor can only be equipped on a tamed wolf, so the armour test doubles as the tamed test; ownership is inferred from the wolf sticking near its player rather than from the Owner UUID, which commands cannot compare. All three tags are cleared at both ends of the function.
- **Two-Hump Transit** — Identical passenger walk to Carpool but the vehicle must be a minecraft:camel; when one camel carries two non-spectator player passengers both riders are granted.

</details>

## Biomes — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Conduit Club** | Biomes | Have three players share Conduit Power at the same conduit | 40 |
| ◆ | **Submarine Crew** | Biomes | Three players riding three Nautiluses within fifteen blocks of each other | 50 |

<details><summary>How these are detected</summary>

- **Conduit Club** — A single NBT pass tags every non-spectator holding minecraft:conduit_power, then anchors on each tagged player and counts tagged players within 48 blocks. A full-power conduit projects 96 blocks, so a 48-block cluster cannot straddle two conduits in two different oceans — the old global @a count let three players at three separate conduits qualify. Three in range grants exactly those three; the tag is cleared at both ends of the function so nothing leaks.
- **Submarine Crew** — Same distinct-vehicle pattern as Cavalry Charge and Ghast Fleet: every non-spectator within 15 blocks is stepped onto their vehicle, each minecraft:nautilus so found is tagged, and the TAGGED NAUTILUSES are counted. Three distinct crewed nautiluses grants every player riding one of them. Counting vehicles rather than riders matters here because nothing in the reference material establishes a Nautilus's passenger capacity, so three players on one Nautilus must not satisfy 'three Nautiluses'.

</details>

## Building — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Barn Raising** | Building | Have three players each place a hundred blocks inside the same chunk | 60 |
| ★ | **Community Beacon** | Building | Have four players receiving an effect from the same beacon at once | 130 |
| ◆ | **Firework Finale** | Building | Have four players launch fireworks together within three seconds | 45 |

<details><summary>How these are detected</summary>

- **Barn Raising** — requirements are now [["place"],["impossible"]] — two AND-ed groups that between them name every criterion, so AdvancementRequirements.validate is satisfied and the file loads, while the impossible group still means placing blocks can never complete it by itself. The fast bucket selects on advancements={bacapfel:building/barn_raising={place=true,impossible=false}}, so a player who already holds it (all criteria true) is never re-entered and the revoke can never un-complete a finished advancement. The chunk key is fixed three ways: the coordinate is read raw and floor-divided by 16 through a scoreboard /= (which is floorDiv, unlike the old 0.0625 scale that truncated toward zero and made a 32-block bucket around the origin), a dimension score joins x and z in the key, and the tally is reset to zero for every player granted so a veteran can never pad a later group with a frozen 100. The tally is also the one persistent counter in f4_init, so it is created there with 'add 0' rather than cleared with 'set 0': start_extra deliberately clears bacapfel_init on every /reload to reseed the statistic mirrors, and the old 'set 0' meant every reload wiped three builders' in-progress block counts at once. bacapfel_cx/cz/cd were already left untouched, so the chunk key survives the reload and still matches the tally. Granting uses a plain 'advancement grant @s only', which sets both criteria. Known limit: a player who already holds this cannot help a newcomer, because a completed advancement stops listening to its own criteria — the pack has no parentless technical advancement to hang the flag on, since every entry here is forced to carry a parent, a display and a milestone slot.
- **Community Beacon** — Beacons apply their effects with ambient set, which drunk or splashed potions never are — the same discriminator BACAP itself uses in nether/beacon_overlord. Six tag passes mark every non-spectator carrying an ambient Speed, Haste, Resistance, Jump Boost, Strength or Regeneration; each tagged player is then an anchor and four tagged players within 24 blocks grants all of them. The radius came down from 50 to 24 specifically because 50 is a full-power beacon's own reach, so two beacons up to 100 blocks apart could pool their crowds; 24 blocks cannot span two beacons' effect volumes in any useful way. The beacon block itself is still not located — a block scan over a 100x400x100 box every five seconds is not affordable — so the guarantee is 'four beacon-buffed players standing together', which is what the advancement is actually about.
- **Firework Finale** — A minecraft.used:minecraft.firework_rocket delta opens a six-medium-tick window, which is exactly three seconds rather than the 3.5 the old value gave. The check now anchors on a launcher and counts windowed non-spectators within 32 blocks, so four people setting off rockets in three different dimensions no longer share a finale. Rockets burnt for Elytra thrust still count as launches.

</details>

## Monsters — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Assist** | Monsters | Finish off a monster that a teammate had already beaten down below two hearts | 40 |
| ★ | **Total Party Kill** | Monsters | Wipe out: every player on the server dead inside the same ten seconds | 120 |
| ★★ | **Warden Party** | Monsters | Put down a Warden with three players inside sixteen blocks, none of them recently killed | 500 |
| ★ | **Wither Committee** | Monsters | Bring down a Wither with three or more players standing within twenty blocks | 180 |

<details><summary>How these are detected</summary>

- **Assist** — Every 0.5 s each player whose damage_dealt delta is positive stamps bacapfel_dmgt with the gametime and walks the monsters within 12 blocks. The walk is #blazeandcave:hostile_monsters MINUS the three bosses that tag also contains (Ender Dragon, Wither, Warden): the tag keeps armour stands, boats, item frames, villagers and farm animals out of the search, and the three exclusions keep Assist about ordinary mobs. Without them this goal would have been a free side effect of Tag Team, Wither Committee and Warden Party in this same batch - a boss lingers at 0 health through a long death animation, necessarily passes through 0.1-3.9 HP under a 10-tick sampler, and those three advancements already guarantee two or more co-located players with fresh damage deltas in range - and 'beaten down below two hearts' reads absurdly for a 200-HP dragon. A monster read between 0.1 and 3.9 health gets the entity tag bacapfel_softened, an entity tag rather than a scoreboard row, so it vanishes with the mob and nothing can leak. When a monster carrying that tag is next seen at 0 health, the finisher's own sample counts how many non-spectator, non-creative players within 16 blocks dealt damage in the last 100 ticks; at two or more, all of them are granted and the tag is removed. The health read is now a single data get, with the shared temp score reset to a sentinel first instead of an 'unless data entity @s Health' probe, so the walk costs one NBT access per mob per damaging player rather than two while still being safe against a read that returns nothing. There is no per-mob identity scoreboard at all, so the pid/soft/softby objectives and their permanent UUID rows are gone. Attribution is still by statistic delta plus proximity rather than by a damage-source hook, so in a dense melee a second attacker who was hitting a different mob nearby can be credited alongside the real pair.
- **Total Party Kill** — Deaths are detected from a vanilla deathCount objective (bacapfel_deaths) that detect/sample reads and immediately resets every window, stamping bacapfel_dtime with the gametime; sitting on the death screen stamps it too, as a second path. That means the wipe is still detected on servers running doImmediateRespawn, where nobody ever occupies the death screen, and it cannot be missed by a player who respawns between two samples. The check counts online non-spectator, non-creative players and how many of them carry a stamp newer than 200 ticks; when the two counts are equal and there are at least three players, everyone is granted. A counter that is consumed rather than compared against a saved lifetime total cannot produce a first-run false positive.
- **Warden Party** — Same shape as Wither Committee but on the Warden at 16 blocks. 'Nobody dead' is enforced with the pack's death mirror rather than with a snapshot of the death screen: bacapfel_deaths is a vanilla deathCount objective, sampled and consumed every window in detect/sample, which stamps bacapfel_dtime with the gametime of the player's last death (the Health:0.0f test is kept as a second path). A counted player must be within 16 blocks, not on the death screen, and must have no death stamp inside the last 1200 ticks, so dying at any point in the last minute of the fight disqualifies you for the rest of it. That is enforceable on a 10-tick sampler and works with doImmediateRespawn on, unlike the old 'is on the death screen at this exact sample' test, which a player who died and respawned walked straight through. The Warden's death animation keeps the entity around long enough for the sampler to catch Health 0.
- **Wither Committee** — Gated on three or more non-spectators actually being online (counted properly into #players bacapfel_sys, not with a limit= selector, which only ever tests for one match). Players who lack the advancement and have a Wither within 20 blocks run a check as the nearest Wither; it reads the Wither's Health NBT and, once Health is 0 (the Wither persists through its long death animation before dropping the Nether Star), counts non-spectator, non-creative players within 20 blocks who are not on the death screen and grants to all of them if there are at least three. Counting is never gated on who already holds the advancement, so a player who already has it still counts toward the three and cannot lock anybody out.

</details>

## Nether — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Ghast Fleet** | Nether | Four players out on four separate Happy Ghasts, all within twenty blocks | 200 |
| ◆ | **The Nether Express** | Nether | Have four players pass through the same Nether portal within ten seconds | 55 |

<details><summary>How these are detected</summary>

- **Ghast Fleet** — Players within 24 blocks are stepped onto their vehicle; each Happy Ghast that turns out to be carrying a non-spectator, non-creative player and sits within 20 blocks is tagged, and the tagged ghasts are counted. At four or more distinct crewed ghasts every player riding one of them is granted, which is what makes this different from Enhanced Discoveries' Ghast Squad (four players on a single ghast). Tags are cleared at both ends of the function so nothing leaks between checks. The description no longer promises 'airborne' because no altitude test is reliable for a hovering mob without risking an advancement that never fires.
- **The Nether Express** — A per-player dimension score is seeded on first sight without arming anything, so a login is never read as a crossing. The dimension pass itself now runs unconditionally over @a at the top of the medium bucket, not inside the player-count and advancement gate that guards the co-location check: a mirror that only updates while a gate is open goes stale the moment the gate shuts, and when the gate reopened every player whose real dimension had drifted from their frozen score would arm a window in the same tick — four players who had been to the Nether and back while a fifth was offline could be granted a 55 XP goal by standing at spawn when that fifth logged in. It is also run for spectators, so a spectator who crosses does not come back to survival carrying a stale score. Any transition into or out of the Nether opens a twenty-medium-tick window, exactly ten seconds. The gated half then anchors on each windowed non-spectator and grants when four windowed non-spectators stand within 24 blocks — arrival points only land that close together if it was one portal — and zeroes their windows on the granting path so the counter cannot be reused. Known limit, stated plainly: dying in the Nether is also a dimension change, so four players wiping together and respawning at the same bed inside ten seconds would qualify. A PortalCooldown read would discriminate that, but its value for players is not something I could verify against this version's files, and a wrong guard there would make the advancement unobtainable, which is worse — so it is listed as a playtest item instead.

</details>

## Potions — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Chemical Warfare** | Potions | Poison three different players with a single Lingering Potion | 120 |
| ◆ | **Field Medic** | Potions | Heal a player who is below three hearts with a Splash Potion of Regeneration | 45 |
| ◆ | **Group Buff** | Potions | Have four players together share an identical set of three or more effects | 50 |

<details><summary>How these are detected</summary>

- **Chemical Warfare** — The 'gassed' criterion fires on a victim only when ANOTHER player is the recorded source of a Poison effect, which rules out poisonous potatoes, spider eyes, suspicious stew, pufferfish and cave spiders in one stroke — those pass no player source. requirements [["gassed"],["impossible"]] cover the criteria set exactly. The fast bucket revokes the flag and then demands a lingering Poison cloud within 6 blocks, matched on the cloud's own contents (nbt={potion_contents:{potion:"minecraft:poison"}} plus strong_poison and long_poison), so Dragon's Breath and a Lingering Potion of Swiftness no longer qualify and a plain splash of Poison no longer qualifies either. A qualifying victim gets a four-second bacapfel_gas window; three windowed victims within 12 blocks grants exactly those victims (gamemode=!spectator) plus whoever incremented minecraft.used:minecraft.lingering_potion in the last four seconds within 24 blocks. The old blanket 'grant everyone within 24 blocks' is gone, and the gas windows are zeroed on the granting path. This one has no equivalent of the Field Medic timing race, because an AreaEffectCloud waits 10 ticks before its first application, which is always at least one medium tick after the thrower's statistic rose.
- **Field Medic** — Rebuilt on a real trigger instead of a health delta. The 'dosed' criterion is minecraft:effects_changed with effects={minecraft:regeneration} and source = an entity_properties predicate pinning entity_type player plus distance absolute min 1 — the same self-exclusion idiom BACAP uses in mining/diamonds_to_you, in the source-field shape verified against Enhanced animal/buff_axolotl.json. Vanilla passes the potion's owner as the effect source, and a self-splash measures the distance between the patient and the source entity, which for one and the same entity is always 0, so it can never be self-served; beacons, golden apples and mob-applied poison pass no source at all and are excluded outright. requirements are [["dosed"],["impossible"]], which covers the criteria set exactly (so the file loads) and ANDs an impossible criterion in, so the flag alone never completes it. The fast bucket picks up players holding {dosed=true,impossible=false}, revokes the flag and reads Health once at scale 10 (Regeneration I heals no sooner than 50 ticks after application, so current health is still pre-potion health), requiring 1..59 — that is 0.1 to 5.9 HP, so a patient on a quarter heart is admitted where the old scale-1 read floored them to 0 and threw them out with the corpses, while a dead player's true 0 is still excluded and respawning still cannot fire it. The medic is then a different player within 16 blocks who either carries a live splash-potion window or still has an unconsumed minecraft.used:minecraft.splash_potion delta against its own mirror; accepting the pending delta as well as the window closes the race where a potion thrown at an ally two or three blocks away lands its effect 2-6 ticks after the statistic rises, before the next medium tick could turn that rise into a window. No health-snapshot objective is used any more, which also removes the bacapfel_hp name collision with the A30 mob-health objective.
- **Group Buff** — Cost dropped from 112 NBT selector evaluations per slow tick to 8. One tag pass per buff effect (Speed, Strength, Regeneration, Fire Resistance, Water Breathing, Night Vision, Jump Boost, Invisibility) is the only time a player is serialised; from the tags it builds a count (bacapfel_gb) and an eight-bit mask (bacapfel_gbm, 1/2/4/.../128) with pure tag-selector score commands. It then anchors on each player carrying at least three effects and counts players within 16 blocks whose mask score is equal, which is a plain score comparison — no combinatorial trio walk at all. Four matching masks grants exactly those four. Requiring the mask to be identical rather than merely overlapping in three places is what makes the check cheap, and it is what a shared round of splash potions actually produces, so the description now says 'an identical set of three or more' rather than 'the same three'. The 16-block radius means four players in three dimensions no longer qualify.

</details>

## Redstone — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Convoy** | Redstone | Four players rolling along in four Minecarts at the same time | 55 |
| · | **Trapped!** | Redstone | Have another player set off a trapped chest that you just placed | 20 |
| ★ | **Trust Fall** | Redstone | Survive a thirty-block fall into water another player placed for you | 110 |

<details><summary>How these are detected</summary>

- **Convoy** — detect/sample turns each player's minecart_one_cm statistic into a per-window delta. It runs ungated for every non-spectator and seeds the baseline the first time it sees a player, so a parked player can never be credited with their lifetime minecart distance and the baseline cannot go stale when the advancement gate flips. The check then tags every distinct minecraft:minecart within 20 blocks that is carrying a non-spectator, non-creative player with a positive delta, counts the tagged carts, and grants to their passengers at four. Counting carts rather than riders is what stops four players in one cart from qualifying. 'The same track' is approximated by the 20-block radius rather than by a rail block test, because no rails block tag is attested in the installed packs.
- **Trapped!** — Opening a trapped chest latches the `opened` criterion, using the same default_block_use + location_check shape BACAP uses in redstone/troll_chest. The detector consumes the criterion, then grants to the opener and to any other player within 32 blocks whose bacapfel_tct window is still live, i.e. who placed a trapped chest in the last minute.
- **Trust Fall** — A minecraft.used:minecraft.water_bucket delta opens a sixty-second window on whoever pours; only while some window is open does the fast bucket track anyone at all, and then only players who are not on the ground, so the per-tick FallDistance read is bounded. The running peak per player is kept in bacapfel_fall. Landing in a minecraft:water block with a peak of 30+, with a windowed pourer other than the faller within 24 blocks, grants both and zeroes the peak. The bank-a-dive exploit is closed: the peak is cleared by ANY water, not just by touching ground, so diving 30 blocks into a natural lake and staying in it no longer leaves a live 30 sitting there waiting for someone to place a bucket nearby. Tracking is no longer gated on the faller lacking the advancement, so a veteran can still act as the faller for a pourer who needs it. Spectators and creative are excluded on both ends.

</details>

## Statistics — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Long Distance Relationship** | Statistics | Have two players at least 10,000 blocks apart in the same dimension | 50 |

<details><summary>How these are detected</summary>

- **Long Distance Relationship** — The slow bucket anchors on each non-spectator lacking the advancement and tests @a[gamemode=!spectator,distance=10000..]; a distance argument makes the selector world-limited, so a match is automatically two players in the same dimension. Both selectors and the bucket guard now carry gamemode=!spectator, so a lone player plus a spectator ghosting 10 km away no longer completes it and a spectator is never granted. Anchoring on the player who lacks it still grants both ends, so a veteran at the far end is not a lockout.

</details>

## Super Challenges — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★★ | **All For One** | Super Challenges | Have every online player in full Netherite armour carrying an Elytra, at once | 450 |
| ★ | **Formation Flying** | Super Challenges | Hold a three-player Elytra formation within ten blocks above Y=200 | 200 |
| ★★ | **Insurance Policy** | Super Challenges | Have four players burn a Totem of Undying in one fight within five seconds | 400 |
| ★★ | **Sculk Silence** | Super Challenges | Have three players survive two minutes together in the Deep Dark with no Warden | 350 |
| ★★ | **The Gauntlet** | Super Challenges | Pass one Shulker Box through five different players across all three dimensions | 500 |

<details><summary>How these are detected</summary>

- **All For One** — The slow bucket tags every non-spectator, then strips the tag off anyone failing 'if items entity @s armor.head/chest/legs/feet' for the four Netherite pieces, and off anyone with no Elytra in hotbar.*, inventory.* or weapon.offhand. Both the qualifying count and the online count are built by counting entities into a score, never by an @a[limit=N] test. If the two are equal and at least three non-spectators are online, all of them are granted. Both scratch tags are cleared at both ends.
- **Formation Flying** — BACAP's own blazeandcave:is_flying predicate (flags.is_flying, i.e. Elytra gliding) finds the gliders; their Y goes into a score and those at Y>=200 are tagged. Each tagged glider is an anchor: with three tagged gliders within 10 blocks a persistence counter goes up, and the moment the condition fails it is reset to zero. The grant only happens at four consecutive medium ticks, so the formation has to hold for two full seconds — the old version was a single instantaneous sample that three players diving through the same airspace could satisfy in one frame, which is what the old note wrongly claimed it prevented. Counters are zeroed on the granting path and for anyone not currently in formation.
- **Insurance Policy** — Vanilla awards minecraft.used:minecraft.totem_of_undying the moment a totem saves you; the delta against its own private mirror opens a ten-medium-tick window, exactly five seconds rather than 5.5. The check anchors on a totem user and counts windowed non-spectators within 48 blocks, so it is now one shared disaster rather than four unrelated fights that happened to line up in time. Four people simultaneously one hit from death in the same place is the whole point.
- **Sculk Silence** — Co-location is now required throughout, not just at the finish. Every five seconds each non-spectator standing in minecraft:deep_dark is tagged, and any Warden within 96 blocks strips the tag; a tagged player only ticks their counter up if at least three tagged players (themselves included) are within 48 blocks, otherwise it is reset to zero. Three people who each spent two quiet minutes in three separate pockets and then converged no longer qualify — the whole two minutes has to be spent as a group. At 24 ticks the group is granted and every granted counter is reset to zero, so a veteran standing around can never pad a later attempt with a frozen 24. Counting is deliberately not gated on lacking the advancement, so veterans can still make up the three for a newcomer. The streak is one of the counters f4_init clears, which is correct here: a /reload stops the ticking loop anyway, and this advancement is about two unbroken minutes.
- **The Gauntlet** — requirements are [["hand_off"],["impossible"]], covering the criteria set exactly so the file loads, while still being uncompletable without a command grant. The direction of the trigger is confirmed from BACAP's own husbandry/allay_deliver_item_to_player and adventure/awards_ceremony, both of which award the RECEIVER and describe 'this' in the entity predicate as the thrower (there, an allay). The self-hand-off hole is therefore closed with BACAP's own guard from mining/diamonds_to_you: distance absolute min 1 on the thrower predicate, which for a player collecting their own dropped box measures the distance from an entity to itself and is always 0. Five players each re-collecting their own box no longer completes a 500 XP super challenge. The fast bucket revokes the flag, marks the leg's dimension, tags the receiver if they are new to this run and bumps a global chain counter; five distinct receivers plus all three dimension flags grants everyone tagged. Because only receivers are counted, a straight five-player line produces four receivers — the relay has to come back round to the player who started it, which a ring of five does naturally and which is what 'through five different players' means here. A thirty-minute idle timer, decremented in the slow bucket, wipes the chain and stands in for 'one Shulker Box' — the item's identity itself is not tracked. Known limit, same as Barn Raising: a player who already holds this cannot re-arm the criterion, so a later relay needs five players who all still lack it.

</details>

## The End — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Congregation** | The End | Have every online player present in the End at the same time | 150 |
| ◆ | **Tag Team** | The End | Finish the Ender Dragon after at least two different players have wounded it | 60 |

<details><summary>How these are detected</summary>

- **Congregation** — The slow bucket counts non-spectator players who are NOT in minecraft:the_end by iterating and adding, never by an @a[limit=N] test. If that count is zero and at least three non-spectators are online, everyone non-spectator is granted. Spectators are ignored so an AFK observer cannot block it, and the three-player floor stops it firing for a lone player wandering the End. Nobody is excluded from the count for already holding it, so a veteran in the End does not break it for the rest.
- **Tag Team** — Every 0.5 s while an Ender Dragon exists in the End the detector samples the dragon's Health NBT; when it drops, every non-spectator, non-creative player within 128 blocks whose damage_dealt delta for that same window is positive gets a wounder stamp (bacapfel_dgt = gametime). The delta comes from detect/sample, which runs UNGATED for every non-spectator every window and seeds its baseline the first time it sees a player, so a player who has never been sampled can never have their lifetime damage_dealt read as a fresh hit. When the dragon's Health reaches 0 (it lingers through the ~200-tick death animation, so there are many sampling chances) the advancement is granted to every player within 256 blocks whose stamp is under 2400 ticks old, provided there are at least two of them. Attribution is by damage-statistic delta plus proximity rather than a real damage-source hook, so hitting some other mob in the same half second the dragon is wounded could in principle tag a bystander; the two-minute stamp window means a player who stopped fighting long before the kill stops counting.

</details>

## Weaponry — Fellowship

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★★ | **Aerial Superiority** | Weaponry | Kill another Elytra-flying player while flying with an Elytra yourself | 400 |
| · | **Catch of the Day** | Weaponry | Hook another player with a fishing rod and reel them in | 25 |
| ★ | **Falling Out** | Weaponry | Kill another player with an anvil you dropped on them | 140 |
| · | **First Blood** | Weaponry | Kill another player | 20 |
| ★ | **Long Shot Rivalry** | Weaponry | Kill another player with a bow from at least 100 blocks away | 160 |
| ★ | **Mutually Assured Destruction** | Weaponry | Trade kills with another player within the same second | 150 |
| ◆ | **Shield Wall** | Weaponry | Three players within eight blocks all block a hit with their shields at once | 70 |
| ◆ | **Snowball War** | Weaponry | Hit three different players with snowballs within ten seconds | 60 |
| ★ | **Spear Joust** | Weaponry | Land a Spear charge attack on another player while both of you are riding Horses | 170 |
| ◆ | **Trident Tag** | Weaponry | Hit another player with a thrown trident and catch a Loyalty trident on the return | 55 |
| ◆ | **Wind Duel** | Weaponry | Launch another player six blocks into the air with your Wind Charge | 70 |

<details><summary>How these are detected</summary>

- **Aerial Superiority** — One criterion, no fallback and no requirement group: both the killer and the victim must have is_fall_flying set, the flag BACAP itself tests in weaponry/arrow_of_ultimate_obliteration. The trigger fires from LivingEntity.die before anything clears the victim's gliding flag, so the flag is still set when it is evaluated. The earlier equipment fallback was deleted outright: it accepted a victim who was merely off the ground, which any jump satisfies, and it made this criterion dead code.
- **Catch of the Day** — Pure criteria, the exact shape BACAP uses for weaponry/indiana_jones with the hooked entity narrowed to minecraft:player. fishing_rod_hooked fires on retrieval, so it only pays out once the hooked player is actually reeled in, and a rod cannot hook its own user.
- **Falling Out** — Three independent facts have to line up, and each one is now proved rather than guessed. (1) The dropper: placing an anvil fires the dropped hook, which arms him for ten seconds and is revoked again immediately, so it stays a dated event. (2) The cause of death: the crushed_* criteria are minecraft:entity_hurt_player with damage.blocked false and a source_entity that is a falling_block carrying an anvil BlockState - the exact criterion BACAP uses for enchanting/classic_cartoon_comedy - so an anvil provably struck the victim unblocked. Standing under an anvil and dying of lava no longer counts. (3) The attribution: detect/anvil_stamp runs at each live falling anvil, takes the single nearest armed player within 12 blocks and writes that one player's permanent id onto everyone within 2.5 blocks of the anvil, so the payout names one player instead of being broadcast to everyone within 200 blocks who has been building with anvils. The payout fires when a stamped player's death flag comes up in the same cycle as a crushed hook, and grants only the player whose id matches the stamp; the victim is tagged for the length of that command and excluded from the selector, so dropper and victim can never be the same player and this cannot be completed alone. The impossible criterion in its own AND group keeps the advancement from ever completing by itself. Two deliberate compromises: the crushed hooks are revoked after every read but only for players who do not already hold the advancement - revoking a criterion of a finished advancement would strip it off them - so a victim who already holds Falling Out is judged on the stamp alone, which is what keeps him usable as somebody else's victim on a two-player world instead of making it unobtainable there; and hurt and death are paired at the 10-tick resolution of the bucket, so a player who survives an anvil and dies of something else inside the same tenth of a second while still standing under a live falling anvil would also pay out.
- **First Blood** — Pure criteria: player_killed_entity fires on the killer when the entity killed is of type minecraft:player, so any PvP kill by any means grants it, and only the killer is granted. A player cannot be the entity of his own player_killed_entity, so it can never be earned alone. requirements is left empty so the default (the single criterion) applies.
- **Long Shot Rivalry** — Pure criteria built from BACAP's own long-range kill shapes: killing_blow requires a projectile whose direct entity is an arrow carrying weapon:{id:"minecraft:bow"} (the same NBT test weaponry/the_mighty_hunter uses to exclude crossbows), and the victim must be a player at least 100 blocks away horizontally, the same distance form as weaponry/king_of_the_sea. requirements is empty so the single criterion applies.
- **Mutually Assured Destruction** — Detection is a function, but the statistic mirrors it reads are maintained by bacapfel:detect/f2_events, which runs every 10 ticks gated on nothing at all: the playerKillCount and deathCount mirrors are converted into the shared three-cycle flags bacapfel_ekill / bacapfel_edeath and then zeroed there and nowhere else, so no mirror can ever go stale behind a closed gate and no other advancement consumes them. detect/mutual_destruction grants any player holding both flags who has a second player holding both flags within 64 blocks - the flags are kept for every player, including those who already hold the advancement, so a partner can never be locked out. It proves a mutual trade only to the extent that two players each killed a player and each died within the same 1.5 s and stood within 64 blocks of each other.
- **Shield Wall** — The damage_blocked_by_shield statistic only moves when a raised shield actually stops damage, so it doubles as 'blocking while being hit'. bacapfel:detect/f2_events turns that mirror into the one-second bacapfel_eblock flag for every player, gated on nothing, so the mirror can never go stale and holders of the advancement keep being flagged and keep counting towards other players' walls. detect/shield_wall then counts, for each flagged player, the flagged players within 8 blocks of him (himself included) and grants everyone who reaches three. The bucket entry counts players properly - scoreboard players set #f2players 0 then one add per non-spectator - instead of the @a[limit=3] form, which only ever tests for one player.
- **Snowball War** — Snowballs deal zero damage to players and Player.hurt returns early on zero damage, so no damage trigger ever fires; the projectile is watched instead. The watch starts from a player - bacapfel:detect/f2_near runs as each non-spectator and looks for snowballs within 48 blocks of him - because a bare @e in a tick function only sees the dimension of the server command source, i.e. the overworld, and because an @e with no distance bound walks every loaded entity. Each snowball is then taken 'at @s on origin if entity @s[type=minecraft:player]', so the chain runs as the thrower and snow golem, dispenser and Breeze projectiles are skipped entirely; reaching the same snowball from two players in one tick is harmless because every step below is idempotent. The thrower carries a temporary owner tag while victims are picked, so he can never be one of his own three. Distinctness is now kept on the thrower, not on the victim: every player is given a permanent id at first sight and the thrower remembers the ids of the three players he has already hit in this window, so a second thrower can no longer overwrite the first thrower's record and let one player be counted twice. Every player inside the radius is offered rather than only the nearest, so an already-counted player standing in front no longer hides an uncounted one. The ten-second window is opened once, on the first hit, and is not pushed forward by later hits. No score is ever written to a snowball entity, so nothing accumulates in scoreboard.dat. Because the tick function runs before entities move, the last sample of a snowball is up to one tick of travel short of its impact, so the 1.6 block radius is what makes a real hit register; a snowball passing that close without landing also counts.
- **Spear Joust** — Pure criteria in BACAP's own monsters/lancelot and weaponry/hit_and_run shape, with no statistic mirror. The blazeandcave:spear damage type tag is the Spear charge attack, the victim must be a player whose vehicle is in #blazeandcave:all_horses, and the attacker must be holding a Spear from #blazeandcave:spears while riding a horse himself - so the blow is proved to have landed on a specific mounted player instead of being inferred from two riders damaging anything nearby. Mainhand and offhand are two criteria in one OR group, exactly as BACAP writes it. player_hurt_entity has no self-exclusion, but a Spear is a melee weapon - blazeandcave:spear resolves to the minecraft:spear damage type and there is no thrown spear entity - so unlike a trident it cannot come back down on its own user, and no distance guard is needed to keep this off a solo player.
- **Trident Tag** — The two criteria are hooks, not the completion condition: the third criterion is minecraft:impossible and the requirements are three separate AND groups, so the advancement can never complete on its own. bacapfel:detect/trident_tag reads the hooks every 10 ticks and clears each one again with 'advancement revoke ... <criterion>' so it can fire afresh, which is what turns a permanent criterion into a dated event; the hit pass runs before the catch pass, so a hit and a catch landing in the same cycle still pair up. hit_player requires a projectile whose direct entity is a trident entity striking a player, which excludes a melee trident stab (its direct entity is the player), and it now carries entity.distance.absolute.min = 1, the self-guard BACAP uses in mining/diamonds_to_you: player_hurt_entity has no self-exclusion, so without it a trident thrown straight up and caught on the head satisfied the hook at distance 0 and one player could finish this alone. Any real hit on another player is at least a block away. It opens a four-second window; if the caught hook lands inside that window the advancement is granted and the window is cleared. Both hooks and the grant belong to the same player, so the revoke is only ever applied to players who do not hold the advancement and nobody can be locked out. The remaining looseness is on the catch side and is left deliberately: caught is 'an inventory change while a Loyalty trident is in the inventory', which a returning Loyalty trident always produces but which an unrelated item move within four seconds of a genuine hit also produces. Every tighter form was worse - a returning trident goes through Inventory.add and lands in the first free slot, not necessarily a hand, so an equipment predicate would make the advancement miss real catches, and a count-before/count-after check cannot be snapshotted before the return when both hooks are read in the same cycle. It over-grants a player who really did spear another player and is carrying a Loyalty trident; it is not solo-completable.
- **Wind Duel** — A wind burst deals no damage, so the projectile is watched. detect/f2_near runs as each non-spectator and looks for minecraft:wind_charge entities within 48 blocks of him - starting from a player instead of a bare @e is what makes the watch work outside the overworld and keeps the scan bounded - then takes each charge 'at @s on origin if entity @s[type=minecraft:player]', so a Breeze projectile (minecraft:breeze_wind_charge, a different entity type) and a dispenser-fired charge (no origin at all) are never followed. Credit is paired, not broadcast: every player carries a permanent id, the launched player records the id of the thrower who marked him, and the payout grants only the player whose id matches that record. The thrower carries an owner tag while victims are picked, so a self-launch is impossible, and creative, spectator and Elytra-gliding players are never marked. The rise check runs every tick, so the top of the arc cannot be missed. Two things make 'rose six blocks' mean 'was launched': the window is one second, not three - long enough for the burst's arc, too short to climb six blocks by jumping up a block stack, by ladder or by rocket - and the gliding test is re-applied every tick inside the window instead of only at marking time, so deploying an Elytra after being marked cancels the window rather than farming it. Heights are read as hundredths of a block (Pos[1] scaled by 100, threshold 600) because a plain read truncates towards zero and would misreport the rise by up to a whole block below Y=0. Six blocks is what a wind charge under a player's feet actually delivers; the original twenty blocks was more than the burst can produce, so that version would silently never have fired.

</details>

## Progression — Fellowship

Milestones unlock as you finish each tab, chaining into the pack's capstone. They live in the BlazeandCave's Advancements tab, not the tab they track.

| | Advancement | Tab | Requirement | XP |
|---|---|---|---|---|
| ◆ | **Fellowship Adventure Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Adventure tab | 500 |
| ◆ | **Fellowship Animals Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Animals tab | 500 |
| ◆ | **Fellowship Biomes Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Biomes tab | 500 |
| ◆ | **Fellowship Building Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Building tab | 500 |
| ◆ | **Fellowship Super Challenges Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Super Challenges tab | 500 |
| ◆ | **Fellowship The End Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the The End tab | 500 |
| ★★★ | **Fellowship Legend** | BlazeandCave's Advancements | Complete every single advancement in Fellowship | 1500 |
| ◆ | **Fellowship Monsters Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Monsters tab | 500 |
| ◆ | **Fellowship Nether Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Nether tab | 500 |
| ◆ | **Fellowship Potions Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Potions tab | 500 |
| ◆ | **Fellowship Redstone Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Redstone tab | 500 |
| ◆ | **Fellowship Statistics Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Statistics tab | 500 |
| ◆ | **Fellowship Weaponry Milestone** | BlazeandCave's Advancements | Complete every Fellowship advancement in the Weaponry tab | 500 |

---

# Alphabetical index

All 55 new advancements, A to Z, with the tab each one appears in.

| Advancement | Tab | Pack | | What you do |
|---|---|---|---|---|
| **Aerial Superiority** | Weaponry | Fellowship | ★★ | Kill another Elytra-flying player while flying with an Elytra yourself |
| **All For One** | Super Challenges | Fellowship | ★★ | Have every online player in full Netherite armour carrying an Elytra, at once |
| **Assist** | Monsters | Fellowship | ◆ | Finish off a monster that a teammate had already beaten down below two hearts |
| **Barn Raising** | Building | Fellowship | ◆ | Have three players each place a hundred blocks inside the same chunk |
| **Carpool** | Animals | Fellowship | · | Share a boat with another player |
| **Catch of the Day** | Weaponry | Fellowship | · | Hook another player with a fishing rod and reel them in |
| **Cavalry Charge** | Animals | Fellowship | ◆ | Four players in the saddle on four Horses, all inside fifteen blocks |
| **Chemical Warfare** | Potions | Fellowship | ★ | Poison three different players with a single Lingering Potion |
| **Community Beacon** | Building | Fellowship | ★ | Have four players receiving an effect from the same beacon at once |
| **Conduit Club** | Biomes | Fellowship | ◆ | Have three players share Conduit Power at the same conduit |
| **Congregation** | The End | Fellowship | ★ | Have every online player present in the End at the same time |
| **Convoy** | Redstone | Fellowship | ◆ | Four players rolling along in four Minecarts at the same time |
| **Dress Code** | Adventure | Fellowship | ◆ | Three players in full armour of the same material with the same armour trim |
| **Fair Trade** | Adventure | Fellowship | ◆ | Swap items with another player: you each pick up what the other dropped within 5 seconds |
| **Falling Out** | Weaponry | Fellowship | ★ | Kill another player with an anvil you dropped on them |
| **Fashion Police** | Adventure | Fellowship | ★ | Five players each wearing a full suit trimmed with a different material at the same time |
| **Field Medic** | Potions | Fellowship | ◆ | Heal a player who is below three hearts with a Splash Potion of Regeneration |
| **Firework Finale** | Building | Fellowship | ◆ | Have four players launch fireworks together within three seconds |
| **First Blood** | Weaponry | Fellowship | · | Kill another player |
| **Formation Flying** | Super Challenges | Fellowship | ★ | Hold a three-player Elytra formation within ten blocks above Y=200 |
| **Ghast Fleet** | Nether | Fellowship | ★ | Four players out on four separate Happy Ghasts, all within twenty blocks |
| **Group Buff** | Potions | Fellowship | ◆ | Have four players together share an identical set of three or more effects |
| **Group Nap** | Adventure | Fellowship | ◆ | Every online player sleeps during the same night |
| **Hot Potato** | Adventure | Fellowship | ★ | Pass items down a line of four players within ten seconds |
| **Insurance Policy** | Super Challenges | Fellowship | ★★ | Have four players burn a Totem of Undying in one fight within five seconds |
| **Long Distance Relationship** | Statistics | Fellowship | ◆ | Have two players at least 10,000 blocks apart in the same dimension |
| **Long Shot Rivalry** | Weaponry | Fellowship | ★ | Kill another player with a bow from at least 100 blocks away |
| **Matching Outfits** | Adventure | Fellowship | · | Two players wearing identically dyed leather armour, all four pieces |
| **Mutually Assured Destruction** | Weaponry | Fellowship | ★ | Trade kills with another player within the same second |
| **Orchestra** | Adventure | Fellowship | ★ | Four players sound four different Goat Horns within five seconds |
| **Pack Leaders** | Animals | Fellowship | ★ | Three players each with an armoured Wolf at heel, all within ten blocks |
| **Raid Party** | Adventure | Fellowship | ★ | Three players holding Hero of the Village at the same time |
| **Reunion** | Adventure | Fellowship | ◆ | Meet another player after you have each spent ten minutes with nobody within 5,000 blocks |
| **Sculk Silence** | Super Challenges | Fellowship | ★★ | Have three players survive two minutes together in the Deep Dark with no Warden |
| **Secret Santa** | Adventure | Fellowship | ★ | Four players in one place swapping items within ten seconds |
| **Shared Custody** | Adventure | Fellowship | ★ | Feed an animal that another player named with a Name Tag |
| **Shield Wall** | Weaponry | Fellowship | ◆ | Three players within eight blocks all block a hit with their shields at once |
| **Snowball War** | Weaponry | Fellowship | ◆ | Hit three different players with snowballs within ten seconds |
| **Spear Joust** | Weaponry | Fellowship | ★ | Land a Spear charge attack on another player while both of you are riding Horses |
| **Split the Party** | Adventure | Fellowship | ◆ | Have three players in three different dimensions at the same moment |
| **Submarine Crew** | Biomes | Fellowship | ◆ | Three players riding three Nautiluses within fifteen blocks of each other |
| **Tag Team** | The End | Fellowship | ◆ | Finish the Ender Dragon after at least two different players have wounded it |
| **Team Photo** | Adventure | Fellowship | · | Squeeze four players into a three-block radius |
| **The Gauntlet** | Super Challenges | Fellowship | ★★ | Pass one Shulker Box through five different players across all three dimensions |
| **The Nether Express** | Nether | Fellowship | ◆ | Have four players pass through the same Nether portal within ten seconds |
| **The Wave** | Adventure | Fellowship | ★ | Four players jump one after another, each within half a second of the last |
| **Total Party Kill** | Monsters | Fellowship | ★ | Wipe out: every player on the server dead inside the same ten seconds |
| **Trapped!** | Redstone | Fellowship | · | Have another player set off a trapped chest that you just placed |
| **Trident Tag** | Weaponry | Fellowship | ◆ | Hit another player with a thrown trident and catch a Loyalty trident on the return |
| **Trust Fall** | Redstone | Fellowship | ★ | Survive a thirty-block fall into water another player placed for you |
| **Two-Hump Transit** | Animals | Fellowship | · | Take a Camel out with a second player riding the other hump |
| **Vault Crew** | Adventure | Fellowship | ★ | Four players each unlock the same Ominous Vault |
| **Warden Party** | Monsters | Fellowship | ★★ | Put down a Warden with three players inside sixteen blocks, none of them recently killed |
| **Wind Duel** | Weaponry | Fellowship | ◆ | Launch another player six blocks into the air with your Wind Charge |
| **Wither Committee** | Monsters | Fellowship | ★ | Bring down a Wither with three or more players standing within twenty blocks |

**55 new advancements in total.**
