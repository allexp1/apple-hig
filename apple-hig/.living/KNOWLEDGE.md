---
last_updated: 2026-10-05
review_interval_days: 30
mode: advisory
spec: living-skills/1.1
---

# Apple HIG — current facts

> Baseline note (2026-10-05): SKILL.md v2.0.0 and its references were rewritten
> on this date and already contain everything below. From here on, this file
> only needs to carry what changes after 2026-10-05.

## Design era: Liquid Glass (WWDC25), refined at WWDC26

- **Liquid Glass** (announced June 2025) is the unified design language across
  iOS 26 / iPadOS 26 / macOS Tahoe 26 / watchOS 26 / tvOS 26 / visionOS 26:
  translucent material with real-time lensing, specular highlights, motion
  response. Two variants: **regular** (adaptive default) and **clear**
  (media-rich, needs dimming layer).
- Principles: **Hierarchy** (floating glass control layer above an opaque
  content layer — never apply glass to content), **Harmony** (concentric
  geometry — corner radii derive from container/hardware; capsule controls
  default), **Consistency** across platforms. Don't stack glass on glass;
  glass belongs on the navigation layer only; use scroll edge effects, not
  opaque bar backgrounds.
- **The "27" OS generation** (iOS 27, iPadOS 27, macOS 27, watchOS 27,
  tvOS 27, visionOS 27): announced at WWDC26 (June 8, 2026), **released
  September 14, 2026** (Apple Newsroom, "Major updates for Apple's software
  platforms are now available"). No new language; Liquid Glass refined.
  Per the release Newsroom article (paraphrased): the design refinements
  aim at a more focused, approachable feel; a new Settings slider lets
  each person set Liquid Glass anywhere between nearly clear (the
  ultraclear end) and fully tinted; app icons are sharper and more
  defined. The June announcement also cited more uniform refraction and
  better contrast. Designs must stay legible across the whole slider
  range.
- macOS 27 additionally gets uniform toolbars, edge-to-edge sidebars, and
  colored sidebar icons. The September 14 Newsroom article gives **no
  marketing name** for macOS 27; the name "Golden Gate" recorded here on
  2026-09-09 could not be re-confirmed against a primary source on
  2026-10-05, so the skill says "macOS 27".
- **No new Liquid Glass developer APIs shipped with the 27 generation**
  (WWDC26 "What's new in SwiftUI," session 269): `glassEffect`,
  `GlassEffectContainer`, `.glassProminent`, and `ToolbarSpacer` remain the
  iOS 26-era APIs. Apps get the refined look and respond to the slider
  automatically on rebuild. New on macOS: custom glass elements can be marked
  **"interactive"** (as on iOS).
- **The compatibility opt-out is gone.** `UIDesignRequiresCompatibility` is
  documented as ignored in builds for iOS 27, iPadOS 27, Mac Catalyst 27,
  macOS 27, or tvOS 27 and later.
- HIG Materials now says the look of both glass variants can change with
  the Liquid Glass look a person picks in Settings, alongside Reduce
  Transparency and Increase Contrast. How the
  slider and those two toggles interact precisely is still not stated by a
  primary source (see CHANGELOG, UNCONFIRMED).
- **Siri AI** arrives with the 27 releases as a beta, English first.

## iPhone Duo (new device class)

- Apple's first folding iPhone. **Announced September 9, 2026; pre-order
  October 16; available October 23, 2026; from $1,999; ships with iOS 27.1.**
  A20 Pro; Touch ID in the side button (no Face ID).
- Displays (Apple tech specs): inner 7.6" 1878×2670 px at 430 ppi; outer
  5.4" 1398×2034 px at 460 ppi; both ProMotion 120 Hz. Point sizes are not
  published (outer derives to 466×678 pt at @3x; inner unknown).
- Size classes: outer portrait = compact width / regular height; outer
  landscape = compact / compact; inner = regular / regular. The inner
  display does not honor an app's supported interface orientations.
- HIG page "Designing for iPhone Duo" (new September 9, 2026): one app on
  two displays; compact + regular layouts cover every pose; **vertical
  controls** (Dynamic Island, status bar, toolbar, tab bar on the side of the
  outer display and of the inner display in landscape; horizontal bars on the
  inner display in portrait); hardware-aligned, not mirrored in RTL;
  **reserved regions** (outer camera, inner camera, folding region);
  **arrangement views** (split / overlay); don't override bar placement.
- System: Split View (two apps or two windows of one app, saved app pairs);
  multiple app instances if the app supports them on iPad; no new windows on
  the outer display; StandBy on either display.
- SDK tiers: built with a pre-27 SDK = compatibility presentation; iOS 27
  SDK = extends beside the status bar on the inner display; **iOS 27.1 SDK
  (Xcode 27.1) = edge to edge with vertical bars**. The Duo APIs
  (`ReservedRegion`, `ArrangementView`, `toolbarVerticalEdge`,
  `visibilityPriority`, `ToolbarVerticalCompressionBehavior`,
  `onHingeChange`, `CameraCaptureAccessory`, and UIKit equivalents) are
  iOS 27.1 and were marked beta when checked on 2026-10-05: re-verify names
  before quoting them as final.
- App Store screenshots: outer 1398×2034, inner 2007×2853; upload support
  announced for later in 2026.
- Detail lives in `references/iphone-duo.md`.

## SF Symbols

- **SF Symbols 7** (2025): Draw On/Off animations, Variable Draw (progress),
  gradient rendering, enhanced Magic Replace.
- **2026 release** (labeled SF Symbols 8 in the June beta): as of 2026-10-05
  developer.apple.com/sf-symbols/ counts over 7,000 symbols in nine weights
  and three scales, with **Enhanced Search** (semantic, natural-language);
  new symbols are available in apps running the 27 OS generation. The page
  shows **no version number** and no beta label; the download is named
  `SF-Symbols-27.dmg`. So the skill says "over 7,000" and avoids asserting
  a version name.
- **Icon Composer** (developer.apple.com/icon-composer/): per-layer
  **Refraction**, sharper material applied to existing files, Default / Dark
  / Mono previews, iPhone / iPad / Mac / Apple Watch; requires macOS Tahoe
  26.4 or later.

## Typography / layout shifts (26/27 era)

- SF Pro remains the system font; Dec 2025 HIG added emphasized weights to
  Dynamic Type specs.
- Alerts: **left-aligned, bolder titles** (was centered). Section headers:
  **sentence case, larger** (was ALL CAPS). Toolbars support subtitles and
  left-aligned large titles.
- **Concentric corner radii** (child = parent − padding) replace hand-tuned
  fixed radii. iPadOS 26+: real resizable windows and a menu bar on iPad.

## HIG structural changes 2025-26

- June 2025: new **Generative AI** page; **Navigation bars folded into
  Toolbars**; Materials/Color/Layout/App icons rewritten for Liquid Glass;
  Accessibility added Assistive Access + Accessibility Nutrition Labels.
- July-Dec 2025: tab bars are floating capsules that minimize on scroll;
  search moves to a dedicated search tab/island; scroll edge effects;
  **Widgets extended to visionOS and CarPlay; Live Activities to macOS and
  CarPlay**; spatial photos/scenes in Images.
- June 2026: Design principles page reintroduced; Siri page revised for
  "Siri AI"; new **Snippets** page (App Intents snippet UI); Generative AI
  page expanded (refining results, feedback during generation, choosing
  model types); Pass Designer for Wallet; updated Figma/Sketch kits for 27-era.
  Same June 8 update: **Menus** (menu item icons: sparingly, all-or-none per
  group), **Sidebars** (icon colors; adaptable sidebar style; tab bar first
  on iOS/iPadOS), **Scroll views** (scroll edge effects: prefer
  automatic, one per view, not decorative), **App icons**, **Search fields /
  Searching** (search as a tab: standard tab vs button appearance; bottom
  toolbar if there's room), **Tab bars** (no overflow tabs), App
  Shortcuts (app schemas), Machine learning, Apple Pay.
- September 9, 2026: new **Designing for iPhone Duo** page; **Layout**
  rewritten around size classes (size classes decide layout, not device
  type or orientation; the per-device dimension tables are gone;
  Device Hub for previews); **Branding** (use the accent color with restraint;
  move brand color into the content layer); SharePlay.
- September 17, 2026: iOS/iPadOS 27 and macOS 27 Figma kits; in-app purchase
  renamed **Apple In-App Purchase**. September 18: product bezels for iPhone
  Duo and iPhone 18.

## visionOS / spatial

- visionOS 26: **spatial widgets** (room-anchored, persistent across
  sessions; real-world scale, proximity-aware detail, minimal occlusion),
  spatial scenes (3D depth from 2D photos). WWDC26: spatial-web immersive
  environments, Reality Composer Pro 3.

## Pre-2025 advice that is now WRONG

1. Recommending ultraThin/thin/regular/thick blur materials for bars and
   controls — the control layer is Liquid Glass (`glassEffect` in SwiftUI /
   `UIGlassEffect` in UIKit); legacy materials are for in-content surfaces only.
2. Treating Navigation bars as a separate HIG component — folded into Toolbars;
   bars float, no opaque backgrounds.
3. Docked full-width tab bars and a magnifier icon in the nav bar — tab bars
   are floating capsules; search gets its own tab/island.
4. Pre-rendered static app icons — icons are layered Icon Composer documents
   with light/dark/clear/tinted appearances (+ refraction since June 2026);
   one design spans all platforms.
5. Centered alert text, ALL-CAPS headers, hand-tuned corner radii — see above.
6. "Transparency is only an accessibility toggle" — it's a user-facing slider
   since iOS 27.
7. Any HIG summary lacking the Generative AI, Snippets, and Siri-AI guidance
   pages, or the visionOS/CarPlay widget scope, predates 2025-26.
8. "More than five tabs? Use a More tab." The HIG now says avoid overflow
   tabs; restructure or use a tab bar that adapts to a sidebar.
9. "On iPad prefer a sidebar over a tab bar." Now: tab bar first (near the
   top), `sidebarAdaptable` when more areas are needed.
10. Laying out from device models, screen-size tables, or orientation. Use
    size classes; the HIG dropped the device tables in September 2026.
11. "Opt out of Liquid Glass with `UIDesignRequiresCompatibility`." Ignored
    from the 27 SDKs.
12. "iPhone bars are at the top and bottom" and "every current iPhone has
    Face ID." iPhone Duo puts bars on the side and uses Touch ID.
13. "SwiftUI/UIKit mirror everything in RTL." iPhone Duo's vertical controls
    stay on the same physical side.
