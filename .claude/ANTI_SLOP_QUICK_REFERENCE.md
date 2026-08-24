# Anti-Slop UI/UX: Quick Reference Card

## 🎯 One-Command Quality Checks

### Run All Anti-Slop Checks
```bash
/anti-slop-check --comprehensive
```

### Quick Check (2 min)
```bash
/design-system-enforcer
/a11y-validator --quick
/inspect-component --quick
```

### Deep Check (5 min)
```bash
/design-system-enforcer --strict
/a11y-validator --wcag aa --full
/inspect-component --quality --reusability
/audit-typography --check-all
/validate-responsive --all-breakpoints
/audit-ux-patterns
/check-visual-quality
```

### Full Audit (10 min)
```bash
/anti-slop-check --deep --report html
# Generates comprehensive report with all findings
```

---

## 🔍 Check Individual Aspects

| Aspect | Command | Time |
|--------|---------|------|
| **Design System** | `/enforce-design-system` | 1m |
| **Accessibility** | `/a11y-validate --wcag aa` | 1m |
| **Components** | `/inspect-component --quality` | 2m |
| **Typography** | `/audit-typography` | 1m |
| **Responsive** | `/validate-responsive` | 2m |
| **UX Patterns** | `/audit-ux-patterns` | 1m |
| **Visual Quality** | `/check-visual-quality` | 1m |
| **Performance** | `/audit-performance` | 2m |
| **Storybook** | `/check-storybook` | 1m |
| **Visual Regression** | `/test-visual-regression` | 3m |
| **Interactions** | `/test-interactions` | 2m |

---

## ✅ Pre-Ship Checklist

Before deploying to production:

```
□ /design-system-enforcer --check-tokens
  → Verify all colors, spacing, typography match system

□ /a11y-validate --wcag aa
  → Check WCAG AA accessibility compliance

□ /inspect-component --quality
  → Component code quality review

□ /validate-responsive --all-breakpoints
  → Test xs, sm, md, lg, xl breakpoints

□ /audit-ux-patterns
  → Verify UX follows best practices

□ /check-visual-quality --polish
  → Alignment, colors, shadows, visual balance

□ /test-visual-regression
  → Compare against baseline (no unexpected changes)

□ /test-interactions --all
  → Hover, focus, click, keyboard states

□ /audit-performance
  → Render performance, bundle size, metrics

□ /check-storybook --completeness
  → All components documented with stories
```

---

## 🚀 AI-Slop Prevention Workflow

### When Generating UI
1. **Generate component**
   ```bash
   "Create a button component with primary, secondary, and disabled states"
   ```

2. **Immediately check**
   ```bash
   /anti-slop-check --quick
   ```

3. **Fix issues**
   ```bash
   /auto-fix-a11y
   /auto-polish-design
   /enforce-design-system --auto-fix
   ```

4. **Verify**
   ```bash
   /anti-slop-check --verify
   ```

5. **Ship**
   ```bash
   git commit -m "feat: add button component (quality verified)"
   ```

---

## 🎨 Design System Enforcement

### Check Against Design System
```bash
/enforce-design-system --check-against-tokens
```

**Validates:**
- ✓ Colors match palette
- ✓ Typography uses defined scales
- ✓ Spacing follows rhythm
- ✓ Components match specs
- ✓ Brand consistency

### Sync Tokens
```bash
/sync-design-tokens --auto-update
```

---

## ♿ Accessibility Quick Wins

### Run A11y Check
```bash
/a11y-validate --wcag aa --report html
```

**Checks:**
- ✓ Color contrast (4.5:1 for text)
- ✓ Alt text on images
- ✓ Semantic HTML
- ✓ Keyboard navigation
- ✓ Focus indicators
- ✓ ARIA labels
- ✓ Touch targets (44px minimum)

### Auto-Fix Common Issues
```bash
/auto-fix-a11y
```

---

## 📱 Responsive Design Validation

### Check All Breakpoints
```bash
/validate-responsive --all-breakpoints --report
```

**Tests:**
- ✓ Mobile (375px)
- ✓ Tablet (768px)
- ✓ Desktop (1024px)
- ✓ Wide (1440px)
- ✓ Extra wide (1920px)

### Mobile-First Check
```bash
/validate-responsive --mobile-first --strict
```

---

## 📐 Typography & Spacing

### Audit Typography
```bash
/audit-typography --check-scale --check-hierarchy --check-spacing
```

**Verifies:**
- ✓ Type scale consistency (e.g., 12px, 14px, 16px, 20px...)
- ✓ Line-height proportional (1.5 for body, 1.2 for headings)
- ✓ Visual hierarchy clear
- ✓ Spacing rhythm consistent (e.g., 8px, 16px, 24px...)

