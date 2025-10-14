# ⚡ QUICK MIGRATION REFERENCE

**Panduan cepat untuk migrasi module EFD ke reusable widget system**

---

## 🎯 **MIGRATION ORDER**

1. ✅ **EFD1700** - Regex (DONE)
2. ⏳ **EFD1100** - Variable (NEXT - 20 min)
3. ⏳ **EFD1200** - DateTime (15 min)
4. ⏳ **EFD1300** - String (15 min)
5. ⏳ **EFD1400** - Number (15 min)
6. ⏳ **EFD1500** - If Statement (15 min)

---

## 📋 **5-STEP MIGRATION PROCESS**

### **STEP 1: BACKUP (1 min)**

```bash
cd lib/module/{module_dir}/view/
cp {module}_view.dart {module}_view_old.dart
```

### **STEP 2: REPLACE VIEW (5 min)**

Copy template, customize values (see below)

### **STEP 3: CLEAN & TEST (2 min)**

```bash
flutter clean && flutter pub get
flutter analyze lib/module/{module_dir}/
```

### **STEP 4: RUN & VERIFY (5 min)**

```bash
flutter run -d macos
# Test all features
```

### **STEP 5: CLEANUP (1 min)**

```bash
rm {module}_view_old.dart  # If successful
# Update checklist
```

---

## 📝 **COPY-PASTE TEMPLATE**

```dart
import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class {ClassName}View extends StatelessWidget {
  const {ClassName}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "{CODE}",
        moduleName: "{NAME}",
        moduleDescription: "{DESCRIPTION}",
        totalExercises: {NUMBER},
        backgroundColor: const Color(0x{HEX}),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest({Validator}.runTest),
        runAllTests: EfdAdapter.wrapRunAllTests({Validator}.runAllTests),
        getOverallStats: EfdAdapter.wrapGetOverallStats({Validator}.getOverallStats),
        buildExerciseRow: {rowWidget},
        customIcon: Icons.{icon},
      ),
    );
  }
}
```

---

## 🔧 **MODULE CONFIGURATIONS**

### **EFD1100 - Variable**

```dart
class Efd1100VariableView extends StatelessWidget {
  const Efd1100VariableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1100",
        moduleName: "Variable",
        moduleDescription: "Master Dart variables with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE5D9F2),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1100Validator.runTest),
        runAllTests: EfdAdapter.wrapRunAllTests(Efd1100Validator.runAllTests),
        getOverallStats: EfdAdapter.wrapGetOverallStats(Efd1100Validator.getOverallStats),
        buildExerciseRow: rowLabelValidated,
        customIcon: Icons.code,
      ),
    );
  }
}
```

### **EFD1200 - DateTime**

```dart
class Efd1200DatetimeView extends StatelessWidget {
  const Efd1200DatetimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1200",
        moduleName: "DateTime",
        moduleDescription: "Master DateTime operations with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE8DCFF),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1200Validator.runTest),
        runAllTests: EfdAdapter.wrapRunAllTests(Efd1200Validator.runAllTests),
        getOverallStats: EfdAdapter.wrapGetOverallStats(Efd1200Validator.getOverallStats),
        buildExerciseRow: rowLabelValidatedEfd1200,
        customIcon: Icons.access_time,
      ),
    );
  }
}
```

### **EFD1300 - String**

```dart
class Efd1300StringView extends StatelessWidget {
  const Efd1300StringView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1300",
        moduleName: "String",
        moduleDescription: "Master String manipulation with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE5D9F2),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1300Validator.runTest),
        runAllTests: EfdAdapter.wrapRunAllTests(Efd1300Validator.runAllTests),
        getOverallStats: EfdAdapter.wrapGetOverallStats(Efd1300Validator.getOverallStats),
        buildExerciseRow: rowLabelValidatedEfd1300,
        customIcon: Icons.text_fields,
      ),
    );
  }
}
```

### **EFD1400 - Number**

```dart
class Efd1400NumberView extends StatelessWidget {
  const Efd1400NumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1400",
        moduleName: "Number",
        moduleDescription: "Master number operations with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE5D9F2),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1400Validator.runTest),
        runAllTests: EfdAdapter.wrapRunAllTests(Efd1400Validator.runAllTests),
        getOverallStats: EfdAdapter.wrapGetOverallStats(Efd1400Validator.getOverallStats),
        buildExerciseRow: rowLabelValidatedEfd1400,
        customIcon: Icons.calculate,
      ),
    );
  }
}
```

### **EFD1500 - If Statement**

```dart
class Efd1500IfStatementView extends StatelessWidget {
  const Efd1500IfStatementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1500",
        moduleName: "If Statement",
        moduleDescription: "Master conditional logic with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE5D9F2),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1500Validator.runTest),
        runAllTests: EfdAdapter.wrapRunAllTests(Efd1500Validator.runAllTests),
        getOverallStats: EfdAdapter.wrapGetOverallStats(Efd1500Validator.getOverallStats),
        buildExerciseRow: rowLabelValidatedEfd1500,
        customIcon: Icons.alt_route,
      ),
    );
  }
}
```

---

## ✅ **VERIFICATION CHECKLIST**

After migration, verify:

- [ ] AppBar shows correct title
- [ ] All exercises render
- [ ] Individual test works
- [ ] "Run All Tests" works
- [ ] Statistics dialog works
- [ ] No linter errors
- [ ] Hot reload works

---

## 🚨 **COMMON ISSUES & FIXES**

### **Issue: Build Cache Error**

```bash
flutter clean && flutter pub get
```

### **Issue: Row Widget Not Found**

Check `lib/core.dart` has export:

```dart
export 'package:magicbook/shared/widget/row_label/row_label_validated_efd{code}.dart';
```

### **Issue: Type Conflicts**

Already handled by `EfdAdapter` - no action needed

---

## 📊 **PROGRESS TRACKER**

| Module  | Status | Date Completed |
| ------- | ------ | -------------- |
| EFD1700 | ✅     | Oct 14, 2025   |
| EFD1100 | ⏳     | -              |
| EFD1200 | ⏳     | -              |
| EFD1300 | ⏳     | -              |
| EFD1400 | ⏳     | -              |
| EFD1500 | ⏳     | -              |

**Total Progress:** 1/6 (16%)  
**Lines Reduced:** 330/1,700 (19%)

---

## 🎯 **DAILY MIGRATION PLAN**

### **Day 1 (Monday):**

- Morning: EFD1100 (20 min)
- Afternoon: Test & verify (10 min)

### **Day 2 (Tuesday):**

- Morning: EFD1200 (15 min)
- Afternoon: EFD1300 (15 min)

### **Day 3 (Wednesday):**

- Morning: EFD1400 (15 min)
- Afternoon: EFD1500 (15 min)

### **Day 4 (Thursday):**

- Morning: Final testing all modules
- Afternoon: Cleanup & documentation

**Total Time:** 1.5 hours spread over 4 days

---

## 💡 **TIPS**

1. ✅ Migrate in morning (fresh mind)
2. ✅ One module at a time
3. ✅ Test immediately after migration
4. ✅ Commit to git after each module
5. ✅ Keep `_old.dart` backup until verified

---

**Ready? Start with EFD1100!** 🚀
