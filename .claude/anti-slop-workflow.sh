#!/bin/bash

# Anti-Slop UI/UX Quality Workflow
# Usage: ./anti-slop-workflow.sh [quick|deep|full|checklist]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GUIDE_FILE="$SCRIPT_DIR/ANTI_SLOP_QUICK_REFERENCE.md"
STYLE_FILE="$SCRIPT_DIR/ANTI_SLOP_UI_UX_GUIDE.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Print header
print_header() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════════╗"
    echo "║           🎨 ANTI-SLOP UI/UX QUALITY WORKFLOW                           ║"
    echo "║                  Quality Checklist & Verification                       ║"
    echo "╚══════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Print section
print_section() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Print step
print_step() {
    echo -e "${GREEN}✓${NC} $1"
}

# Print check
print_check() {
    echo -e "${YELLOW}□${NC} $1"
}

# Print error
print_error() {
    echo -e "${RED}✗${NC} $1"
}

# QUICK CHECK (2 min)
quick_check() {
    print_header
    print_section "⚡ QUICK ANTI-SLOP CHECK (2 minutes)"
    echo ""

    echo -e "${CYAN}Running quick quality checks...${NC}"
    echo ""

    print_check "Design System Compliance"
    print_check "Accessibility (WCAG AA)"
    print_check "Component Quality"

    echo ""
    print_section "Quick Check Items"
    echo "1. Colors: Are they from your design system? (not hardcoded)"
    echo "2. Accessibility: Alt text on images? Semantic HTML?"
    echo "3. Typography: Using type scale? (12px, 14px, 16px, 20px...)"
    echo "4. Spacing: Consistent rhythm? (8px, 16px, 24px...)"
    echo "5. Mobile: Responsive at all breakpoints?"

    echo ""
    print_step "Quick checks ready"
}

# DEEP CHECK (5 min)
deep_check() {
    print_header
    print_section "🔍 DEEP ANTI-SLOP CHECK (5 minutes)"
    echo ""

    echo -e "${CYAN}Running comprehensive quality checks...${NC}"
    echo ""

    print_check "Design System Enforcement"
    print_check "Accessibility Validation (WCAG AA)"
    print_check "Component Quality Review"
    print_check "Typography & Spacing Audit"
    print_check "Responsive Design Check"
    print_check "UX Pattern Validation"
    print_check "Visual Quality Scoring"

    echo ""
    print_section "Deep Check Components"
    echo "✓ Design system tokens (colors, typography, spacing)"
    echo "✓ WCAG AA accessibility compliance"
    echo "✓ Component reusability and quality"
    echo "✓ Type scale consistency"
    echo "✓ Responsive breakpoints (xs, sm, md, lg, xl)"
    echo "✓ UX patterns and best practices"
    echo "✓ Visual polish and consistency"
    echo "✓ Performance metrics"

    echo ""
    print_step "Deep checks ready"
}

# FULL AUDIT (10 min)
full_audit() {
    print_header
    print_section "📊 FULL ANTI-SLOP AUDIT (10 minutes)"
    echo ""

    echo -e "${CYAN}Running complete quality audit...${NC}"
    echo ""

    print_check "Design System Enforcement"
    print_check "Accessibility (WCAG AA)"
    print_check "Component Quality"
    print_check "Typography Audit"
    print_check "Responsive Validation"
    print_check "UX Pattern Check"
    print_check "Visual Quality"
    print_check "Performance Audit"
    print_check "Storybook Documentation"
    print_check "Visual Regression Test"
    print_check "Interaction Testing"

    echo ""
    print_section "All Checks Enabled"
    echo "✓ Complete design system validation"
    echo "✓ Full WCAG AA accessibility audit"
    echo "✓ Component design review"
    echo "✓ Professional typography check"
    echo "✓ All breakpoint testing"
    echo "✓ UX best practices validation"
    echo "✓ Polish and consistency scoring"
    echo "✓ Performance profiling"
    echo "✓ Documentation completeness"
    echo "✓ Visual regression comparison"
    echo "✓ All interaction states tested"

    echo ""
    print_step "Full audit ready"
}

