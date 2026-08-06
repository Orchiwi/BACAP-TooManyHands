# BlazeandCave's Advancements Pack Fellowship

An add-on for **BlazeandCave's Advancements Pack** adding **55 advancements that cannot be
earned alone**. Every one needs between two and five players. None duplicates any of the
1,776 advancements in BACAP or BACAP Enhanced Discoveries.

## Install

Download this repository (**Code → Download ZIP**, or clone it) and copy the folder
`BlazeandCave's Advancements Pack Fellowship` into your world's `datapacks/` folder, next to the
BACAP zip. Then `/reload`, or restart the server.

```
<world>/datapacks/
  BlazeandCave's Advancements Pack 1.21.zip   <- required, install this first
  BlazeandCave's Advancements Pack Fellowship/   <- this pack
```

Minecraft accepts datapacks as plain folders, so no zipping is needed. If you would rather
install a zip, compress the **contents** of that folder — `pack.mcmeta` has to sit at the
root of the archive, not inside another folder.

**BACAP must be installed.** This pack registers through BACAP's fanpack hooks
(`bacap_fanpacks:update_score` and `update_points`) so scoreboard totals, points and
`/trigger bac_progress` stay correct. Without BACAP it does nothing. It hooks onto BACAP's
existing tabs rather than adding new ones, and adds its own milestone chain ending in
*Fellowship Legend*.

## Before you play

**PvP must be enabled** for six advancements: First Blood, Mutually Assured Destruction,
Falling Out, Long Shot Rivalry, Aerial Superiority and Spear Joust. Everything else works
with PvP off.

**Cooperative Mode is assumed off.** Advancements grant to *every participant*, not just
whoever tripped the check — if four players unlock a vault together, all four get Vault
Crew. Turning Cooperative Mode on later still behaves correctly.

**Players needed:**

| Players | Count | Advancements |
|---|---|---|
| 2 | 22 | Aerial Superiority, Assist, Carpool, Catch of the Day, Fair Trade, Falling Out, Field Medic, First Blood, Long Distance Relationship, Long Shot Rivalry, Matching Outfits, Mutually Assured Destruction, Reunion, Shared Custody, Spear Joust, Tag Team, Total Party Kill, Trapped!, Trident Tag, Trust Fall, Two-Hump Transit, Wind Duel |
| 3 | 17 | All For One, Barn Raising, Chemical Warfare, Conduit Club, Congregation, Dress Code, Formation Flying, Group Nap, Pack Leaders, Raid Party, Sculk Silence, Shield Wall, Snowball War, Split the Party, Submarine Crew, Warden Party, Wither Committee |
| 4 | 14 | Cavalry Charge, Community Beacon, Convoy, Firework Finale, Ghast Fleet, Group Buff, Hot Potato, Insurance Policy, Orchestra, Secret Santa, Team Photo, The Nether Express, The Wave, Vault Crew |
| 5 | 2 | Fashion Police, The Gauntlet |

Nothing needs six. The two five-player entries stay incomplete until five people are
online at once; that is intended.

## Known limitations

**Barn Raising and The Gauntlet can lock out late joiners.** Minecraft stops tracking an
advancement's criteria once a player completes it, so a player who already holds one of
these cannot re-arm their half of the check. On a server where everyone already has it, a
new player cannot earn it. Most other group advancements avoid this by reading live state
(position, effects, statistics) instead of criteria, so veterans keep counting toward the
group requirement — those two could not be expressed that way.

**Performance.** 50 of the 55 need tick-driven detection, because advancement criteria
alone cannot express "two *different* players did X". They are split across three buckets:
every tick for timing-critical pairings, every 0.5 s for proximity, every 5 s for distance
and inventory sweeps. Every check exits early when too few players are online and is gated
on players who do not yet hold the advancement, so completed entries stop costing anything.
If the server strains, `data/bacapfel/function/bucket_fast.mcfunction` is the first thing
to slow down.

## Diagnostics

```
/function bacapfel:diagnose
```

Run it twice a few seconds apart. It prints a heartbeat for the tick function and each of
the three dispatch buckets, the player count the buckets see, and BACAP's `bac_settings`
values. If the heartbeats are not rising, the tick chain is not running — check
`logs/latest.log` for `Failed to load function`.

## Test these first

The pack is confirmed loading and running on a live Paper 26.2 server: the load
function initialises, the tick chain dispatches, and advancements grant in play.

What that does **not** prove is that all 55 fire correctly — only that the machinery they
depend on is alive. The entries below rest on behaviour that could not be confirmed
statically, so they are the ones worth a deliberate look as you come to them. Where they
are wrong they fail closed — they do not fire — rather than granting for free.

| Advancement | What to confirm |
|---|---|
| Tag Team, Wither Committee, Warden Party | that the boss is still selectable at 0 health on the tick the detector samples |
| Carpool, Two-Hump Transit, Ghast Fleet, Convoy, Submarine Crew | that `execute on vehicle ... on passengers` round-trips a rider, and that Nautiluses are player-rideable |
| Field Medic, Chemical Warfare | that vanilla fills the `source` field on `effects_changed` for splash and lingering potions |
| Vault Crew | that vault `server_data.rewarded_players` reads as assumed |
| Dress Code, Fashion Police | the armour-trim NBT path on a live player |
| Pack Leaders | `if items entity @s armor.body minecraft:wolf_armor` on a real wolf |
| Trapped! | that opening a trapped chest latches `default_block_use` (rewritten after the original statistic proved not to exist) |
| Wind Duel, Falling Out, Snowball War, Trident Tag | the paired-credit chains, which need a real second player |
| Shared Custody | that naming an animal stamps it and feeding pays both players |

## Credits and how this was built

An add-on for [BlazeandCave's Advancements Pack]. It requires BACAP and does not modify
it; all of the tabs these advancements appear in, the tier and points system, and the
reward machinery are BACAP's. Full credit for the underlying pack goes to BlazeandCave.

Every advancement here was checked against the 1,776 advancements already in BACAP and
BACAP Enhanced Discoveries so that nothing duplicates them. The pack is generated from a
declarative definition of each advancement rather than hand-written, and a static verifier
checks item and block IDs, triggers, parent references, file completeness and command
safety before each release. That build tooling is kept outside this repository, which holds
the finished datapack only.

## Feedback

If an advancement does not fire when it should, open an issue with its name and what you
did. It is more useful than it sounds: a couple of these rely on version-specific
behaviour, and they are written to fail closed, so a silent no-op is the expected symptom
of a wrong assumption rather than a rare edge case.
