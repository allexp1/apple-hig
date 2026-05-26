---
name: apple-hig
description: Apple's Human Interface Guidelines (HIG) plus the design philosophy and cognitive psychology beneath them. A working reference and a reasoning method. Use when designing, reviewing, or building an interface for any Apple platform (iOS, iPadOS, macOS, watchOS, tvOS, visionOS), when applying Apple-style design to web/cross-platform UI, or when deriving Apple-grade design for an interface the HIG never covered (voice/audio, kiosks, automotive, AR/spatial, AI agents). Covers the philosophy (design-is-how-it-works, the Rams/Bauhaus lineage, deference, honesty, subtraction), the psychology (Fitts, Hick, Miller, Jakob, Doherty, Gestalt, peak-end, error theory) explaining why the rules work, and the rules themselves (clarity/deference/depth, Liquid Glass for iOS 26 / macOS Tahoe 26, typography, color, SF Symbols, motion, layout, accessibility). Trigger for "make this look like an Apple app," "follow the HIG," "design an iOS screen," or "design a voice/kiosk/car/AI interface the way Apple would."
license: MIT (see LICENSE). Apple and related names are trademarks of Apple Inc.; this is an independent, unaffiliated reference (see NOTICE).
---

# Apple Human Interface Design

Apple's Human Interface Guidelines (HIG) are the canonical rulebook for designing software that feels native on Apple platforms. But the rules are only the surface. Beneath them is a **philosophy** (a worldview about what design is and whom it serves) and a **psychology** (how human perception, memory, attention, and motivation actually work). This skill gives you all three layers — the why, the what, and a method for applying them:

- **The why** — `references/philosophy.md` and `references/psychology.md`. Learn these and you can *derive* good design, not just recall rules.
- **The what** — concrete specs (sizes, weights, colors, components, the current visual language) in the reference files.
- **The method** — `references/applying.md` turns the why into a repeatable process and extends it to interfaces the HIG never covered (voice/audio, kiosks, automotive, AR, AI agents). Apple's rules are *instances* of deeper principles applied to Apple's screens; on a new surface you re-derive from the same roots rather than copying the shapes.

## How to use this skill

1. **For the reasoning behind any decision, start with the why** — `references/philosophy.md` (values) and `references/psychology.md` (cognition). These resolve most design questions and let you justify or defend a choice.
2. **Start with the principles below** — the compressed version of that why — they decide most design questions on Apple platforms.
3. **Apply the current design language** (Liquid Glass) for anything targeting iOS 26 / macOS Tahoe 26 and later.
4. **To design something new — especially a non-Apple or non-screen interface — use the method** in `references/applying.md` (a 7-step first-principles process + cross-modality translation + worked examples).
5. **Pull exact specs from the reference files** when you need numbers, component rules, or platform details. Load only the file you need:
   - `references/philosophy.md` — the worldview: design-is-how-it-works, the Bauhaus/Rams lineage, simplicity-as-subtraction, deference, honesty, coherence, craft, accessibility/defaults as ethics, and how the three pillars descend from all of it.
   - `references/psychology.md` — the cognitive science that explains why the rules work: Fitts, Hick, Miller, Jakob, Doherty, Gestalt, Von Restorff, serial position, aesthetic-usability, mental models, affordances/signifiers, error theory, recognition-over-recall, goal-gradient, peak-end, emotional design, attention, trust.
   - `references/applying.md` — the generative method: deriving Apple-grade design for any human/machine interface (incl. voice, kiosk, automotive, AR, AI agents), plus a deeper philosophy+psychology review lens.
   - `references/foundations.md` — typography, color, Dark Mode, SF Symbols, materials, motion, layout, icons, app icons.
   - `references/liquid-glass.md` — the 2025+ design language in depth (APIs, adoption, accessibility).
   - `references/components.md` — tab bars, navigation bars, toolbars, sidebars, sheets, alerts, action sheets, buttons, modality.
   - `references/patterns.md` — onboarding, loading, feedback, navigation models, search, settings, data entry, common review rejections.
   - `references/platforms.md` — iOS, iPadOS, macOS, tvOS, visionOS, watchOS conventions and how to adapt across them.
   - `references/accessibility.md` — VoiceOver, Dynamic Type, contrast, Reduce Motion, inclusion, privacy, right-to-left.

When reviewing an existing UI, work through the **Review checklist** at the end of this file for mechanics, then the philosophy+psychology lens in `references/applying.md` §5 for deeper reasoning failures.

## The core principles

Every HIG decision traces back to three principles. They are the philosophy compressed (see `references/philosophy.md` §10 for how they descend from it) and the psychology applied (see `references/psychology.md`). When two guidelines seem to conflict, the one that better serves these wins — and when *they* seem to conflict, return to the why: which choice is more honest, defers more to the user's goal, and removes more of what isn't essential?

