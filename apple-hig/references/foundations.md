# Foundations

The visual and structural building blocks of an Apple interface. Pull the section you need.

## Table of contents

1. [Typography](#1-typography)
2. [Color & Dark Mode](#2-color--dark-mode)
3. [SF Symbols](#3-sf-symbols)
4. [Interface icons](#4-interface-icons)
5. [App icons](#5-app-icons)
6. [Materials](#6-materials)
7. [Motion](#7-motion)
8. [Layout & hit targets](#8-layout--hit-targets)
9. [Images](#9-images)

---

## 1. Typography

### System fonts

Use Apple's system typefaces — they're optimized for legibility at every size, support Dynamic Type, and cover dozens of scripts.

- **San Francisco (SF)** — the system sans-serif.
  - **SF Pro** — default on iOS, iPadOS, macOS, tvOS. Optical sizing switches automatically between **SF Pro Text** (≤19pt) and **SF Pro Display** (≥20pt), adjusting spacing and details for the size.
  - **SF Compact** — narrower, used on watchOS.
  - **SF Pro Rounded** — softer, friendlier; for approachable or playful contexts.
  - **SF Mono** — monospaced, for code and aligned numerals; 6 weights.
  - **Script variants** — SF Arabic, SF Hebrew, SF Georgian, SF Armenian, etc., so the system covers many writing systems consistently.
- **New York (NY)** — the system serif, for editorial/reading contexts. Pairs with SF.

**Weights (9):** Ultralight (100), Thin (200), Light (300), Regular (400), Medium (500), Semibold (600), Bold (700), Heavy (800), Black (900).

**On the web / cross-platform**, reach the system fonts with CSS generic families: `system-ui` (SF/Segoe/Roboto per OS), `ui-rounded`, `ui-serif`, `ui-monospace`.

### Use text styles, not hardcoded sizes

Build text from the system **text styles** rather than fixed point sizes. The OS then scales them with the user's Dynamic Type setting automatically, and you stay consistent with the platform.

**iOS Dynamic Type styles at the default (Large) setting** — `[size pt / weight]`:

| Style | Size | Weight |
|---|---|---|
| Large Title | 34 | Regular |
| Title 1 | 28 | Regular |
| Title 2 | 22 | Regular |
| Title 3 | 20 | Regular |
| Headline | 17 | Semibold |
| Body | 17 | Regular |
| Callout | 16 | Regular |
| Subheadline | 15 | Regular |
| Footnote | 13 | Regular |
| Caption 1 | 12 | Regular |
| Caption 2 | 11 | Regular |

### Dynamic Type scale

iOS exposes **12 sizes total**: 7 standard (xSmall → xxxLarge) plus **5 Larger Accessibility Sizes** (AX1–AX5). At AX5, Body scales up to roughly **310%** of its default. **Always test at AX5** — layouts must reflow without truncation or overlap.

- Custom fonts can scale with Dynamic Type via **`UIFontMetrics`** (iOS 11+) — wrap your font so it tracks the user's setting.
- **macOS** supports text styles but does **not** have Dynamic Type; users adjust via system settings and per-app preferences instead.

### Typographic rules of thumb

- Minimum font size **11pt** (avoid going smaller for legibility).
- Line height **≥1.3×** the font size for comfortable reading.
- **Left-align** body text in LTR languages; avoid justified text (uneven spacing hurts legibility).
- Aim for **~35–50 characters per line**.
- Match SF Symbol weight to adjacent text weight (see SF Symbols below).
- Limit the number of typefaces and weights on a screen; let weight and size — not many fonts — create hierarchy.

---

## 2. Color & Dark Mode

### Use semantic system colors

Don't hardcode colors. Use the system's **semantic** colors, which automatically adapt to Light/Dark Mode, vibrancy, and accessibility contrast settings.

- **Label hierarchy (text):** `label` (primary), `secondaryLabel`, `tertiaryLabel`, `quaternaryLabel` — progressively lower contrast for less-important text.
- **Backgrounds:** `systemBackground` (+ `secondarySystemBackground`, `tertiarySystemBackground`); `systemGroupedBackground` for grouped tables.
- **Structure:** `separator`, `opaqueSeparator`, `link`.
- **macOS additions:** `controlColor`, `labelColor`, `windowBackgroundColor`, etc.
- **System tints:** `systemBlue`, `systemGreen`, `systemRed`, `systemOrange`, `systemYellow`, `systemPurple`, `systemPink`, `systemTeal`, `systemIndigo`, `systemGray` (1–6). These are tuned per platform/mode — not pure RGB primaries.

### Color meaning

- **Blue** — the default tint and primary/affirmative action.
- **Red** — destructive or error.
- **Green** — success/go (and the standard "accept call" color).
- Never reuse a single color for two different meanings in one app.
- Don't pick colors by personal taste alone — choose for meaning, contrast, and adaptability.

### Color on Liquid Glass, and brand color

- **Liquid Glass has no color of its own.** It takes color from the content behind it; symbols and text on small glass elements (toolbars, tab bars) are monochrome by default and flip light/dark with what is underneath.
- **Tint glass sparingly.** Reserve color for what needs emphasis: a primary action or a status indicator. To emphasize a primary action, color the **background** of the control, not its symbol or text.
- **Colorful content behind? Keep control labels different from it**, or leave them monochrome.
- **Brand color belongs in the content layer** (September 2026 Branding guidance). Use the accent color with restraint: minimize it on controls, keep it for primary actions and status (an unread badge, the selected tab). Put the brand in the content, where it scrolls beneath the glass and the glass picks it up.
- Brand lives in voice, a custom headline font (if it stays legible and supports Dynamic Type and Bold Text), and content, not in logos repeated across screens or a branded launch screen.

### Custom colors

Define custom colors as **Color Sets in the asset catalog** with explicit **Light** and **Dark** (and optionally High-Contrast) variants. Reference them by name. Never hardcode a single hex value that can't adapt. Support **wide-gamut Display P3** where it helps, with an sRGB fallback.

### Contrast

- **Normal text:** minimum **4.5:1** (WCAG AA). Aim for **7:1** for small or custom-colored text.
- **Large text (≥18pt, or ≥14pt bold):** minimum **3:1**.
- **Never use color as the only signifier.** Pair it with text, an SF Symbol, shape, or position so colorblind users and high-contrast modes still get the message.

### Dark Mode

- Systemwide; **respect the user's choice** — do not build an in-app Light/Dark toggle that overrides the system (it fragments the experience and surprises users). The OS-level setting is the source of truth.
- "Lights dimmed, not inverted." Dark Mode is a carefully tuned dark palette, not a color inversion.
- **Soften pure-white backgrounds** so they don't glow against dark surroundings; use elevated dark grays for layered surfaces.
- Use **vibrancy** (system materials) so foreground content stays legible over blurred backgrounds.
- SF Symbols and system views adapt automatically. **Test both modes.**

> Apple's aesthetic is primarily **flat** (color, translucency, and depth via layering/blur), in contrast to Google Material's heavier use of drop shadows and elevation surfaces.

---

## 3. SF Symbols

A library of **over 7,000** Apple-designed symbols, designed to integrate seamlessly with San Francisco. The 2026 release (labeled SF Symbols 8 in beta) adds new symbols, which appear in apps running the 27 OS generation, and **Enhanced Search**: describe what you need in plain words and the app finds matching symbols.

### Why prefer SF Symbols

- **Weight-match** the text next to them (9 weights mirror the SF font weights), so an icon beside Body text looks like it belongs.
- **Scale** with Dynamic Type automatically.
- **Adapt** to color modes and accessibility settings.
- **Vector** — render crisply at any resolution; no need to ship multiple raster sizes.

### Weights & scales

- **9 weights:** Ultralight → Black, matching the SF font weights. Set the symbol's weight to match adjacent text.
- **3 scales:** Small, **Medium (default)**, Large — defined relative to the surrounding text's cap height, so the symbol sits correctly on the baseline.
  - SwiftUI: `.imageScale(.small/.medium/.large)`; UIKit: `UIImage.SymbolScale`; AppKit: `NSImage.SymbolConfiguration`.

### Rendering modes (4)

- **Monochrome** — one color throughout (template tint).
- **Hierarchical** — a single hue with opacity-graded layers for a sense of depth.
- **Palette** — 2–3 colors you choose, applied to defined layers.
- **Multicolor** — the symbol's own intrinsic colors (e.g., a yellow star, red heart). Falls back gracefully.

### Animation and color features (since SF Symbols 7)

- **Draw animations** — Draw On / Draw Off, with playback by Whole Symbol, By Layer, or Individually.
- **Variable Draw** — show progress/partial state along a symbol's path.
- **Variable Color** — drive a value (e.g., signal strength, volume) across layers.
- **Enhanced Magic Replace** — smarter transitions between related symbols.
- **Gradients** — automatic gradient generation from a base color.

### Working with symbols

- Some symbols representing **Apple products/technologies are non-customizable** (marked with an Info badge) — don't restyle them.
- **Annotating** assigns a color or hierarchical level to each layer of a custom symbol.
- For custom needs, create symbols in the **SF Symbols app** using a template so they inherit weights/scales/alignment.
- **Use the standard symbol for a standard action** (Share, Search, Delete, Back, Close). The HIG lists them under Icons › Standard icons; people already know what they mean.
- In toolbars, prefer symbols **without** enclosing borders (no circle variants): the glass section is the container.
- App: https://developer.apple.com/sf-symbols

---

## 4. Interface icons

Custom in-app glyphs (template images, toolbar/tab glyphs) that aren't covered by SF Symbols:

- Author as **vector (PDF or SVG)** so they auto-scale across resolutions; if you must ship PNG, provide @1x/@2x/@3x sizes.
- Design as **template images** (a single-color silhouette) when you want the system to tint them with the current accent/semantic color.
- Keep them simple, recognizable at small sizes, and visually consistent in weight with SF Symbols.
- Provide **RTL-flipped** versions for directional icons where reading direction matters (see accessibility/right-to-left).

---

## 5. App icons

The single most important piece of custom art in an app. The workflow changed in 2025 (iOS 26: layered Liquid Glass icons, Icon Composer) and was refined in 2026 (the 27 generation renders icons sharper and more defined; the App icons page was updated June 2026).

### The unified template & Icon Composer

- A single **1024×1024px square** master is the source for iOS, iPadOS, and macOS (watchOS uses **1088px**). The system applies the platform-appropriate mask (rounded-rectangle, circle on watchOS, etc.) — **don't pre-round corners or add the mask yourself.**
- Build the icon in **Icon Composer** (Xcode ▸ Open Developer Tool ▸ Icon Composer, or the free standalone Mac app):
  - Import **layered artwork** — SVG preferred (or PNG) — separated into foreground / mid / background layers. **Convert text to outlines.** Do **not** bake in shadows, highlights, or gradients; the system generates lighting.
  - Apply the **Liquid Glass material** (toggle), and tune fill, opacity, blend, specular highlights, neutral/chromatic shadows, blur, and translucency.
  - Use **Refraction** (current Icon Composer) to let a layer pick up color and shape from the layers behind it.
  - Preview dynamic lighting across platforms (iPhone, iPad, Mac, Apple Watch) and appearance modes.
  - Export a single **`.icon` file**; Xcode generates every required variant, plus a flattened marketing PNG. Existing `.icon` files get the sharper 27-generation material without changes.
- **Layer craft (HIG):** clearly defined edges on foreground shapes (no soft, feathered edges); vary opacity between foreground layers for depth; prefer vector (SVG/PDF) layers; let the system add highlights, shadows, and blur.

### Appearance modes (up to 6 variants)

Default, **Dark**, **Clear** (Light/Dark), **Tinted** (Light/Dark), and **Mono**. The system composites these from your layers — design so the glyph reads in all of them. **Keep the icon's features the same across appearances**; don't swap elements in and out per variant. Alternate app icons need their own dark, clear, and tinted variants.

### Specs & still-required assets

- **Wide-gamut Display P3** supported, with **sRGB fallback**.
- The **Single-Size approach** (Xcode 14+) lets you provide one 1024 icon for iOS; **macOS still needs individual sizes** generated.
- A **1024×1024 PNG** in the AppIcon set is **still required for App Store submission**.

### Design guidance

- A **single, centered glyph** on a **simple background**. One clear idea.
- **Avoid text** (the app name is already shown beneath the icon), photos, and screenshots.
- Ensure it reads at small sizes — **preview at 60×60px** (Home Screen size).
- Keep it consistent with the brand but legible and uncluttered.
- Templates: Apple Design Resources (https://developer.apple.com/design/resources/).

---

## 6. Materials

System **materials** are translucent background layers that blur and tint what's behind them, with **vibrancy** that keeps foreground content legible.

- Variants range **thin → thick** (more blur/opacity as they thicken): e.g., ultraThin, thin, regular, thick, plus chrome materials.
- **Toolbars and bars adopt translucency automatically** over scrolling content — an iOS toolbar is translucent by default and drops its material when content scrolls to the bottom.
- Use materials to **separate layers and establish depth**, not as decoration.
- **Respect Reduce Transparency** — materials become more opaque/frosted when the user enables it (handled automatically for system components).
- In iOS 26+, materials are unified under the **Liquid Glass** system (see `references/liquid-glass.md`). Two layers, two materials: **Liquid Glass for the functional layer** (controls, navigation) and **standard materials for the content layer**. Don't put Liquid Glass in content.
- From the 27 generation people set how clear or tinted Liquid Glass is (a Settings slider). Treat transparency as a variable you don't control.

---

## 7. Motion

### Principles

- **Use system components** so you inherit correct, consistent, accessible motion automatically.
- **Be purposeful.** Motion should clarify hierarchy, give feedback, or maintain a sense of place — not decorate. Gratuitous motion distracts and can cause discomfort or nausea.
- **Never the sole channel.** Don't convey essential information through motion alone; supplement with text, haptics, or audio.
- **Strive for realism and credibility.** Reversible interactions reverse their motion: if a panel slides down to appear, it slides up to dismiss.
- **Fast and precise.** The research sweet spot is roughly **100–500ms**; too slow feels sluggish, too fast feels jarring.

### Reduce Motion

When the user enables **Reduce Motion**, your app must respond — this is **not** automatic for custom animations:

- Check `UIAccessibility.isReduceMotionEnabled` (UIKit) or `@Environment(\.accessibilityReduceMotion)` (SwiftUI).
- Replace slides/zooms with **crossfades**; minimize or remove **parallax**; **don't autoplay** video/animation.
- Liquid Glass drops its elastic/liquid response automatically for system components.

### Things to avoid

- Oscillating/flashing motion near **~0.2 Hz** (a known trigger for discomfort).
- In **visionOS**: head-locked content combined with rapid camera motion, and large fly-in animations that fill the field of view.

---

## 8. Layout & hit targets

### Hit targets

- **Minimum 44×44pt** for any tappable control. The **tappable region may extend beyond the visible artwork** — a 24pt icon can still have a 44pt touch area via padding.
- This is a guideline, not a hard law, but going below 44pt without good reason fails accessibility review.
- Cross-platform reference points: **Apple 44×44pt**, Google Material **48×48dp**, WCAG **2.5.5 (AAA) 44px** / **2.5.8 (AA) 24px**.

### Spacing & grid

- Space elements on an **~8pt grid** (8/16/24…) for rhythm and consistency.
- **Align** related elements to show their relationship; use alignment (not boxes) to group.

### Adaptivity

- The layout must **fit the screen** — no horizontal scrolling or pinch-zoom for primary content.
- **Let size classes drive layout, never the device model or orientation** (HIG Layout, September 2026). A size class describes the space you actually have; device model and orientation do not. The HIG no longer publishes per-device dimension tables. Don't hard-code screen widths.
- **Consider every size-class combination**, in both portrait and landscape proportions. An iPhone Duo is compact outside and regular × regular inside; an iPad window can be anything.
- **Keep functionality the same as the size class changes.** Show more or less of it; never remove features because the space is small.
- Use **Auto Layout / SwiftUI layout** to adapt across devices, window sizes, split views, and Dynamic Type sizes.
- **Respect safe areas** (notch, Dynamic Island, Home indicator, rounded corners, sidebars), and don't assume opposite insets are equal: on iPhone Duo the controls sit on one side.
- **Reserved regions (iOS 27.1)** describe camera cutouts and the folding region so layouts can route around them. Text and controls stay off them; a full-bleed image may cross. See `references/iphone-duo.md` §5.
- Account for **concentricity** under Liquid Glass: align element corner radii with their container and the device's corners.
- **Differentiate controls from content** with the glass layer and a scroll-edge effect, not with a solid bar background. Extend content to the edges, under sidebars and bars.
- **Preview at the extremes first**: the smallest and largest layouts, then localizations and text sizes. Xcode's Device Hub previews across devices and iPhone Duo poses.

### Composition

- **One primary action per screen.** Make it visually dominant; subordinate everything else.
- Let **content fill the viewport**; bring controls in **contextually** rather than permanently crowding the chrome.
- Don't stack redundant navigation (e.g., nav bar + toolbar + custom tab bar + floating action button all at once).

---

## 9. Images

- Display images at their **intended aspect ratio**; never stretch or squash (distortion is a common, easily-caught flaw).
- Provide resolution variants (**@1x/@2x/@3x**) or use vector/SF Symbols so art stays crisp on every display.
- Support **Dark Mode** variants where an image needs to differ between appearances (asset catalog).
- Respect safe areas and let key subjects survive masking/cropping across devices.
