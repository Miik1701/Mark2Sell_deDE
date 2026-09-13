# Mark2Sell (German)

German language pack for the WoW Retail addon **Mark2Sell**. Without this pack, Mark2Sell shows all text in **English** regardless of the WoW client language.

## Installation

1. Copy the **`Mark2Sell_deDE`** folder into the WoW AddOns directory:
   - `_retail_/Interface/AddOns/Mark2Sell_deDE/`
2. Make sure **Mark2Sell** is installed as well - this pack requires it.
3. Enable both addons in the AddOn list, then `/reload` or restart the game.

When the WoW client language is German, Mark2Sell picks German automatically. The language can also be forced manually in **Options - AddOns - Mark2Sell** or via the setup window (`/m2s`).

## Authoring a new language pack

This addon is intentionally a minimal example and is meant to be used as a template for other languages.

1. Copy the **`Mark2Sell_deDE`** folder and rename it, e.g. `Mark2Sell_frFR`.
2. In the `.toc`:
   - Adjust `## Title` / `## Notes` for the new language.
   - Keep `## Dependencies: Mark2Sell` **unchanged** - it guarantees the load order.
3. In `Locale.lua`:
   - Set `LOCALE` to the matching WoW locale code (`frFR`, `esES`, `ruRU`, `koKR`, `zhCN`, `zhTW`, `itIT`, `ptBR`, ...). This code must equal `GetLocale()`'s return value on the target client so the automatic language selection works.
   - Set `DISPLAY_NAME` to the label shown in the addon's language dropdown (e.g. `"Français"`).
   - Translate the values in `STRINGS`. Do **not** rename the keys. Missing keys fall back to English automatically, so partial translations are fine.

## Public API in Mark2Sell

```lua
ItemMarker:RegisterLocale(locale, displayName, strings)
ItemMarker:GetRegisteredLocales() -- { { code = "enUS", name = "English" }, ... }
```

## Releasing a new version (maintainers)

Releases are driven by **GitHub Actions** (`.github/workflows/release-version.yml`) so **`## Version`** in `Mark2Sell_deDE.toc` stays in sync with a **git tag** for hosts such as **CurseForge** (packager on new tags).

### How to bump the version

1. Push to **`main`** or **`master`**.
2. Include **`[release] X.Y.Z`** anywhere in the **commit message** (subject or body), with **`X.Y.Z`** = semantic version digits only, for example:
   - `[release] 1.0.2`
   - `[release] v1.0.2` (the leading `v` is ignored; the tag will still be `v1.0.2`)
3. If that pattern is **missing**, the workflow does **nothing** (no `.toc` edit, no tag).
4. If it **matches**, the workflow will:
   - set `## Version: X.Y.Z` in `Mark2Sell_deDE.toc`;
   - commit **`chore(release): Mark2Sell_deDE X.Y.Z`** (without `[release]`, so it does not run again);
   - push the commit and create an annotated tag **`vX.Y.Z`**.

**Example commit message:**

```text
Update German translation for merchant tooltip

[release] 1.0.2
```
