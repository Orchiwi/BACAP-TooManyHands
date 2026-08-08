> **This is an alpha.** The pack builds clean and passes every automated check, but the
> advancements have not been played through on a live server. Expect some not to fire, and
> please open an issue when one doesn't — that feedback is the point of the alpha.

**255 advancements for BlazeandCave's Advancements Pack that cannot be earned alone.**
Every one needs between two and five players. None duplicates any of the advancements
already in BACAP or BACAP Enhanced Discoveries.

### Install

Download **`BACAP-TooManyHands-v0.1.0-alpha.2.zip`** below and drop it into your
world's `datapacks/` folder next to the BACAP zip, then `/reload`.

```
<world>/datapacks/
  BlazeandCave's Advancements Pack 1.21.zip          <- required, install first
  BACAP-TooManyHands-v0.1.0-alpha.2.zip                        <- this pack (rename freely)
```

**BACAP is required.** This pack registers through BACAP's fanpack hooks, so scoreboard
totals, points and `/trigger bac_progress` stay correct. Without BACAP it does nothing. It
hooks onto BACAP's existing tabs rather than adding new ones, and adds its own milestone
chain ending in *Too Many Hands Legend*.

### Before you play

- **Every description ends with its player minimum in parentheses.** 204 need two players,
  24 need three, 23 need four, and 4 need five. Nothing needs six.
- **PvP must be enabled** for a subset of them — anything built around players damaging
  each other. Everything else works with PvP off.
- **Cooperative Mode is assumed off.** Advancements grant to *every participant*, not just
  whoever triggered the check — if four players unlock a vault together, all four get Vault
  Crew.

### What's in it

Full list with tabs, tiers and XP is in [`ADVANCEMENTS.md`](../blob/main/ADVANCEMENTS.md).
Highlights: co-op item relays, synchronised stunts, group boss fights, shared mounts, and
super challenges including passing one shulker box through five players across all three
dimensions.

### Notes

Built for **Paper 26.2** with BACAP and Enhanced Discoveries installed. 79 of the 255 use
tick-driven detection, because advancement criteria alone cannot express "two *different*
players did X"; checks are bucketed and exit early when too few players are online.

`/function bacaptmh:diagnose` prints a heartbeat for the tick chain if you ever need to
confirm it is running.

Advancements that rely on version-specific behaviour are written to fail closed, so if one
never fires that is the expected symptom of a wrong assumption rather than a broken world.
Please open an issue with the name and what you did.
