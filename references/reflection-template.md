# Reflection & Memory (R / M)

## Milestone {n} Reflection

### Convergence Stats
- Planned features: {N}
- Actual features + fixes: {N + fixes}
- Fix ratio: {fixes / total} % (Factory benchmark: ~34% is healthy)
- Avg validation rounds per feature: {k_avg}
- Auto-downgrades triggered: {count} (fix depth / k_max / planning limit)

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

### Reusable Decomposition Template
- Task type: {e.g., "React component refactor"}
- Standard split: {feature categories}
- Standard milestones: {M-1 foundation, M-2 core, M-3 polish}
- Typical fix depth: {N} (calibrate future expectations)

### Reusable Assertion Template
- Domain: {e.g., "API auth"}
- Standard assertions: {ASSERT-AUTH-001..00N}

### Cross-Task Merge
- [ ] Merged into `.agent/memory.md`
- [ ] Merged into `.agent/templates/`