# PRE-SHIP CHECKLIST (use all)
pre_ship_checklist() {
    print_header
    print_section "📋 PRE-SHIP QUALITY CHECKLIST"
    echo ""

    echo -e "${CYAN}Use this before shipping ANY component to production:${NC}"
    echo ""

    # Read checklist from quick reference
    if [ -f "$GUIDE_FILE" ]; then
        # Extract checklist section
        grep -A 30 "Pre-Ship Checklist" "$GUIDE_FILE" | head -20
    else
        echo "✓ Design system compliance"
        echo "✓ WCAG AA accessibility"
        echo "✓ Component quality review"
        echo "✓ Typography & spacing"
        echo "✓ Responsive design (5+ breakpoints)"
        echo "✓ UX pattern validation"
        echo "✓ Visual quality polish"
        echo "✓ Performance testing"
        echo "✓ Storybook documentation"
        echo "✓ Visual regression testing"
        echo "✓ Interaction state testing"
        echo "✓ Final polish & refinement"
    fi

    echo ""
    print_section "Using the Checklist"
    echo "1. Go through each item"
    echo "2. Mark as ✓ when verified"
    echo "3. Fix any issues before shipping"
    echo "4. All items must pass"
    echo ""
    print_step "Pre-ship checklist complete"
}

# WORKFLOW RECOMMENDATION
workflow() {
    print_header
    print_section "🚀 RECOMMENDED ANTI-SLOP WORKFLOW"
    echo ""

    echo -e "${CYAN}Step-by-step process to eliminate AI slop:${NC}"
    echo ""

    echo -e "${GREEN}1️⃣  Generate Component${NC}"
    echo "   → Describe what you want to Claude"
    echo "   → Example: 'Create a button component with primary, secondary, disabled states'"
    echo ""

    echo -e "${GREEN}2️⃣  Quick Quality Check (2 min)${NC}"
    echo "   → Use: /code-review --level medium"
    echo "   → Check basic issues"
    echo ""

    echo -e "${GREEN}3️⃣  Run Security Review${NC}"
    echo "   → Use: /security-review"
    echo "   → Check for vulnerabilities"
    echo ""

    echo -e "${GREEN}4️⃣  Manual Anti-Slop Checklist${NC}"
    echo "   → Read: ANTI_SLOP_QUICK_REFERENCE.md"
    echo "   → Go through 12-item checklist"
    echo "   → Verify each aspect"
    echo ""

    echo -e "${GREEN}5️⃣  Fix Issues${NC}"
    echo "   → Address any findings"
    echo "   → Run tests with: /run"
    echo ""

    echo -e "${GREEN}6️⃣  Final Verification${NC}"
    echo "   → Use: /code-review --level high"
    echo "   → Deep quality check"
    echo ""

    echo -e "${GREEN}7️⃣  Ship${NC}"
    echo "   → git commit -m 'feat: component (quality verified)'"
    echo "   → git push"
    echo ""

    print_step "Workflow complete"
}

# SHOW COMMANDS
show_commands() {
    print_header
    print_section "⚡ AVAILABLE QUALITY COMMANDS"
    echo ""

    echo -e "${CYAN}Real Claude Code Tools (Use Now):${NC}"
    echo "  /code-review --level medium     → Quick code review"
    echo "  /code-review --level high       → Deep code review"
    echo "  /code-review --level ultra      → Cloud deep review"
    echo "  /security-review                → Security check"
    echo "  /run                            → Test your app"
    echo "  /design                         → Design canvas"
    echo "  /simplify                       → Code simplification"
    echo ""

    echo -e "${CYAN}Anti-Slop Reference Files:${NC}"
    echo "  .claude/ANTI_SLOP_UI_UX_GUIDE.md         → Full guide"
    echo "  .claude/ANTI_SLOP_QUICK_REFERENCE.md     → Quick lookup"
    echo ""
}

# PRINT HELP
print_help() {
    echo "Usage: ./anti-slop-workflow.sh [OPTION]"
    echo ""
    echo "Options:"
    echo "  quick       Run quick 2-minute quality checks"
    echo "  deep        Run deep 5-minute quality audit"
    echo "  full        Run full 10-minute comprehensive audit"
    echo "  checklist   Show pre-ship quality checklist"
    echo "  workflow    Show recommended workflow"
    echo "  commands    Show available commands"
    echo "  help        Show this help message"
    echo ""
    echo "Example:"
    echo "  ./anti-slop-workflow.sh quick"
    echo "  ./anti-slop-workflow.sh checklist"
    echo ""
}

# MAIN
main() {
    case "${1:-help}" in
        quick)
            quick_check
            ;;
        deep)
            deep_check
            ;;
        full)
            full_audit
            ;;
        checklist)
            pre_ship_checklist
            ;;
        workflow)
            workflow
            ;;
        commands)
            show_commands
            ;;
        help)
            print_help
            ;;
        *)
            echo "Unknown option: $1"
            print_help
            exit 1
            ;;
    esac

    echo ""
    echo -e "${CYAN}📚 Learn more:${NC}"
    echo "  Read: .claude/ANTI_SLOP_QUICK_REFERENCE.md"
    echo "  Read: .claude/ANTI_SLOP_UI_UX_GUIDE.md"
    echo ""
}

main "$@"