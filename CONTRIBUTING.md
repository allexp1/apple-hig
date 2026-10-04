# Contributing

Thanks for your interest in improving **apple-hig**.

## What's especially welcome

- **HIG updates.** Apple revises the Human Interface Guidelines through the
  year, not only at WWDC. PRs that correct a spec or reflect a new direction
  (with a link to Apple's current page) are the most valuable contribution.
- **New worked derivations.** The whole point of the skill is *deriving* design
  for surfaces the HIG never covered. New end-to-end derivations in
  `apple-hig/references/applying.md` (e.g. wearables, TV, industrial control,
  spatial/AR, conversational AI) are very welcome.
- **Sharper reasoning.** Tighter principle→rule→application chains in
  `philosophy.md` / `psychology.md`.

## Ground rules

1. **Never paste Apple's text verbatim.** Paraphrase and synthesize. Link to the
   authoritative Apple page instead of quoting it. This keeps the project clean
   on copyright and is also just better writing. Names are fine: principle
   names, page and session titles, API symbols, product terms.
2. **Source every Apple fact.** A date, a number, a rule, an API name: link the
   Apple page it came from. If you worked a value out yourself (a point size
   from a pixel size, say), mark it *(derived)*. If only a secondary source
   reports it, say so or leave it out.
3. **Keep interpretation labeled as interpretation.** The philosophy lineage
   (Rams, Bauhaus, Norman) is substrate Apple draws on, not Apple's own words —
   say so where relevant, as the files already do.
4. **Match the house style.** Each reference file: `# Title` + one-line intro, a
   `## Table of contents` for long files, numbered `## N. Section`, bold
   lead-ins, concrete specs, do/don't framing, cross-references in backticks,
   and a closing `## Reference` list of Apple URLs.
5. **Keep `SKILL.md` lean.** It's a router. Depth lives in `references/`.
6. **Don't renumber `philosophy.md`.** Other files cite its sections by number
   (§8, §9, §10, §12). Add new sections at the end.
7. **Validate before opening a PR** (see below) — the `description` in
   `SKILL.md` frontmatter must stay under 1024 characters and the YAML must
   parse.

## Editing & re-packaging

The skill is the `apple-hig/` folder. After any edit, run:

```bash
bash scripts/build.sh
```

It checks the frontmatter (name, version, description length), checks that the
version in `apple-hig/SKILL.md` matches `package.json` and has an entry in
`CHANGELOG.md`, re-baselines `apple-hig/.living/ORIGINAL.sha256`, and rebuilds
`dist/apple-hig.skill` (a zip with a top-level `apple-hig/` directory). Commit
the hash and the rebuilt package with your change.

`bash scripts/build.sh --check` runs the same checks without writing anything.

To try the result as a user would:

```bash
node bin/install.js --dry-run   # what the npx installer would do
./install.sh --project          # a real install into ./.claude/skills
```

If you have Anthropic's `skill-creator` available, you can also validate with
its `package_skill` script, which checks the frontmatter for you.

## Changing the guidance

For any change in what the skill tells people to do:

1. Bump `version` in `apple-hig/SKILL.md` **and** in `package.json` (they must
   match). Patch for corrections, minor for new guidance, major for a new OS
   generation or a restructure.
2. Add an entry to `CHANGELOG.md`, with a "Corrections" line if earlier advice
   was wrong.
3. Run `bash scripts/build.sh`.

## The `.living/` sidecar

`apple-hig/.living/` holds the facts that go stale fastest (see the README).

- `KNOWLEDGE.md`: dated facts. Update `last_updated` when you change it.
- `CHANGELOG.md`: append one line per change, with the source URL. Don't
  rewrite old entries.
- `sources.md` and `PROTOCOL.md`: leave these alone unless the PR is about
  them, and say why in the PR.
- `ORIGINAL.sha256`: written by `scripts/build.sh`. Don't edit it by hand.

When a fact in `KNOWLEDGE.md` has settled, fold it into the reference files in
the next release and say so in the changelog.

## PRs

Small, focused PRs with a clear "why" are easiest to review. For substantive
changes to the philosophy/psychology framing, open an issue first so we can
discuss the angle.
