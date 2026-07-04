# Goal Definition: U + S + C

## 01 User Intent (U)

### Raw Input
{Auto-populated by O from user request}

### Explicit Requirements
- {to be extracted by O}

### Implicit Requirements (Inferred by O)
- {backward compatibility}
- {performance/security constraints}

### Anti-Requirements (What NOT to do)
- {prevent over-engineering}

---

## 02 Structured Spec (S) — Human Confirm Layer 1

### Scope Summary
{One sentence by O}

### Functional Requirements
1. {FR-1: description}
2. {FR-2: description}

### Non-Functional Requirements
- {Performance: latency < X}
- {Security: auth required}
- {Compatibility: no breaking changes}

### Verification Requirements
<!-- See SKILL.md §1.2 for the full rule, including the mandatory trigger check for
     "end-to-end/整体/流程/workflow"-type language in the requirements above. -->
- **TDD required**: {yes/no} — {if yes: which features}
- **Integration test required**: {yes/no} — {if yes: which feature boundaries, e.g. "F-cart + F-payment + F-order, once all three individually PASS"}
- **System test required**: {yes/no} — {if yes: what "the whole system" means for this task}

### Assumptions & Dependencies
- {assumption 1}
- {external dependency 1}

### Human Confirmation
- [ ] I confirm this spec accurately represents my intent, including what will and won't get an integration/system-level check
- Confirmed by: {user}
- Date: {timestamp}

---

## 03 Validation Contract (C) — Human Spot-Check Layer 2

### Contract Metadata
- Task ID: {id}
- Frozen: {timestamp} — DO NOT MODIFY AFTER FREEZE
- Maps to Spec: S-{version}

### Assertion Coverage Matrix
<!-- Canonical columns — see SKILL.md §1.3. An assertion covering 2+ features must be
     Scope: milestone or system, never feature. -->
| Spec Req | Assertion ID | Scope | Covered by Features | Verification Timing | Status |
|----------|-------------|-------|---------------------|---------------------|--------|
| FR-1 | ASSERT-001 | feature | F-1 | Worker step 4, per-commit | drafted |
| FR-3 | ASSERT-002 | system | F-2, F-5 | Milestone Gate, after both PASS | drafted |

### Assertions
<!-- This format is canonical in SKILL.md §1.3 — this block is a filled example, not a
     second definition. If the two ever disagree, SKILL.md §1.3 wins. -->
```
### ASSERT-001: {Behavior}
- Trigger: {precondition}
- Action: {action}
- Expected: {outcome}
- Tool: {verification tool}
- Evidence: {evidence type}
- Maps to Spec: FR-1
- Scope: feature
- Covered by Features: F-1
- Verification Timing: Worker step 4, per-commit
```

### Human Spot-Check
- [ ] Assertions look correct and complete
- [ ] Every assertion covering 2+ features is marked Scope: milestone or system, not feature
- [ ] If S's Verification Requirements named an integration/system need, at least one Scope: milestone/system assertion exists for it (or O explicitly justified why not)
- Checked by: {user}
- Date: {timestamp}

---

## 04 Features & Milestones (Plan) — Human Confirm Layer 3

### Features
| ID | Name | Input | Output | Acceptance Criteria | Dependencies | Risk | Effort |
|----|------|-------|--------|--------------------|--------------|------|--------|
| F-1 | {name} | {input} | {output} | {criteria} | - | low | 1 round |
| F-2 | {name} | {input} | {output} | {criteria} | F-1 | med | 2 rounds |

### Assertion Coverage Map
| Feature | Covers Assertions |
|---------|-------------------|
| F-1 | ASSERT-001, ASSERT-002 |

### Milestones
- **M-1**: {F-1, F-2} — Foundation
- **M-2**: {F-3, F-4} — Core Logic
- **M-3**: {F-5} — Polish

### Human Confirmation
- [ ] I approve this feature list and milestone plan
- Approved by: {user}
- Date: {timestamp}
