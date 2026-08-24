# Anti-Slop UI/UX Plugin Guide

**Goal:** Eliminate low-quality, unpolished AI-generated UI/UX output  
**Last Updated:** 2026-08-24

---

## What is "AI Slop" in UI/UX?

**AI Slop** = Low-quality, generic, unpolished interface output that:
- ❌ Looks templated and generic
- ❌ Ignores design systems
- ❌ Violates accessibility standards
- ❌ Has poor typography/spacing
- ❌ Lacks visual hierarchy
- ❌ Breaks on responsive layouts
- ❌ Ignores brand/design consistency
- ❌ Has confusing UX patterns

---

## 🎯 Recommended Anti-Slop Plugins

### **TIER 1: Essential Quality Control**

#### 1. **Design System Enforcer** 🎨
**Purpose:** Ensures all UI follows your design system  
**Catches:** Generic designs, off-brand colors, inconsistent spacing

```bash
/enforce-design-system --check-tokens --check-components
```

**Features:**
- ✅ Validates against design tokens
- ✅ Enforces component consistency
- ✅ Catches brand violations
- ✅ Reports design debt

**Install:**
```bash
claude plugin install design-system-enforcer
```

---

#### 2. **Accessibility Validator (a11y)** ♿
**Purpose:** Catches accessibility issues before they ship  
**Catches:** Missing alt text, poor contrast, semantic HTML

```bash
/a11y-validate --wcag aa --report html
```

**Features:**
- ✅ WCAG 2.1 AA compliance
- ✅ Color contrast checking
- ✅ Semantic HTML validation
- ✅ Keyboard navigation testing
- ✅ Screen reader compatibility

**Install:**
```bash
claude plugin install a11y-validator
```

---

#### 3. **Component Quality Inspector** 🔍
**Purpose:** Reviews component code quality and reusability  
**Catches:** Hardcoded values, poor prop design, non-reusable components

```bash
/inspect-component --quality --reusability --patterns
```

**Features:**
- ✅ Component design review
- ✅ Prop validation
- ✅ Reusability scoring
- ✅ Pattern detection
- ✅ Documentation checks

**Install:**
```bash
claude plugin install component-quality-inspector
```

---

### **TIER 2: Advanced Polish**

#### 4. **Typography & Spacing Auditor** 📐
**Purpose:** Ensures professional typography and spacing  
**Catches:** Inconsistent font sizes, bad line-height, odd spacing

```bash
/audit-typography --check-scale --check-spacing --check-hierarchy
```

**Features:**
- ✅ Type scale validation
- ✅ Spacing rhythm checking
- ✅ Visual hierarchy analysis
- ✅ Responsive typography
- ✅ Line-height optimization

**Install:**
```bash
claude plugin install typography-auditor
```

---

#### 5. **Responsive Design Validator** 📱
**Purpose:** Ensures designs work across all screen sizes  
**Catches:** Broken layouts, unresponsive components, mobile issues

```bash
/validate-responsive --mobile --tablet --desktop --check-breakpoints
```

**Features:**
- ✅ Breakpoint validation
- ✅ Mobile-first checking
- ✅ Touch target sizing
- ✅ Layout stability
- ✅ Viewport testing

**Install:**
```bash
claude plugin install responsive-validator
```

---

#### 6. **UX Patterns Auditor** 🎭
**Purpose:** Ensures UX patterns follow best practices  
**Catches:** Non-standard interactions, poor UX decisions

```bash
/audit-ux-patterns --check-patterns --check-interactions --best-practices
```

**Features:**
- ✅ Pattern matching
- ✅ Interaction validation
- ✅ UX best practices
- ✅ User flow analysis
- ✅ Cognitive load assessment

**Install:**
```bash
claude plugin install ux-patterns-auditor
```

---

### **TIER 3: Visual & Code Quality**

#### 7. **Visual Quality Checker** 👁️
**Purpose:** Catches visual inconsistencies and polish issues  
**Catches:** Misaligned elements, inconsistent shadows, color issues

```bash
/check-visual-quality --alignment --shadows --colors --polish
```

**Features:**
- ✅ Pixel-perfect alignment
- ✅ Shadow consistency
- ✅ Color harmony
- ✅ Visual balance
- ✅ Polish scoring

**Install:**
```bash
claude plugin install visual-quality-checker
```

---

