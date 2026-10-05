# Changelog

File paths are relative to the `apple-hig/` skill folder unless they start at the repository root.

## 2.0.0 — 2026-10-05

Brings the skill up to iOS 27 and adds iPhone Duo. Apple facts were checked against Apple's published pages on this date.

### Philosophy
- Added Apple's eight design principles (HIG "Design principles" page, June 8, 2026): purpose, agency, responsibility, familiarity, flexibility, simplicity, craft, delight. `SKILL.md` now leads with them; `references/philosophy.md` §12 summarizes each one, traces it to the older lineage, and explains how to use the eight together with clarity / deference / depth.
- `references/philosophy.md` §11 covers the second year of Liquid Glass; §13 covers iPhone Duo as flexibility made physical.
- `references/applying.md`: a new worked derivation for a folding phone, three new review-lens questions, two new anti-patterns.
- `references/psychology.md`: Fitts and habituation notes for iPhone Duo's side controls.

### Liquid Glass in the 27 generation
- The user-facing Liquid Glass slider (from an ultraclear end to a fully tinted end): design and test across the range.
- More uniform refraction, better contrast, sharper app icons.
- `UIDesignRequiresCompatibility` is ignored from the 27 SDKs; there is no opt-out.
- HIG rules made explicit: no Liquid Glass in the content layer, the 35% dimming layer for clear glass over bright content, scroll-edge effect rules, brand color in the content layer.

### iPhone Duo
- New `references/iphone-duo.md`: anatomy, poses and size classes, vertical controls, reserved regions, split and arrangement views, Split View and windows, games and camera, SDK tiers and APIs, a 14-item checklist, anti-patterns.
- Duo essentials in `SKILL.md`, a Duo section in `references/platforms.md`, and Duo notes in components, patterns, foundations, and accessibility.
- The Duo developer APIs were in beta when this was written. Check names against current documentation.

### Components and patterns
- Tab bars: no overflow tabs (the More tab is no longer advised), don't hide or disable tabs, badges for critical information only, iPad tab bar near the top with the adaptable sidebar style.
- Navigation bars are treated as top toolbars, as in the HIG. Toolbar grouping, single prominent action, and overflow rules added.
- Search: the three iPhone entry points (search tab, toolbar, inline) and when to use each.
- Sidebars: tab bar first on iPhone and iPad, two levels of hierarchy, icon color rules.
- Menus: menu item icons sparingly, all or none within a group.
- New: generative AI, Siri AI and App Intents, and snippets.
- Layout: size classes instead of device types or orientation.

### Corrections to 1.0
- "Use a More tab beyond five tabs" replaced with the HIG's current advice: no overflow tabs.
- "Prefer a sidebar over a tab bar on iPad" replaced with tab bar first.
- SF Symbols count updated from 6,900+ to over 7,000.

### Repository
- **npx installer.** `npx apple-hig` installs the skill (`--project`, `--dry-run`, `--dest DIR`); `package.json` and `bin/install.js` at the repository root. Published on npm as [`apple-hig`](https://www.npmjs.com/package/apple-hig); `npx github:allexp1/apple-hig` installs the current `main` branch.
- `install.sh` now moves an existing install to `~/.claude/skill-backups/` instead of deleting it, keeps installed knowledge that is newer than the repository's, and re-baselines the sidecar hash.
- The `.living/` sidecar ships inside `apple-hig/`: dated facts, trusted sources, a change log, and an integrity hash for `SKILL.md`.
- `scripts/build.sh` checks the frontmatter and versions, re-baselines the hash, and rebuilds `dist/apple-hig.skill`. `scripts/publish.sh` publishes to npm.
- `README.md`, `CONTRIBUTING.md`, and `NOTICE` updated for all of the above.

## 1.0.0 — 2026-05-26

Initial version: the three pillars, Liquid Glass for the 26 generation, foundations, components, patterns, platforms, accessibility, philosophy, psychology, and the derivation method.
