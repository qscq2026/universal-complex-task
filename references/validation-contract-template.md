# Validation Contract (C)

## Contract Metadata
- Task ID: {id}
- Frozen: {timestamp} — DO NOT MODIFY AFTER FREEZE
- Maps to Spec: S-{version}

## Assertions

### ASSERT-001: {Behavior Name}
- **Trigger**: {precondition}
- **Action**: {user/system action}
- **Expected**: {observable outcome}
- **Tool**: {lint / test / type-check / browser / manual}
- **Evidence**: {screenshot / log / exit-code / file-diff}
- **Maps to Spec**: FR-{n}
- **Covered by Features**: F-{a}, F-{b}

### ASSERT-002: ...

## Verification Protocol
1. Checkout commit hash from Cm
2. Run tool per assertion
3. Collect evidence
4. Record PASS / PARTIAL / FAIL with evidence

## Validator Rules
- [ ] I have NOT read the implementation code trajectory
- [ ] I have NOT read the worker's reasoning
- [ ] I am evaluating ONLY this contract + the committed artifact
