# Reflection & Memory (R / M)

## Milestone {n} Reflection

### Convergence Stats
- Planned features: {N}
- Actual features + fixes: {N + fixes}
- Fix ratio: {fixes / total} % (Factory benchmark: ~34% is healthy)
- Avg validation rounds per feature: {k_avg}
- Auto-downgrades triggered: {count} (fix depth / k_max / planning limit)

### Integration/System Verification
<!-- Mandatory section, even if the answer is "not applicable". Do not omit. -->
- Required per S: TDD {yes/no} | Integration {yes/no} | System {yes/no}
- Milestone/system-scope assertions due this milestone: {list ASSERT-IDs, or "none"}
- Result: {PASS / PARTIAL / FAIL / FAIL-NO-INFRASTRUCTURE / N/A — not required}, see `milestones/M-{n}/integration-verification.md`
- If FAIL-NO-INFRASTRUCTURE: {what's missing, and whether this carries forward as technical debt into the Final Delivery Report}

### Loop Guard Events
| Event | Feature | Reason | Resolution |
|-------|---------|--------|------------|
| Fix depth limit | F-X | depth=3 | auto-downgrade to PARTIAL |
| k_max reached | F-Y | k=5 | auto-downgrade to PARTIAL |
| Planning freeze | M-Z | planning=3 | executed imperfect plan |

### State Consistency Check
- [ ] state.json matches latest Audit Log entry
- [ ] Last Handoff matches state.json.current_feature
- [ ] No orphaned Fix Features (all linked to parent)

### What Worked
- {success pattern}

### What Did Not Work
- {failure pattern}

### Anti-Patterns to Avoid
- {anti-pattern 1}

## Memory Update (M)

### New Patterns / Anti-Patterns / Fixes This Milestone
<!-- Swept from [MEMORY-CANDIDATE: ...] tags in this milestone's Handoffs and verification records
     (see M-i.3 Milestone Gate step 3). Use `references/memory-template.md`'s entry format. Write
     "None this milestone" explicitly if there are no tags — do not just omit this section. -->
- {MEM-{n} entry, or "None this milestone"}

### Reusable Decomposition Template
- Task type: {e.g., "React component refactor"}
- Standard split: {feature categories}
- Standard milestones: {M-1 foundation, M-2 core, M-3 polish}
- Typical fix depth: {N} (calibrate future expectations)

### Reusable Assertion Template
- Domain: {e.g., "API auth"}
- Standard assertions: {ASSERT-AUTH-001..00N}

### Cross-Task Merge
- [ ] New patterns/anti-patterns/fixes above merged into `06-memory.md` (task-level, always)
- [ ] Merged into `.agent/memory.md` (project-level, only if Promotion Rule in `references/memory-template.md` is satisfied — most won't be, that's expected)
- [ ] Merged into `.agent/templates/`