- **Clarity.** Text is legible at every size, icons are precise, adornment is subtle, and function is obvious. The classic test: *if a button doesn't look like a button, it has failed clarity.* Negative space, color, fonts, and graphics exist to highlight content and convey interactivity — not to decorate.
- **Deference.** The UI helps people understand and interact with content but never competes with it. Minimize chrome; let the content fill the screen. Translucency and subtle motion hint at what's underneath without stealing focus.
- **Depth.** Distinct visual layers and realistic motion convey hierarchy, give vitality, and aid understanding. Transitions provide a sense of place — where you came from, where you are, where you can go.

Two more themes run throughout the HIG and matter just as much in practice:

- **Consistency.** Reuse the system's standard components, gestures, and patterns. Familiarity lowers cognitive load, speeds adoption, and reduces App Store rejections. Don't reinvent a control that already exists. *(Cognitive basis: Jakob's Law — users' mental models are trained on other apps. `references/psychology.md` §D.)*
- **Hierarchy & harmony.** Establish a clear visual hierarchy on every screen (one primary action; supporting elements subordinate), and align the software with the hardware — corners, edges, and the platform's input model. *(Cognitive basis: Von Restorff and the limits of attention. `references/psychology.md` §C.)*

## The current design language: Liquid Glass

Liquid Glass is Apple's design language introduced at WWDC 2025 — the biggest visual overhaul since iOS 7 (2013). It spans iOS 26, iPadOS 26, macOS Tahoe 26, watchOS 26, tvOS 26, and visionOS 26. **Design for it on any current Apple target.** Full detail in `references/liquid-glass.md`; the essentials:

- **What it is.** A translucent digital "meta-material" that reflects and refracts its surroundings and the content beneath it in real time, dynamically bends light, and behaves like a lightweight liquid — responding to touch and device motion with ripples and specular highlights. It applies to buttons, switches, sliders, tab bars, sidebars, toolbars, notifications, the Dock, Control Center, alerts, panels, widgets, and app icons.
- **Design system shifts that come with it.** A refined, more neutral palette; **bolder, left-aligned typography**; and *concentricity* — aligning the corner radii of UI elements with the rounded corners of the hardware and of their containers.
- **Keep the hierarchy.** Glass is for the control/navigation layer floating above content. Don't glass everything — over-application destroys the content/control distinction it's meant to create, and carries real performance and legibility costs.
- **Accessibility is automatic — if you use system components.** Liquid Glass respects Reduce Transparency (turns frostier/opaque), Increase Contrast (adds borders, flattens), and Reduce Motion (drops the elastic/liquid response). You get this for free with standard controls; you must handle it yourself for custom ones.
- **SwiftUI adoption.** `.glassEffect()`, `GlassEffectContainer` (to group and let shapes morph together), and `matchedGeometryEffect` for fluid morphing. In Xcode 26, standard sheets/alerts/popovers adopt it automatically — **remove** custom `.presentationBackground()` and `UIBlurEffect` hacks so they don't fight the system.

## How to apply the HIG (quick guidance)

**Typography** — Use the system fonts (San Francisco / New York) via the built-in **text styles** (Large Title, Title 1–3, Headline, Body, Callout, Subheadline, Footnote, Caption 1–2), never hardcoded point sizes. This gives you Dynamic Type for free. Line height ≥1.3× the font size; left-align body text; ~35–50 characters per line. Specs and the full Dynamic Type table: `references/foundations.md`.

**Color** — Use **semantic** system colors (`label`, `secondaryLabel`, `systemBackground`, `separator`, system tints like `systemBlue`) so everything adapts to Light/Dark Mode and accessibility settings automatically. Define custom colors as asset-catalog Color Sets with explicit light + dark variants — never hardcode hex. Blue = primary action, red = destructive; never reuse one color for two meanings; never rely on color alone (pair it with text, shape, or a symbol).

**Iconography** — Prefer **SF Symbols** (6,900+ in v7) over custom glyphs: they weight-match adjacent text, scale with Dynamic Type, and adapt to color modes for free. Use filled variants in tab bars, outline in sidebars. For app icons, design a single centered glyph on a simple background and build it in **Icon Composer** (see `references/foundations.md`).

**Layout** — Minimum hit target **44×44pt** (the tappable area may extend beyond the visible control). Space on an ~8pt grid. The layout must fit the screen — no horizontal scrolling or pinch-zoom for primary content. Use Auto Layout / SwiftUI / size classes to adapt across devices, orientations, and text sizes. Respect safe areas. One primary action per screen.

**Motion** — Use system components so you inherit correct, consistent motion. Add custom motion only when it clarifies (fast and precise, ~100–500ms; reversible interactions reverse their animation). Never make motion the only channel for information, and always respect Reduce Motion (crossfade instead of slide, kill parallax/autoplay).

