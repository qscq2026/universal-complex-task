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

### Assumptions & Dependencies
- {assumption 1}
- {external dependency 1}

### Human Confirmation
- [ ] I confirm this spec accurately represents my intent
- Confirmed by: {user}
- Date: {timestamp}

---

## 03 Validation Contract (C) — Human Spot-Check Layer 2

### Assertion Coverage Matrix
| Spec Req | Assertion ID | Status |
|----------|-------------|--------|
| FR-1 | ASSERT-001 | drafted |
| FR-2 | ASSERT-002 | drafted |

### Assertions
```
### ASSERT-001: {Behavior}
- Trigger: {precondition}
- Action: {action}
- Expected: {outcome}
- Tool: {verification tool}
- Evidence: {evidence type}
- Maps to Spec: FR-1
```

### Human Spot-Check
- [ ] Assertions look correct and complete
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
