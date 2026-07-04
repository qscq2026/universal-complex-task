# Verification: {F-{j} | M-{i} integration/system}

## Scope
- **Scope**: feature | milestone | system
- **Target**: F-{j} (if Scope=feature) | M-{i} (if Scope=milestone or system)
- **Assertions checked**: ASSERT-{a}, ASSERT-{b}, ...
- **Covered by Features** (only if Scope=milestone/system): F-{a}, F-{b}, ...
- **Validated**: {timestamp}
- **Context read**: {commit hash checked out, for Scope=feature} | {full working tree / latest combined state as of {timestamp}, for Scope=milestone/system}

## Validator Self-Attestation
- [ ] I have NOT read the implementation trajectory or chat history for this evaluation
- [ ] I have NOT read Worker's reasoning — only the committed artifact + Handoff + Contract
- [ ] I am evaluating ONLY the assertions listed above against the artifact at the stated commit/state
- [ ] Every row in "Per-Assertion Results" below has an actual command + actual output, not a self-report

## Per-Assertion Results
| Assertion ID | Status | Tool | Command Run | Output Summary | Evidence |
|-------------|--------|------|-------------|-----------------|----------|
| ASSERT-{n} | PASS / PARTIAL / FAIL / FAIL-NO-INFRASTRUCTURE | {lint/test/type-check/browser/manual} | {actual command, exact} | {actual output, not "looks fine" or "should work"} | {log path / screenshot / exit code / diff} |

## FAIL-NO-INFRASTRUCTURE Notes
<!-- Fill only if any row above uses this status. This applies almost exclusively to Scope=milestone/system
     assertions where no integration/system test infrastructure exists yet in the project. It is NOT a
     pass and must not be reported as one anywhere downstream (Milestone Gate, Final Delivery Report). -->
- ASSERT-{n}: what would need to exist to actually check this (e.g. "no `tests/integration/` directory,
  no CI job runs a combined check of F-3 + F-7 together")

## Issues Found
| # | Severity | Assertion | Description |
|---|----------|-----------|-------------|
| 1 | blocking / non-blocking / suggestion | ASSERT-{n} | {specific description, not a category label} |

## Verdict
- **pass / partial / fail**
- {One line justification that references specific rows above by Assertion ID — a verdict with no
  reference to the table is not acceptable, e.g. NOT "all good", YES "ASSERT-005 and ASSERT-006 pass
  with evidence above; no blocking issues"}