**Components & patterns** — Reach for the standard component before building a custom one; you inherit its accessibility, feedback, and platform behavior. Tab bars are for navigation (≤5 top-level destinations on iPhone), not actions; toolbars hold actions for the current screen; sheets handle self-contained subtasks; alerts are for critical info (Cancel is never the destructive button). Details in `references/components.md` and `references/patterns.md`.

**Platform fit** — Don't replicate one platform's UI on another; **adapt** it. A macOS sidebar becomes an iPhone tab bar; translate the *intent* and use each platform's strengths (Live Activities on iOS, complications on watchOS, the menu bar and dense windows on macOS, immersive spaces on visionOS). See `references/platforms.md`.

**Accessibility** — Not an add-on. Every interactive element needs a meaningful VoiceOver label (especially icon-only buttons); layouts must survive the largest Dynamic Type setting without truncation; contrast ≥4.5:1 for normal text (3:1 for large); honor Reduce Motion and Reduce Transparency. Test with the Xcode Accessibility Inspector on real hardware. See `references/accessibility.md`.

## Review checklist

When reviewing or critiquing an interface against the HIG, check:

- [ ] **Clarity** — Is every interactive element obviously interactive? Is text legible at the default size and the largest accessibility size?
- [ ] **Hierarchy** — Is there exactly one primary action per screen, with supporting elements clearly subordinate?
- [ ] **System components** — Are standard controls used where they exist, rather than custom reinventions that break gestures/accessibility?
- [ ] **Typography** — System fonts via text styles (not hardcoded sizes)? Dynamic Type supported and tested at AX5?
- [ ] **Color** — Semantic/system colors that adapt to Dark Mode? No meaning carried by color alone? Contrast ≥4.5:1 (3:1 large)?
- [ ] **Icons** — SF Symbols (or properly weight-matched custom glyphs)? Filled in tab bars, outline in sidebars?
- [ ] **Hit targets** — ≥44×44pt for every tappable control?
- [ ] **Layout** — Fits the viewport (no horizontal scroll/zoom)? Adapts across devices/orientations? Respects safe areas? ~8pt spacing grid?
- [ ] **Motion** — Purposeful, fast, reversible? Reduce Motion respected? Never the sole information channel?
- [ ] **Modality** — Does Cancel ever destroy data without confirmation? (It must not.) Can the user always dismiss a modal?
- [ ] **Feedback** — Clear feedback at every stage (progress, success, error)? Do errors explain the next step rather than show a code?
- [ ] **Empty states** — Do they include a clear next action rather than a blank screen?
- [ ] **Platform fit** — Adapted to this platform's input model and conventions, not transplanted from another?
- [ ] **Liquid Glass** — Applied to the control layer only, not over content? Hierarchy preserved? Accessibility settings respected?
- [ ] **Accessibility** — VoiceOver labels on all elements (incl. icon-only)? Tested with Accessibility Inspector?

## Apple's design resources & how to learn from them

Apple's Design hub (https://developer.apple.com/design/) is organized as **Overview → What's New → Get Started → Guidelines → Resources**. Use it as both a rulebook and a toolkit:

- **Design with the real materials, not redraws.** Download **Apple Design Resources** — official Figma and Sketch UI kits, app-icon templates (Sketch/Photoshop/Illustrator), color guides, and grids — so mockups use exact system metrics, components, and type. Use the SF Pro fonts (https://developer.apple.com/fonts/), the SF Symbols app, and Icon Composer for icons.
- **Start from the Design Pathway** (Get Started) when ramping up — Apple's curated sequence of videos, docs, and resources for designing apps and games.
- **Study what Apple rewards.** The **Apple Design Award** winners and finalists, plus the **new design gallery**, are Apple's own examples of excellent, native-feeling design — review them to calibrate taste, not just rules.
- **Watch the design videos.** The WWDC design sessions (esp. the 2025 set on Liquid Glass, the new design system, app icons, and design foundations) are the most authoritative source on current direction.
- **Treat the HIG as living.** It's updated each cycle; re-check the *What's New* page and the relevant component/foundation pages rather than relying on memory for current specs.

## Key references (Apple)

- Apple Design hub: https://developer.apple.com/design/
- What's New in design: https://developer.apple.com/design/whats-new/
- Get Started / Design Pathway: https://developer.apple.com/design/get-started/
- HIG home: https://developer.apple.com/design/human-interface-guidelines
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
- "Meet Liquid Glass" (WWDC25 session 219): https://developer.apple.com/videos/play/wwdc2025/219/
- "Get to know the new design system" (WWDC25 session 356): https://developer.apple.com/videos/play/wwdc2025/356/
- "Design foundations from idea to interface" (WWDC25 session 359): https://developer.apple.com/videos/play/wwdc2025/359/