#### 8. **Frontend Code Linter (Strict)** 🔧
**Purpose:** Enforces high frontend code standards  
**Catches:** CSS issues, React antipatterns, performance problems

**Built-in Tools:**
- ESLint (with strict config)
- Stylelint (CSS validation)
- React ESLint Plugin
- Accessibility ESLint Plugin

**Configure:**
```json
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:jsx-a11y/recommended",
    "plugin:prettier/recommended"
  ],
  "rules": {
    "complexity": ["error", 10],
    "max-depth": ["error", 3],
    "max-nested-callbacks": ["error", 2]
  }
}
```

---

#### 9. **Performance Auditor** ⚡
**Purpose:** Ensures UI performs well  
**Catches:** Slow renders, unnecessary re-renders, bloated components

```bash
/audit-performance --check-renders --check-bundle --check-metrics
```

**Features:**
- ✅ Render performance
- ✅ Bundle analysis
- ✅ Component profiling
- ✅ Metrics tracking
- ✅ Optimization suggestions

**Install:**
```bash
claude plugin install performance-auditor
```

---

### **TIER 4: Documentation & Testing**

#### 10. **Storybook Quality Checker** 📚
**Purpose:** Ensures comprehensive component documentation  
**Catches:** Undocumented components, missing stories, bad examples

```bash
/check-storybook --completeness --coverage --examples
```

**Features:**
- ✅ Story completeness
- ✅ Coverage reporting
- ✅ Example validation
- ✅ Documentation quality
- ✅ Accessibility stories

**Install:**
```bash
claude plugin install storybook-checker
```

---

#### 11. **Visual Regression Tester** 🖼️
**Purpose:** Catches unintended visual changes  
**Catches:** Accidental styling changes, layout shifts, visual bugs

```bash
/test-visual-regression --baseline --threshold --report
```

**Features:**
- ✅ Screenshot comparison
- ✅ Threshold tolerance
- ✅ Visual diffs
- ✅ Regression detection
- ✅ CI/CD integration

**Install:**
```bash
claude plugin install visual-regression-tester
```

---

#### 12. **Interaction Testing** 🎯
**Purpose:** Ensures interactions work correctly  
**Catches:** Broken hover states, animation issues, interaction bugs

```bash
/test-interactions --hover --focus --click --keyboard
```

**Features:**
- ✅ Hover state testing
- ✅ Focus management
- ✅ Animation validation
- ✅ Keyboard navigation
- ✅ Touch interactions

**Install:**
```bash
claude plugin install interaction-tester
```

---

## 🚀 Quick Anti-Slop Workflow

### Step 1: Generate Component
```bash
# Create React component
claude code "Create a beautiful button component"
```

### Step 2: Immediate Quality Checks
```bash
# Run all anti-slop checks
/enforce-design-system --strict
/a11y-validate --wcag aa
/inspect-component --quality
/audit-typography
/validate-responsive
/audit-ux-patterns
/check-visual-quality
```

### Step 3: Fix Issues
```bash
# Auto-fix what can be automated
eslint --fix
stylelint --fix
/auto-fix-a11y
/auto-polish-design
```

### Step 4: Verify Quality
```bash
/test-visual-regression
/test-interactions
/check-storybook
/audit-performance
```

### Step 5: Documentation
```bash
# Ensure proper documentation
/generate-component-docs
/generate-storybook-stories
```

---

## 🎨 Design System Integration

### Connect Your Design Tokens
```json
{
  "design-system": {
    "colors": "path/to/tokens/colors.json",
    "typography": "path/to/tokens/typography.json",
    "spacing": "path/to/tokens/spacing.json",
    "components": "path/to/components-config.json"
  }
}
```

### Enforce Consistent Brands
```bash
/enforce-design-system --check-against-figma
/sync-design-tokens --auto-update
```

---

## 📋 Anti-Slop Checklist

Before shipping any UI component, verify:

- [ ] ✅ Follows design system tokens
- [ ] ✅ WCAG AA accessible
- [ ] ✅ Responsive on all breakpoints
- [ ] ✅ Professional typography/spacing
- [ ] ✅ Follows UX best practices
- [ ] ✅ No visual inconsistencies
- [ ] ✅ Components are reusable
- [ ] ✅ Performance is good
- [ ] ✅ Documented in Storybook
- [ ] ✅ No visual regressions
- [ ] ✅ Interactions work correctly
- [ ] ✅ Proper error handling

---

## 🔧 Configuration

