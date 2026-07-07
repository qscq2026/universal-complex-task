#!/bin/bash
# Initialize Complex Task Workspace
# Usage: ./init-task.sh <task-name>
#        PROJECT_ROOT=/explicit/path ./init-task.sh <task-name>   (skip detection, use this root)
#        CONFIRM_ROOT=1 ./init-task.sh <task-name>                (accept the detected/proposed root)
#
# NOTE: This script creates an empty workspace for manual requirement drafting.
#       For direct automation, call the skill directly:
#         /universal-complex-task "your requirement description"
#       The skill will auto-populate all files; you only need to confirm at 3 checkpoints.

set -u

TASK_NAME="${1:-task-$(date +%s)}"

# --- Workspace Root Determination ---
# Goal: never silently scatter .agent/ trees across different directories depending on
# wherever this happens to be invoked from. Prefer the git repo root (a stable, cwd-independent
# anchor); fall back to asking when that's not available or when scattering is already detected.
if [ -n "${PROJECT_ROOT:-}" ]; then
    ROOT_SOURCE="explicitly provided via PROJECT_ROOT"
elif GIT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"; then
    PROJECT_ROOT="$GIT_ROOT"
    ROOT_SOURCE="git repository root"
else
    PROJECT_ROOT="$(pwd)"
    ROOT_SOURCE="current directory (no git repository detected — this is the ambiguous case)"
fi

# Scatter check: look for other .agent/tasks/ directories near PROJECT_ROOT that aren't its own.
PARENT_DIR="$(dirname "$PROJECT_ROOT")"
SCATTERED="$(find "$PARENT_DIR" -maxdepth 3 -type d -path "*/.agent/tasks" 2>/dev/null | grep -v "^${PROJECT_ROOT}/.agent/tasks$" || true)"

NEEDS_CONFIRMATION=0
[ -z "${GIT_ROOT:-}" ] && [ -z "${PROJECT_ROOT_EXPLICIT:-}" ] && [ -z "${PROJECT_ROOT:-}${GIT_ROOT:-}" ] || true
if [ -z "${GIT_ROOT:-}" ] && [ -z "${1:-}" ]; then :; fi
if [ -z "$(git rev-parse --show-toplevel 2>/dev/null || true)" ] && [ -z "${PROJECT_ROOT_WAS_EXPLICIT:-}" ]; then
    NEEDS_CONFIRMATION=1
fi
[ -n "$SCATTERED" ] && NEEDS_CONFIRMATION=1
[ -n "${PROJECT_ROOT:-}" ] && [ "${ROOT_SOURCE}" = "explicitly provided via PROJECT_ROOT" ] && NEEDS_CONFIRMATION=0

if [ "$NEEDS_CONFIRMATION" = "1" ] && [ -z "${CONFIRM_ROOT:-}" ]; then
    echo "⚠️  Workspace location needs confirmation before creating anything:"
    echo "   Proposed root: $PROJECT_ROOT"
    echo "   Reason: $ROOT_SOURCE"
    if [ -n "$SCATTERED" ]; then
        echo ""
        echo "   Found other .agent/tasks/ director$([ "$(echo "$SCATTERED" | wc -l)" = "1" ] && echo y || echo ies) nearby — possibly from earlier runs in a different directory:"
        echo "$SCATTERED" | sed 's/^/     - /'
        echo "   If one of these is where this task actually belongs, re-run from there instead."
    fi
    echo ""
    echo "   To accept the proposed root above:  CONFIRM_ROOT=1 $0 $TASK_NAME"
    echo "   To use a different root:            PROJECT_ROOT=/path/to/root $0 $TASK_NAME"
    exit 1
fi

cd "$PROJECT_ROOT" || { echo "❌ Cannot cd to $PROJECT_ROOT"; exit 1; }
TASK_DIR=".agent/tasks/$TASK_NAME"

# Existence check: refuse to overwrite existing task
if [ -d "$TASK_DIR" ]; then
    echo "⚠️  Task '$TASK_NAME' already exists (at $PROJECT_ROOT/$TASK_DIR)."
    if [ -f "$TASK_DIR/state.json" ]; then
        STATUS=$(grep '"status"' "$TASK_DIR/state.json" | head -1 | sed 's/.*: "\([^"]*\)".*/\1/')
        PHASE=$(grep '"phase"' "$TASK_DIR/state.json" | head -1 | sed 's/.*: "\([^"]*\)".*/\1/')
        echo "   Status: $STATUS"
        echo "   Phase: $PHASE"
    fi
    echo ""
    echo "To resume: /universal-complex-task --resume $TASK_NAME"
    echo "To force new (archives old): /universal-complex-task --force $TASK_NAME"
    echo "To inspect: /universal-complex-task --inspect $TASK_NAME"
    exit 1
