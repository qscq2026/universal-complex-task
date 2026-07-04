# Audit Log (A) — Append Only

## Header
- Task ID: {id}
- Started: {timestamp}
- Status: {RUNNING / COMPLETED / ABORTED / SUSPENDED}

## Entries

| Timestamp | Role | Action | Target | Input | Output | Decision | Human |
|-----------|------|--------|--------|-------|--------|----------|-------|
| {ISO} | O | PLAN | M-1 | S+C | 3 features | waterfall chosen | - |
| {ISO} | W-1 | IMPLEMENT | F-1 | spec+handoff | code+tests | tdd_required=true: RED then GREEN | - |
| {ISO} | W-1 | COMMIT | F-1 | - | hash: abc123 | snapshot | - |
| {ISO} | W-1 | HANDOFF | F-1 | - | handoff-F1.md | 2 issues | - |
| {ISO} | V-1 | VALIDATE | F-1 | C+Cm | 2 FAIL | fresh eval, Scope: feature | - |
| {ISO} | O | GENERATE_FIX | F-fix-1 | V report | fix spec | race cond | - |
| {ISO} | O | LOOP_GUARD | F-1 | fix depth=3 | auto-downgrade | depth limit | - |
| {ISO} | O | LOOP_GUARD | F-2 | k=5 | auto-downgrade | k_max reached | - |
| {ISO} | O | LOOP_GUARD | M-2 | planning=3 | freeze plan | plan limit | - |
| {ISO} | V-1 | VALIDATE | M-2 | C (system-scope)+full state | 1 FAIL-NO-INFRASTRUCTURE | ASSERT-005: no integration test exists | - |
| {ISO} | O | SUSPEND | task-123 | state.json | phase=M-2/F-3 | user request | YES |
| {ISO} | O | RESUME | task-123 | state.json | phase=M-2/F-3 | restored context | - |
| {ISO} | HUMAN | OVERRIDE | ASSERT-003 | "too strict" | relaxed | user request | YES |

## Rules
- NEVER edit or delete past rows
- Every commit, handoff, validation MUST generate a row
- Loop Guard events MUST generate explicit rows
- Resume events MUST generate explicit rows with state snapshot
- Suspend events MUST generate explicit rows with reason
- **A Scope: milestone/system VALIDATE row with a PASS decision must show the actual command/output in Input or Output — an unevidenced PASS is presumed fabricated**
- If human intervenes, record exact prompt and O's response
