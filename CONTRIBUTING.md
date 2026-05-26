# Contributing

Thanks for your interest in improving **apple-hig**.

## What's especially welcome

- **HIG updates.** Apple revises the Human Interface Guidelines every cycle. PRs
  that correct a spec or reflect a new direction (with a link to Apple's current
  page) are the most valuable contribution.
- **New worked derivations.** The whole point of the skill is *deriving* design
  for surfaces the HIG never covered. New end-to-end derivations in
  `apple-hig/references/applying.md` (e.g. wearables, TV, industrial control,
  spatial/AR, conversational AI) are very welcome.
- **Sharper reasoning.** Tighter principle→rule→application chains in
  `philosophy.md` / `psychology.md`.

## Ground rules

1. **Never paste Apple's text verbatim.** Paraphrase and synthesize. Link to the
   authoritative Apple page instead of quoting it. This keeps the project clean
   on copyright and is also just better writing.
2. **Keep interpretation labeled as interpretation.** The philosophy lineage
   (Rams, Bauhaus, Norman) is substrate Apple draws on, not Apple's own words —
   say so where relevant, as the files already do.
3. **Match the house style.** Each reference file: `# Title` + one-line intro, a
   `## Table of contents` for long files, numbered `## N. Section`, bold
   lead-ins, concrete specs, do/don't framing, cross-references in backticks,
   and a closing `## Reference` list of Apple URLs.
4. **Keep `SKILL.md` lean.** It's a router. Depth lives in `references/`.
5. **Validate before opening a PR** (see below) — the `description` in
   `SKILL.md` frontmatter must stay under 1024 characters and the YAML must
   parse.

## Editing & re-packaging

The skill is the `apple-hig/` folder. To rebuild the distributable
`dist/apple-hig.skill` after edits, zip the folder so the archive contains a
top-level `apple-hig/` directory:

```bash
cd /path/to/repo
rm -f dist/apple-hig.skill
( cd . && zip -r dist/apple-hig.skill apple-hig -x '*.DS_Store' '*/__pycache__/*' )
```

If you have Anthropic's `skill-creator` available, you can validate + package
with its `package_skill` script instead, which checks the frontmatter for you.

## PRs

Small, focused PRs with a clear "why" are easiest to review. For substantive
changes to the philosophy/psychology framing, open an issue first so we can
discuss the angle.