---

## 🎭 UX Pattern Validation

### Check UX Patterns
```bash
/audit-ux-patterns --check-patterns --check-interactions --best-practices
```

**Validates:**
- ✓ Form patterns (labels, validation, errors)
- ✓ Navigation patterns (clear hierarchy, breadcrumbs)
- ✓ Feedback patterns (loading, success, error states)
- ✓ Modal/dialog patterns
- ✓ Card patterns
- ✓ List/table patterns

---

## 👁️ Visual Quality Scoring

### Check Visual Quality
```bash
/check-visual-quality --alignment --colors --shadows --polish
```

**Scores (0-10):**
- Alignment (pixel-perfect placement)
- Color harmony (palette usage)
- Shadow consistency (depth indication)
- Visual balance (weight distribution)
- Polish (overall refinement)

**Target:** 8.5+ out of 10

---

## ⚡ Performance Check

### Audit Performance
```bash
/audit-performance --check-renders --check-bundle --check-metrics
```

**Metrics:**
- ✓ Render time < 16ms (60fps)
- ✓ Bundle size reasonable
- ✓ No unnecessary re-renders
- ✓ Component profiling
- ✓ Memory usage

---

## 🧪 Testing

### Visual Regression Test
```bash
/test-visual-regression --baseline --threshold 0.01
```

### Interaction Testing
```bash
/test-interactions --hover --focus --click --keyboard
```

### Storybook Quality
```bash
/check-storybook --completeness --coverage --examples
```

---

## 🔧 Configuration

### Create `ui-ux-config.json`
```json
{
  "anti-slop": {
    "design-system": { "enabled": true, "strict": true },
    "accessibility": { "enabled": true, "wcag-level": "aa" },
    "quality": { "enabled": true, "check-reusability": true },
    "typography": { "enabled": true },
    "responsive": { "enabled": true, "mobile-first": true },
    "performance": { "enabled": true },
    "visual": { "enabled": true },
    "testing": { "enabled": true }
  }
}
```

---

## 📊 Quality Scorecard

Track scores for each component:

```
Component: Button
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Design System:     ✅ 100% compliant
Accessibility:     ✅ WCAG AA
Quality:           ✅ Reusable
Typography:        ✅ 9/10
Responsive:        ✅ All breakpoints
UX Pattern:        ✅ Best practice
Visual Quality:    ✅ 9/10
Performance:       ✅ 16ms render
Storybook:         ✅ Complete
Visual Regression: ✅ No changes
Interactions:      ✅ All tested

Overall Score: 97/100 ✨
```

---

## 🆚 Slop vs Quality Comparison

### Slop Component ❌
- Generic colors (hardcoded #333)
- No accessibility attributes
- Poor typography hierarchy
- Breaks on mobile
- Non-standard interaction
- Undocumented
- Fails accessibility check
- Score: 35/100

### Quality Component ✅
- Design system colors
- Full WCAG AA compliance
- Professional typography
- Mobile-responsive
- Best practice UX
- Full Storybook documentation
- Passes all checks
- Score: 95/100

---

## 💡 Pro Tips

1. **Run checks EARLY** - Don't wait until review
2. **Automate everything** - Use CI/CD enforcement
3. **Make it a habit** - Check every component
4. **Track metrics** - See improvement over time
5. **Share standards** - Team alignment matters
6. **Design system first** - Single source of truth
7. **Test with users** - Metrics ≠ reality
8. **Iterate quickly** - Polish is iterative

---

## 🚀 Command Shortcuts (Add to keybindings.json)

```json
{
  "keybindings": [
    {
      "key": "cmd+shift+u",
      "command": "/anti-slop-check --comprehensive",
      "description": "Run comprehensive anti-slop check"
    },
    {
      "key": "cmd+shift+a",
      "command": "/a11y-validator --wcag aa",
      "description": "Run accessibility check"
    },
    {
      "key": "cmd+shift+d",
      "command": "/design-system-enforcer",
      "description": "Check design system compliance"
    },
    {
      "key": "cmd+shift+q",
      "command": "/quality-report --format html",
      "description": "Generate quality report"
    }
  ]
}
```

---

## ✨ Next Steps

1. **Review ANTI_SLOP_UI_UX_GUIDE.md** - Full documentation
2. **Run `/anti-slop-check --comprehensive`** - See current state
3. **Fix high-priority issues** - Start with accessibility
4. **Create design system tokens** - Define your standards
5. **Add to CI/CD pipeline** - Enforce automatically
6. **Train team** - Share standards and workflows

---

**Quality isn't expensive, it's efficient. Automate it.** ✨

---

*Anti-Slop Quick Reference | 2026-08-24*