fi

mkdir -p "$TASK_DIR/milestones"
mkdir -p "$TASK_DIR/snapshots"
mkdir -p ".agent/templates/decomposition"
mkdir -p ".agent/templates/contracts"

# Project-level memory: create only if this is the first task ever run in this project.
# Idempotent on purpose — a second task must NOT overwrite memory accumulated by earlier tasks.
if [ ! -f ".agent/memory.md" ]; then
    cat > ".agent/memory.md" << 'EOF'
# Memory: project-level (.agent/memory.md)

## Scope
- **Scope**: project
- **Last updated**: (not yet updated)

## Quick Index
| ID | Type | Category | Severity | Applies To | Occurrences | Title |
|----|------|----------|----------|-----------|--------------|-------|

## Entries
(none yet — populated at Phase 5 of each task, per the Promotion Rule in
references/memory-template.md. Read by O/W/V before acting, per the Memory Pre-Load Rule.)
EOF
fi

# Generate state.json
cat > "$TASK_DIR/state.json" << EOF
{
  "task_id": "$TASK_NAME",
  "status": "INIT",
  "phase": "U_PARSED",
  "current_milestone": null,
  "current_feature": null,
  "current_iteration": 0,
  "fix_depth": 0,
  "global_iteration": 0,
  "planning_adjustments": 0,
  "completed_milestones": [],
  "completed_features": [],
  "pending_features": [],
  "frozen_files": [],
  "milestone_checkin_preference": "on_demand",
  "clarify_pass_enabled": false,
  "last_role": "O",
  "last_action": "INIT",
  "last_result": "OK",
  "last_timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "budget": {
    "files_modified": 0,
    "files_max": 100,
    "tool_calls": 0,
    "tool_calls_max": 200
  }
}
EOF

cat > "$TASK_DIR/01-user-intent.md" << 'EOF'
# 01 User Intent (U)

## Raw Input
{Will be auto-populated by O if skill is called directly}

## Explicit Requirements
- {to be extracted by O}

## Implicit Requirements
- {to be inferred by O}

## Anti-Requirements
- {to be defined by O}
EOF

cat > "$TASK_DIR/02-structured-spec.md" << 'EOF'
# 02 Structured Spec (S) — Human Confirm Layer 1

### Scope Summary
{to be generated by O}

### Human Confirmation
- [ ] Pending confirmation
EOF

cat > "$TASK_DIR/03-validation-contract.md" << 'EOF'
# 03 Validation Contract (C) — Human Spot-Check Layer 2

### Contract Metadata
- Frozen: false

### Assertions
{to be generated by O}

### Human Spot-Check
- [ ] Pending spot-check
EOF

cat > "$TASK_DIR/04-features-and-milestones.md" << 'EOF'
# 04 Features & Milestones

### Features
{to be planned by O}

### Milestones
{to be staged by O}

### Human Confirmation
- [ ] Pending approval
EOF

cat > "$TASK_DIR/05-audit-log.md" << 'EOF'
# Audit Log (A) — Append Only

| Timestamp | Role | Action | Target | Input | Output | Decision | Human |
|-----------|------|--------|--------|-------|--------|----------|-------|
EOF

cat > "$TASK_DIR/06-memory.md" << 'EOF'
# Memory: task-level (06-memory.md)

## Scope
- **Scope**: task
- **Last updated**: (not yet updated)

## Quick Index
| ID | Type | Category | Severity | Applies To | Occurrences | Title |
|----|------|----------|----------|-----------|--------------|-------|

## Entries
(none yet — populated by the Kickoff Invitation at 1.0 if anything is shared, by
[MEMORY-CANDIDATE] tags swept at each Milestone Gate, and reviewed for promotion to
.agent/memory.md at Phase 5. See references/memory-template.md for entry format and
the Promotion Rule.)
EOF

touch "$TASK_DIR/milestones/.gitkeep"

echo "✅ Task workspace initialized: $TASK_DIR"
echo ""
echo "Usage A (Recommended): Direct skill call"
echo "  /universal-complex-task "your requirement description""
echo "  → O auto-populates all files; you confirm at 3 checkpoints."
echo ""
echo "Usage B (Manual): Edit 01-user-intent.md, then call skill."
echo ""
echo "State file created: $TASK_DIR/state.json"
echo "This file is the single source of truth for execution state."
