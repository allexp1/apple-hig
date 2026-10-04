---
name: apple-hig
version: "2.0.0"
description: Apple's Human Interface Guidelines (HIG) plus the design philosophy and cognitive psychology beneath them, current to iOS 27 and iPhone Duo. A working reference and a reasoning method. Use when designing, reviewing, or building an interface for any Apple platform (iOS, iPadOS, macOS, watchOS, tvOS, visionOS), including the foldable iPhone Duo, when applying Apple-style design to web/cross-platform UI, or when deriving Apple-grade design for an interface the HIG never covered (voice, kiosks, automotive, AR, AI agents). Covers Apple's eight 2026 design principles and the classic clarity/deference/depth, the psychology behind the rules (Fitts, Hick, Miller, Jakob, Gestalt, peak-end), Liquid Glass for iOS 26/27, iPhone Duo layouts (two displays, vertical controls, reserved regions), typography, color, SF Symbols, motion, layout, accessibility, Siri AI and generative features. Trigger for "follow the HIG," "make this look like an Apple app," "design an iOS screen," "support iPhone Duo."
license: MIT (see LICENSE). Apple and related names are trademarks of Apple Inc.; this is an independent, unaffiliated reference (see NOTICE).
---

# Apple Human Interface Design

Apple's Human Interface Guidelines (HIG) are the canonical rulebook for designing software that feels native on Apple platforms. But the rules are only the surface. Beneath them is a **philosophy** (a worldview about what design is and whom it serves) and a **psychology** (how human perception, memory, attention, and motivation actually work). This skill gives you all three layers — the why, the what, and a method for applying them:

- **The why** — `references/philosophy.md` and `references/psychology.md`. Learn these and you can *derive* good design, not just recall rules.
- **The what** — concrete specs (sizes, weights, colors, components, the current visual language) in the reference files.
- **The method** — `references/applying.md` turns the why into a repeatable process and extends it to interfaces the HIG never covered (voice/audio, kiosks, automotive, AR, AI agents). Apple's rules are *instances* of deeper principles applied to Apple's screens; on a new surface you re-derive from the same roots rather than copying the shapes.

**Current to:** the 27 generation (iOS 27, iPadOS 27, macOS 27, watchOS 27, tvOS 27, visionOS 27; released September 14, 2026), the HIG's June and September 2026 updates, and iPhone Duo (iOS 27.1, ships October 23, 2026). Facts newer than that live in `.living/KNOWLEDGE.md` when the sidecar is installed.

## How to use this skill

1. **For the reasoning behind any decision, start with the why** — `references/philosophy.md` (values) and `references/psychology.md` (cognition). These resolve most design questions and let you justify or defend a choice.
2. **Start with the principles below** — the compressed version of that why — they decide most design questions on Apple platforms.
3. **Apply the current design language** (Liquid Glass, as refined in the 27 generation) for anything targeting iOS 26 / macOS Tahoe 26 and later.
4. **For any iPhone work, assume the app will also run on iPhone Duo.** Design for the space, not the device: `references/iphone-duo.md`.
5. **To design something new — especially a non-Apple or non-screen interface — use the method** in `references/applying.md` (a 7-step first-principles process + cross-modality translation + worked examples).
6. **Pull exact specs from the reference files** when you need numbers, component rules, or platform details. Load only the file you need:
   - `references/philosophy.md` — the worldview: design-is-how-it-works, the Bauhaus/Rams lineage, simplicity-as-subtraction, deference, honesty, coherence, craft, accessibility/defaults as ethics, how the three pillars descend from it, and Apple's eight 2026 design principles (§12).
   - `references/psychology.md` — the cognitive science that explains why the rules work: Fitts, Hick, Miller, Jakob, Doherty, Gestalt, Von Restorff, serial position, aesthetic-usability, mental models, affordances/signifiers, error theory, recognition-over-recall, goal-gradient, peak-end, emotional design, attention, trust.
   - `references/applying.md` — the generative method: deriving Apple-grade design for any human/machine interface (incl. voice, kiosk, automotive, AR, AI agents, folding devices), plus a deeper philosophy+psychology review lens.
   - `references/foundations.md` — typography, color (incl. color on Liquid Glass and brand color), Dark Mode, SF Symbols, materials, motion, layout by size class, icons, app icons.
   - `references/liquid-glass.md` — the 2025+ design language in depth: what changed in the 27 generation, guidance, APIs, adoption, accessibility.
   - `references/iphone-duo.md` — the foldable iPhone: two displays, poses and size classes, vertical controls, reserved regions, arrangement views, Split View, adoption APIs, a Duo review checklist.
   - `references/components.md` — tab bars, toolbars (incl. navigation bars), sidebars, search, menus, sheets, alerts, action sheets, buttons, snippets.
   - `references/patterns.md` — onboarding, loading, feedback, navigation models, search, settings, data entry, generative AI and Siri, common review rejections.
   - `references/platforms.md` — iOS, iPhone Duo, iPadOS, macOS, tvOS, visionOS, watchOS conventions and how to adapt across them.
   - `references/accessibility.md` — VoiceOver, Dynamic Type, contrast, Reduce Motion, the Liquid Glass slider, inclusion, privacy, right-to-left.

