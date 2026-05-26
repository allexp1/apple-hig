# Accessibility & inclusion

Apple's stance: **a truly great design is one everyone can use.** Accessibility is not a feature bolted on at the end — it's a baseline of quality. This file covers the support to build in, how to test it, and the inclusive-design and writing practices that go with it.

## Table of contents
- VoiceOver & labeling
- Dynamic Type
- Color & contrast
- Motion & transparency
- Touch targets & input
- Inclusion (broad needs)
- Privacy as respect
- Right-to-left & localization
- UX writing
- Testing
- Reference

## VoiceOver & labeling
- Every **interactive element needs a meaningful accessibility label** — especially icon-only buttons, which have no visible text to fall back on. "Add", "Share", "Close" — describe the action, not the glyph.
- Provide labels, hints, traits, and values so the screen reader conveys what something is, what it does, and its current state.
- Ensure a **logical reading/focus order**; group related elements so navigation is coherent.
- Use standard controls — they come with correct accessibility behavior for free; custom controls must re-create it.

## Dynamic Type
- Support the system text-size setting and **test at the largest accessibility sizes (up to AX5)**.
- Layouts must reflow without truncation or clipping — let text wrap and containers grow; avoid fixed-height text rows.
- Use the built-in text styles (Large Title → Caption) so scaling is automatic (see `references/foundations.md` § Typography).
- Note: macOS does not use Dynamic Type; honor Mac sizing conventions there.

## Color & contrast
- Meet contrast minimums: **4.5:1 for normal text, 3:1 for large text** and meaningful UI elements/glyphs.
- **Never use color as the only signal.** Pair it with text, shape, icon, or position so colorblind users aren't excluded (e.g. don't show status with red/green alone).
- Respect **Increase Contrast** and use semantic system colors that adapt to it and to Dark Mode.
- On translucent/Liquid Glass surfaces, verify text contrast explicitly — clear glass especially (see `references/liquid-glass.md`).

## Motion & transparency
- Honor **Reduce Motion**: replace large parallax, zoom, and elastic/spring animations with simple fades or cuts. Check `UIAccessibility.isReduceMotionEnabled` (or the SwiftUI `accessibilityReduceMotion` environment value).
- Honor **Reduce Transparency**: provide/allow more opaque backgrounds. System Liquid Glass does this automatically; custom materials must handle it.
- Keep essential motion subtle and purposeful; never gate critical information behind an animation a user has asked to suppress.

## Touch targets & input
- **44×44pt minimum** hit target on touch platforms, with adequate spacing between targets.
- Support every input the platform offers: keyboard navigation and shortcuts (macOS/iPadOS), Switch Control, Full Keyboard Access, Voice Control, pointer, Digital Crown, and the focus engine (tvOS). See `references/platforms.md`.
- Don't rely on a gesture as the *only* way to do something — provide a visible, focusable control too.

## Inclusion (broad needs)
Design for the full range of human variation — vision, hearing, motor, cognitive, speech, and situational/temporary limitations (bright sun, one free hand, a noisy room). Reduce required precision and memory load, keep flows simple and forgiving, and offer captions/transcripts for audio and video. Inclusive defaults help everyone, not only users with permanent disabilities.

## Privacy as respect
Privacy is part of designing respectfully:
- **Request access in context**, at the moment the feature needs it — not in a wall of prompts at launch.
- **Explain why** before the system prompt appears, so the choice is informed.
- Request the **minimum** necessary (e.g. "when in use" location, a single photo via the picker rather than full library access), and degrade gracefully if the user declines.

## Right-to-left & localization
- For Arabic, Hebrew, and other RTL languages, **mirror the layout** and **flip directional icons** (back/forward, progress, chevrons) — but do **not** flip things with intrinsic direction (clocks, media play controls, checkmarks).
- Leave room for text expansion across languages; never assume English string lengths.
- Use the system's localization and layout-direction APIs rather than hard-coding left/right.

## UX writing
- Be **clear, concise, and consistent**: plain language, consistent terminology, sentence-case where Apple uses it.
- Write **buttons as outcomes** ("Delete Draft", not "OK"); make destructive choices explicit.
- Error messages should say what happened and **what to do next**, without blame or jargon (see `references/patterns.md` § Feedback).

## Testing
- Use **Xcode's Accessibility Inspector** to audit labels, traits, contrast, and hit targets.
- **Test on real hardware** with VoiceOver on, Dynamic Type at AX5, Reduce Motion and Reduce Transparency enabled, and in Dark Mode and an RTL pseudolanguage.
- Treat accessibility issues as functional bugs, not polish.

## Reference
- HIG — Accessibility: https://developer.apple.com/design/human-interface-guidelines/accessibility
- HIG — Inclusion: https://developer.apple.com/design/human-interface-guidelines/inclusion
- HIG — Privacy: https://developer.apple.com/design/human-interface-guidelines/privacy
- HIG — Right to left: https://developer.apple.com/design/human-interface-guidelines/right-to-left
- Accessibility (developer hub): https://developer.apple.com/accessibility/
- Accessibility framework documentation: https://developer.apple.com/documentation/accessibility