### Create `.claude/ui-ux-config.json`

```json
{
  "anti-slop": {
    "design-system": {
      "enabled": true,
      "strict": true,
      "check-tokens": true,
      "check-components": true
    },
    "accessibility": {
      "enabled": true,
      "standard": "wcag-aa",
      "auto-fix": false
    },
    "quality": {
      "enabled": true,
      "check-reusability": true,
      "check-patterns": true,
      "check-documentation": true
    },
    "typography": {
      "enabled": true,
      "check-scale": true,
      "check-hierarchy": true
    },
    "responsive": {
      "enabled": true,
      "breakpoints": ["xs", "sm", "md", "lg", "xl"],
      "check-mobile-first": true
    },
    "performance": {
      "enabled": true,
      "max-render-time": 16,
      "check-bundle": true
    },
    "visual": {
      "enabled": true,
      "check-alignment": true,
      "check-colors": true,
      "check-shadows": true
    },
    "testing": {
      "visual-regression": true,
      "interaction-testing": true,
      "storybook": true
    }
  }
}
```

---

## 📊 Quality Metrics

Track these metrics to ensure anti-slop quality:

```
Accessibility Score: _____ / 100
Design System Compliance: _____ %
Responsive Coverage: _____ %
Component Reusability: _____ %
Documentation: _____ %
Visual Polish Score: _____ / 10
Performance Score: _____ / 100
UX Pattern Compliance: _____ %

Target: All >= 90%
Slop Threshold: < 85%
```

---

## 🎯 Commands Summary

```bash
# Quick quality check
/anti-slop-check

# Deep analysis
/anti-slop-check --deep --report

# Auto-fix common issues
/anti-slop-fix

# Generate quality report
/quality-report --format html

# Batch check components
/batch-check-components --directory src/components

# Compare with design system
/compare-with-design-system

# Accessibility deep dive
/a11y-audit --full --report

# Performance analysis
/perf-analyze --components

# Visual consistency check
/visual-consistency-check

# Generate improvement suggestions
/suggest-improvements --detail
```

---

## 🚨 AI Slop Detection Patterns

The plugins detect these anti-patterns:

### ❌ Visual Slop
- Inconsistent spacing/padding
- Off-brand colors
- Generic/stock-photo appearance
- Poor visual hierarchy
- Misaligned elements
- Inconsistent shadows/borders

### ❌ UX Slop
- Non-standard interactions
- Confusing information architecture
- Poor error messages
- Inconsistent patterns
- Accessibility issues
- Unclear affordances

### ❌ Code Slop
- Hardcoded values
- Non-reusable components
- Tight coupling
- Inconsistent naming
- Poor documentation
- Missing tests

### ❌ Performance Slop
- Unnecessary re-renders
- Large bundle sizes
- Slow animations
- Memory leaks
- Unoptimized images
- Blocking operations

---

## 💡 Pro Tips

1. **Run checks early and often** - Don't wait until the end
2. **Use design tokens** - Single source of truth for consistency
3. **Automate what you can** - ESLint, Prettier, Stylelint
4. **Document everything** - Storybook is your friend
5. **Test with real users** - Metrics aren't enough
6. **Version your design system** - Track changes over time
7. **Use visual regression testing** - Catch surprises
8. **Enforce in CI/CD** - Make quality non-negotiable

---

## 📚 Related Documentation

- [PLUGIN_INSTALLATION_REPORT.md](./PLUGIN_INSTALLATION_REPORT.md) - All installed plugins
- [frontend-design](../plugins/) - Frontend design tools
- [VIBE_CODING_GUIDE.md](./00-Process/VIBE_CODING.md) - Building quality features
- [CONFIGURATION_GUIDE.md](./CONFIGURATION_GUIDE.md) - General setup

---

## ✨ Remember

**Quality UI/UX is not an accident, it's a system.**

The difference between "AI slop" and "human-quality design" is:
- ✅ Consistency (design system)
- ✅ Attention to detail (checklists & audits)
- ✅ Accessibility (inclusive by default)
- ✅ Performance (fast & smooth)
- ✅ Testing (visual & interaction)
- ✅ Documentation (clear & complete)
- ✅ Refinement (never ship first draft)

Use these plugins to automate quality checks and focus your energy on craft.

---

**Ready to eliminate AI slop? Install the plugins and start checking!** 🚀

---

*Anti-Slop UI/UX Guide | 2026-08-24*