When reviewing an existing UI, work through the **Review checklist** at the end of this file for mechanics, then the philosophy+psychology lens in `references/applying.md` §5 for deeper reasoning failures. For anything that runs on iPhone, add the Duo checklist in `references/iphone-duo.md` §11.

## The core principles

Since June 2026 the HIG opens with eight **design principles** (the "Design principles" page and the WWDC26 session "Principles of great design"). They describe the product's relationship with the person. Apple frames them as aids for weighing competing priorities, not a formula with a single correct application. The summaries below are paraphrases; Apple's wording is on the Design principles page.

- **Purpose — give the product a real reason to exist.** Deliver real value, stay focused on it, and keep looking for a better route to the solution. *Test: can you say in one sentence what this is for?*
- **Agency — people stay in charge of how they work.** Don't obstruct, leave room to explore, and make mistakes recoverable. *Test: can the person steer, change their mind, and undo?*
- **Responsibility — put the person's interests first.** Be open about what the product does and why, and protect people's information. *Test: would anything here surprise the person if they saw exactly what it does?*
- **Familiarity — start from what people already understand.** Reuse known concepts, keep look and behavior consistent, and respond clearly to every action. *(Cognitive basis: Jakob's Law. `references/psychology.md` §D.)*
- **Flexibility — fit many situations, abilities, and devices.** Include everyone, keep people's place as things adapt, support each input method, and treat each platform as its own design problem. *Test: does it hold when the text size, the input, the window, or the device changes?*
- **Simplicity — say and show things plainly.** Only what is needed, few words, a clear order of importance. Apple is explicit that simple does not mean minimal.
- **Craft — sweat the details.** Quality shapes the first impression; try, test, and refine; release is not the end of the work.
- **Delight — give it warmth.** Decide what people should feel and design a few defining moments, but don't confuse decoration with delight.

The three classic pillars are still the fastest test of a single screen. They are the philosophy compressed (see `references/philosophy.md` §10 for how they descend from it, §12 for how they map to the eight) and the psychology applied (`references/psychology.md`):

- **Clarity.** Text is legible at every size, icons are precise, adornment is subtle, and function is obvious. The classic test: *if a button doesn't look like a button, it has failed clarity.*
- **Deference.** The UI helps people understand and interact with content but never competes with it. Minimize chrome; let the content fill the screen.
- **Depth.** Distinct visual layers and realistic motion convey hierarchy and a sense of place — where you came from, where you are, where you can go.

Two practical themes run through both sets:

- **Consistency.** Reuse the system's standard components, gestures, and patterns. Familiarity lowers cognitive load, speeds adoption, and reduces App Store rejections. Don't reinvent a control that already exists.
- **Hierarchy & harmony.** One primary action per screen, supporting elements subordinate, and software aligned with the hardware — corners, edges, the fold, and the platform's input model. *(Cognitive basis: Von Restorff and the limits of attention. `references/psychology.md` §C.)*

**How to use them together:** run a design past the eight principles first (is there a purpose, is the person in charge, is it honest, does it adapt?), then polish the screen against the pillars. When principles or guidelines conflict, return to the why: which choice is more honest, leaves the person more in control, and removes more of what isn't essential?

## The current design language: Liquid Glass

Liquid Glass is Apple's design language introduced at WWDC 2025 — the biggest visual overhaul since iOS 7 (2013) — spanning every platform from the 26 generation on. The 27 generation (September 2026) refined it rather than replacing it. **Design for it on any current Apple target.** Full detail in `references/liquid-glass.md`; the essentials:

- **What it is.** A translucent digital "meta-material" that reflects and refracts its surroundings and the content beneath it in real time, and responds to touch and device motion. It applies to buttons, switches, sliders, tab bars, sidebars, toolbars, notifications, the Dock, Control Center, alerts, panels, widgets, and app icons.
- **Two layers.** Glass is for the **functional layer**: controls and navigation floating above content. **Don't use Liquid Glass in the content layer**, and don't spread it across many custom controls. Over-application destroys the content/control distinction it exists to create.
- **Design system shifts that come with it.** A refined, more neutral palette; **bolder, left-aligned typography**; and *concentricity* — aligning the corner radii of UI elements with the rounded corners of the hardware and of their containers.
- **What iOS 27 changed.**
  - **People now set the look.** A Settings slider lets each person set Liquid Glass anywhere between nearly clear (the ultraclear end) and fully tinted. Design and test across the whole range; nothing may depend on seeing through the glass, or on the glass being opaque.
  - **Legibility over spectacle.** More uniform refraction, better contrast, sharper app icons.
  - **No opt-out.** `UIDesignRequiresCompatibility` is ignored when you build with the 27 SDKs. Every app on the current SDK is a Liquid Glass app.
  - **No new glass APIs.** Rebuild and the refinements apply.
- **Brand color goes in the content layer**, where it scrolls beneath the glass and the glass picks it up. On controls, use the accent color sparingly: primary actions and status.
- **Accessibility is automatic — if you use system components.** Liquid Glass respects Reduce Transparency (frostier/opaque), Increase Contrast (borders, flatter), Reduce Motion (no elastic response), and the user's slider setting. You get this for free with standard controls; you must handle it yourself for custom ones.
- **SwiftUI adoption.** `.glassEffect()`, `GlassEffectContainer` (to group and let shapes morph together), and `matchedGeometryEffect` for fluid morphing. Standard sheets/alerts/popovers adopt it automatically — **remove** custom `.presentationBackground()` and `UIBlurEffect` hacks so they don't fight the system. Use scroll-edge effects, not solid bar backgrounds.

## iPhone Duo

The foldable iPhone (announced September 9, 2026; iOS 27.1). It has a compact **outer display** used closed and a large **inner display** used open, with a hinge that allows many poses in between. Any iPhone app will be run on it, so treat it as part of designing for iPhone. Full detail, APIs, and a dedicated checklist: `references/iphone-duo.md`. The essentials:

- **One app that resizes.** Opening or closing the device is a resize, not a new screen. Same features, same state, same selection, same scroll position on both displays. Never tie a feature to a pose.
- **Two layouts, not six.** A compact-width layout (outer display) and a regular-width layout (inner display: regular width *and* regular height) cover every pose. Use the bigger space to show one more level of hierarchy, not a different app.
- **Design for the space, not the device.** Decide layout from size classes, safe areas, and layout margins. Never branch on device model or orientation; the inner display doesn't honor your supported orientations. Don't hard-code widths.
- **Vertical controls.** The outer display is wider and shorter than other iPhones, so the system puts the Dynamic Island, status bar, toolbar, and tab bar **on the side**, and keeps them there when the device opens in landscape (the inner display in portrait keeps horizontal bars). Standard bars do this automatically. Don't override the placement, give every toolbar item both a title and a symbol, and set visibility priority so the important items overflow last.
- **Hardware-aligned, so not mirrored.** The side controls stay on the same physical side in right-to-left languages. Safe areas are asymmetric; don't assume opposite insets match.
- **Reserved regions.** The camera cutouts and the folding region are described to your layout. Keep text and controls off them; let system components and arrangement views route around the fold.
- **Split View on iPhone.** Two apps, or two windows of your app, share the inner display. Your app will be shown at half width whether you planned for it or not.
- **Touch ID, not Face ID.** Ask the system which biometry is present; never hard-code "Face ID" in copy or icons.
- **Test in Xcode's Device Hub** across closed, open (wide and tall), partially folded, Split View, the largest text size, and a right-to-left language.

## How to apply the HIG (quick guidance)

**Typography** — Use the system fonts (San Francisco / New York) via the built-in **text styles** (Large Title, Title 1–3, Headline, Body, Callout, Subheadline, Footnote, Caption 1–2), never hardcoded point sizes. This gives you Dynamic Type for free. Line height ≥1.3× the font size; left-align body text; ~35–50 characters per line. Specs and the full Dynamic Type table: `references/foundations.md`.

**Color** — Use **semantic** system colors (`label`, `secondaryLabel`, `systemBackground`, `separator`, system tints like `systemBlue`) so everything adapts to Light/Dark Mode and accessibility settings automatically. Define custom colors as asset-catalog Color Sets with explicit light + dark variants — never hardcode hex. Blue = primary action, red = destructive; never reuse one color for two meanings; never rely on color alone (pair it with text, shape, or a symbol). Keep brand color in the content layer and off most controls.

**Iconography** — Prefer **SF Symbols** (over 7,000) to custom glyphs: they weight-match adjacent text, scale with Dynamic Type, and adapt to color modes for free. Use the standard symbol for a standard action. Filled variants in tab bars, outline in sidebars; in menus, icons sparingly and all-or-none within a group. For app icons, design a single centered glyph on a simple background and build it in **Icon Composer** (see `references/foundations.md`).

**Layout** — Minimum hit target **44×44pt** (the tappable area may extend beyond the visible control). Space on an ~8pt grid. The layout must fit the space it is given — no horizontal scrolling or pinch-zoom for primary content. **Let size classes drive layout, never the device model or orientation**, and keep functionality the same as the size class changes. Respect safe areas (they can be asymmetric). One primary action per screen.

**Motion** — Use system components so you inherit correct, consistent motion. Add custom motion only when it clarifies (fast and precise, ~100–500ms; reversible interactions reverse their animation). Never make motion the only channel for information, and always respect Reduce Motion (crossfade instead of slide, kill parallax/autoplay).

**Components & patterns** — Reach for the standard component before building a custom one; you inherit its accessibility, feedback, and platform behavior. Tab bars are for navigation, not actions: five or fewer on iPhone, **no overflow** (don't plan for a More tab), and every tab stays visible and enabled. Toolbars hold actions for the current screen: at most about three groups, one `.prominent` primary action on the trailing side. Search on iPhone is a search tab, a bottom toolbar field, or inline with content, in that order of prominence. On iPad, try a tab bar first; make it adaptable to a sidebar if you need more. Sheets handle self-contained subtasks; alerts are for critical info (Cancel is never the destructive button). Details in `references/components.md` and `references/patterns.md`.

**Intelligence (Siri AI and generative features)** — Expose your app's actions and content through App Intents so Siri can act in it; return a snippet for a glanceable result. For generative features: say where AI is used, leave the person in charge, ask before anything irreversible, put Edit / Undo / Retry next to generated output, give specific progress (name the step, such as "Checking your calendar…", rather than a generic "Working…"), and keep the app good without the AI. See `references/patterns.md` §Generative AI, Siri & snippets.

**Platform fit** — Don't replicate one platform's UI on another; **adapt** it. Translate the *intent* and use each platform's strengths (Live Activities on iOS, the second display and Split View on iPhone Duo, complications on watchOS, the menu bar and dense windows on macOS, immersive spaces on visionOS). See `references/platforms.md`.

**Accessibility** — Not an add-on. Every interactive element needs a meaningful VoiceOver label (especially icon-only buttons); layouts must survive the largest Dynamic Type setting without truncation; contrast ≥4.5:1 for normal text (3:1 for large), including over glass at both ends of the Liquid Glass slider; honor Reduce Motion and Reduce Transparency. Test with the Xcode Accessibility Inspector on real hardware. See `references/accessibility.md`.

## Review checklist

When reviewing or critiquing an interface against the HIG, check:

- [ ] **Purpose** — Can the screen's one job be stated in a sentence? Does everything on it serve that job?
- [ ] **Agency & responsibility** — Can people steer, change their mind, and undo? Is the product transparent about what it does with their data and on their behalf?
- [ ] **Clarity** — Is every interactive element obviously interactive? Is text legible at the default size and the largest accessibility size?
- [ ] **Hierarchy** — Is there exactly one primary action per screen, with supporting elements clearly subordinate?
- [ ] **System components** — Are standard controls used where they exist, rather than custom reinventions that break gestures/accessibility?
- [ ] **Typography** — System fonts via text styles (not hardcoded sizes)? Dynamic Type supported and tested at AX5?
- [ ] **Color** — Semantic/system colors that adapt to Dark Mode? No meaning carried by color alone? Contrast ≥4.5:1 (3:1 large)? Brand color in content, not spread across controls?
- [ ] **Icons** — SF Symbols (or properly weight-matched custom glyphs)? Standard symbols for standard actions? Filled in tab bars, outline in sidebars?
- [ ] **Hit targets** — ≥44×44pt for every tappable control?
- [ ] **Layout** — Driven by size classes, not device model or orientation? Fits the space (no horizontal scroll/zoom)? Respects safe areas? ~8pt spacing grid? No hard-coded widths?
- [ ] **Navigation** — Tab bar for navigation only, no overflow/More tab, tabs never hidden or disabled? Search in one clear place?
- [ ] **Motion** — Purposeful, fast, reversible? Reduce Motion respected? Never the sole information channel?
- [ ] **Modality** — Does Cancel ever destroy data without confirmation? (It must not.) Can the user always dismiss a modal?
- [ ] **Feedback** — Clear feedback at every stage (progress, success, error)? Do errors explain the next step rather than show a code?
- [ ] **Empty states** — Do they include a clear next action rather than a blank screen?
- [ ] **Platform fit** — Adapted to this platform's input model and conventions, not transplanted from another?
- [ ] **Liquid Glass** — On the control layer only, never in content? Legible at both ends of the Liquid Glass slider and with Reduce Transparency / Increase Contrast? Scroll-edge effects instead of solid bar backgrounds?
- [ ] **iPhone Duo** — Same features and state on both displays? Compact and regular layouts both designed? Side controls left where the system puts them, with titles and symbols on every item? Nothing interactive on the fold or a camera cutout? Works at half width in Split View? (Full list: `references/iphone-duo.md` §11.)
- [ ] **AI features** — Disclosed? Easy to correct, retry, and undo? Confirmation before irreversible actions? Still useful when the AI is off or unavailable?
- [ ] **Accessibility** — VoiceOver labels on all elements (incl. icon-only)? Tested with Accessibility Inspector?

## Apple's design resources & how to learn from them

Apple's Design hub (https://developer.apple.com/design/) is organized as **Overview → What's New → Get Started → Guidelines → Resources**. Use it as both a rulebook and a toolkit:

- **Design with the real materials, not redraws.** Download **Apple Design Resources** — official Figma and Sketch UI kits (iOS/iPadOS 27 and macOS 27 kits, plus product bezels for iPhone Duo), app-icon templates, color guides, and grids — so mockups use exact system metrics, components, and type. Use the SF Pro fonts (https://developer.apple.com/fonts/), the SF Symbols app, and Icon Composer for icons.
- **Preview on the real shapes.** Xcode's Device Hub previews layouts across devices and iPhone Duo poses.
- **Start from the Design Pathway** (Get Started) when ramping up — Apple's curated sequence of videos, docs, and resources for designing apps and games.
- **Study what Apple rewards.** The **Apple Design Award** winners and finalists, plus the **new design gallery**, are Apple's own examples of excellent, native-feeling design — review them to calibrate taste, not just rules.
- **Watch the design videos.** The WWDC25 set covers Liquid Glass and the design system; the WWDC26 set covers the design principles, brand, and search; the iPhone Duo Tech Talks cover folding layouts.
- **Treat the HIG as living.** It's updated through the year (June, then again in September 2026); re-check the *What's New* page and the relevant component/foundation pages rather than relying on memory for current specs.

## Key references (Apple)

- Apple Design hub: https://developer.apple.com/design/
- What's New in design: https://developer.apple.com/design/whats-new/
- Get Started / Design Pathway: https://developer.apple.com/design/get-started/
- HIG home: https://developer.apple.com/design/human-interface-guidelines
- Design principles: https://developer.apple.com/design/human-interface-guidelines/design-principles
- Designing for iPhone Duo: https://developer.apple.com/design/human-interface-guidelines/designing-for-iphone-duo
- Layout: https://developer.apple.com/design/human-interface-guidelines/layout
- All components: https://developer.apple.com/design/human-interface-guidelines/components/all-components
- Design tips: https://developer.apple.com/design/tips
- Apple Design Resources (Figma/Sketch templates, color guides): https://developer.apple.com/design/resources/
- New design gallery (Liquid Glass in real apps): https://developer.apple.com/design/new-design-gallery-2026/
- Apple Design Awards (study the winners): https://developer.apple.com/design/awards/
- Design video library: https://developer.apple.com/videos/design/
- Fonts / San Francisco: https://developer.apple.com/fonts/
- SF Symbols app: https://developer.apple.com/sf-symbols
- Icon Composer: https://developer.apple.com/icon-composer/
- Adopting Liquid Glass (technology overview): https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass
- "Principles of great design" (WWDC26 session 250): https://developer.apple.com/videos/play/wwdc2026/250/
- "Communicate your brand identity on iOS" (WWDC26 session 251): https://developer.apple.com/videos/play/wwdc2026/251/
- "Design intuitive search experiences" (WWDC26 session 292): https://developer.apple.com/videos/play/wwdc2026/292/
- "Meet Liquid Glass" (WWDC25 session 219): https://developer.apple.com/videos/play/wwdc2025/219/
- "Get to know the new design system" (WWDC25 session 356): https://developer.apple.com/videos/play/wwdc2025/356/
- "Design foundations from idea to interface" (WWDC25 session 359): https://developer.apple.com/videos/play/wwdc2025/359/
