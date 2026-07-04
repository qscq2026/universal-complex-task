# Memory: {task-level (06-memory.md) | project-level (.agent/memory.md)}

## Scope
- **Scope**: task | project
- **Last updated**: {timestamp}

## Quick Index
<!-- Sorted: critical first, then by occurrence count descending. This table exists so O/W/V can scan
     in one pass without opening every entry — keep it in sync whenever an entry below changes. -->
| ID | Type | Category | Severity | Applies To | Occurrences | Title |
|----|------|----------|----------|-----------|--------------|-------|
| MEM-{n} | pattern / anti-pattern / fix | {category} | critical / major / minor / tip | O / W / V | {n} | {one-line title} |

## Entries

### MEM-{n} [{type} / {category} / {severity}]
- **Applies to role(s)**: O / W / V — which role(s) should read this before acting
- **Occurrences**: {n} — critical entries are recorded on first occurrence; major/minor need 2+ before
  they're worth a permanent entry (see Promotion Rule below)
- **Context**: {task/feature type this showed up in — specific enough that a role can pattern-match
  against its current feature, not so specific it only ever matches once}
- **What happened**: {description}
- **Root cause**: {description, if known — "it failed" is not a root cause}
- **Prevention / Reuse**: {actionable guidance — this line is the entire payoff of the memory system;
  if this is vague, the entry isn't pulling its weight}
- **First seen**: {task-id or "this task"}, {timestamp}
- **Last applied**: {timestamp} | never

## Category Taxonomy
`tdd` | `integration` | `architecture` | `scope` | `workflow` | `domain-specific` (task-type-specific
lessons that don't fit the others — tag with the actual domain, e.g. `domain-specific:api-auth`)

## Promotion Rule (task-level → project-level, applied by O at Phase 5 step 1)
- **critical**: promote to `.agent/memory.md` immediately, regardless of occurrence count — a critical
  issue that happened once is still worth every future task knowing about
- **major/minor**: promote only if this task's Occurrences count is >= 2, OR it matches an existing
  `.agent/memory.md` entry by category + similar description — in the match case, increment the
  EXISTING project-level entry's Occurrences instead of creating a duplicate row
- **tip**: promote only if O judges it broadly reusable across task types, not task-specific trivia
- A task-level entry that never gets promoted is not a failure — most one-off issues shouldn't clutter
  project memory; the threshold exists precisely to keep `.agent/memory.md` worth reading

## Candidate Capture (how entries here get created during a task, not just at Phase 5)
- W: when Handoff's Issues/Blockers section describes something that looks like it could recur (not a
  typo, not fully task-specific), tag it `[MEMORY-CANDIDATE: type/category/severity]` inline
- V: same, inside `verification-template.md`'s Issues Found table — tag the Description with the same marker
- At Milestone Gate (M-i.3), O sweeps every `[MEMORY-CANDIDATE: ...]` tag from this milestone's Handoffs
  and verification records into this file's Entries section (creating or incrementing), then into
  `reflection.md`'s memory section — a tagged candidate that never gets swept is the same failure mode
  as a written-but-never-checked assertion, don't let it happen silently
