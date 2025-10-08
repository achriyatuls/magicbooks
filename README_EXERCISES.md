# 📝 README: File Exercises EFD1100

## 📦 Struktur File

File `lib/module/efd1100_variable/exercises/efd1100_exercises.dart` berisi **35 exercise** dengan 2 sistem:

### 🔒 VALIDATED Exercises (8 exercises)

Exercise yang menggunakan **sistem validasi baru** dengan multiple test cases:

| #   | Exercise              | Test Cases | Description                    |
| --- | --------------------- | ---------- | ------------------------------ |
| 2   | String to Double      | 5          | Konversi String ke Double      |
| 3   | Safe String to Double | 5          | Konversi dengan validasi regex |
| 4   | Check Odd Number      | 8          | Cek bilangan ganjil            |
| 5   | Safe Parse            | 4          | Parse dengan tryParse          |
| 8   | Extract Quoted Text   | 4          | Ambil text dalam quotes        |
| 11  | Addition              | 4          | Operasi penjumlahan            |
| 18  | String Concatenation  | 3          | Gabungkan string               |
| 35  | String Contains       | 4          | Cek substring                  |

**Ciri-ciri:**

- ✅ Marked with 🔒 VALIDATED
- ✅ Static function dengan parameter
- ✅ Multiple test cases (4-8 tests)
- ✅ Tidak bisa curang dengan `return true`
- ✅ Feedback detail dengan hints
- ✅ Grading A-F berdasarkan percentage

### 📝 BASIC Exercises (27 exercises)

Exercise yang menggunakan **sistem lama** (belum dikonversi):

| Range | Count | Description                           |
| ----- | ----- | ------------------------------------- |
| 1     | 1     | Type check                            |
| 6-7   | 2     | Safe parsing & conversion             |
| 9-10  | 2     | List operations                       |
| 12-17 | 6     | Arithmetic operations                 |
| 19-34 | 16    | String, number, validation operations |

**Ciri-ciri:**

- ⚠️ No marker (tanpa 🔒)
- ⚠️ Instance function tanpa parameter
- ⚠️ Manual check (return true/false)
- ⚠️ Bisa dicurangi dengan `return true`
- ⚠️ Binary feedback (centang/minus saja)

---

## 🎯 Cara Mengerjakan

### Untuk VALIDATED Exercises (🔒):

1. **Buka file**: `lib/module/efd1100_variable/exercises/efd1100_exercises.dart`

2. **Cari exercise** dengan marker 🔒, contoh:

   ```dart
   // 🔒 EXERCISE 2: Konversi String ke Double (VALIDATED)

   static double? exercise2Solution(String text) {
     double? price;

     // 👇 TULIS KODE DI SINI:


     return price;  // ← JANGAN UBAH BARIS INI!
   }
   ```

3. **Tulis kode** di area yang ditandai:

   ```dart
   // 👇 TULIS KODE DI SINI:
   price = double.parse(text);
   ```

4. **Save file** dan kembali ke app

5. **Tap exercise** untuk lihat hasil test:
   ```
   ✅ Passed: 5/5 tests (100%)
   Grade: A+ (Perfect!)
   ```

### Untuk BASIC Exercises (tanpa 🔒):

1. **Buka file**: `lib/module/efd1100_variable/exercises/efd1100_exercises.dart`

2. **Cari exercise** tanpa marker, contoh:

   ```dart
   // EXERCISE 1: Type Check
   static bool? exercise1() {
     //Ubah tipe data variable dibawah ini menjadi String
     int price = 100;
     return price is String;
   }
   ```

3. **Ubah sesuai instruksi**:

   ```dart
   String price = "100";  // ← Ubah dari int ke String
   return price is String;
   ```

4. **Save file** dan kembali ke app

5. **Lihat hasil**: Centang hijau ✅ atau minus ➖

---

## 🔄 Perbedaan Sistem

### VALIDATED (🔒) vs BASIC

| Aspek           | VALIDATED 🔒          | BASIC          |
| --------------- | --------------------- | -------------- |
| **Validasi**    | Multiple test cases   | Single check   |
| **Anti-Curang** | ✅ YA (type + logic)  | ❌ TIDAK       |
| **Feedback**    | Detail errors + hints | Icon saja      |
| **Grading**     | A-F (percentage)      | Binary (✅/➖) |
| **XP**          | 10 XP per test        | -              |

### Contoh Konkret:

**VALIDATED (Exercise 2):**

```dart
static double? exercise2Solution(String text) {
  // Siswa coba curang:
  return true;  // ❌ ERROR! Type mismatch: bool vs double?

  // Siswa hardcode:
  return 100.24;  // ❌ Test 2 FAIL: Input "50.5" expected 50.5, got 100.24

  // Siswa benar:
  return double.parse(text);  // ✅ SEMUA TEST PASS!
}
```

**BASIC (Exercise 1):**

```dart
static bool? exercise1() {
  int price = 100;

  // Siswa coba curang:
  return true;  // ✅ CENTANG HIJAU! (Padahal salah!)

  // Sistem tidak validasi apakah price benar-benar String
}
```

---

## 📊 Status Konversi

### Phase 1: Prototype (✅ SELESAI)

- [x] 8 exercises converted to VALIDATED
- [x] 37 test cases created
- [x] Documentation completed

### Phase 2: Expansion (⏳ PENDING)

- [ ] Convert remaining 27 exercises to VALIDATED
- [ ] Add test cases untuk setiap exercise
- [ ] Total target: ~150-200 test cases

### Prioritas Konversi:

**High Priority (Kompleks & Sering Dicurangi):**

- Exercise 9, 10: List operations
- Exercise 19-20: String manipulation
- Exercise 31-33: Validation logic

**Medium Priority:**

- Exercise 12-17: Arithmetic (simple, tapi baik untuk practice)
- Exercise 21-30: Various checks

**Low Priority:**

- Exercise 1, 6-7: Simple type checks

---

## 🎓 Rekomendasi untuk Guru

### 1. **Prioritaskan VALIDATED Exercises**

Mulai dengan exercise yang sudah VALIDATED:

- Siswa dapat feedback yang lebih baik
- Data progress lebih akurat
- Learning experience lebih baik

### 2. **Monitor Progress**

Lihat statistics di app:

- Berapa exercise yang perfect?
- Berapa yang partial (perlu review)?
- Berapa yang failed (perlu bantuan)?

### 3. **Gradual Migration**

Jangan paksa semua exercise sekaligus:

- Biarkan siswa familiar dengan sistem baru (8 exercises)
- Gather feedback
- Convert exercise lain bertahap

### 4. **Update Test Cases**

Review dan update test cases secara berkala:

- Apakah terlalu mudah/sulit?
- Apakah coverage cukup comprehensive?
- Apakah hints membantu?

---

## 💡 Tips untuk Siswa

### Untuk VALIDATED Exercises:

1. **Baca Instruksi dengan Teliti**

   - Semua clue ada di komentar
   - Perhatikan HINT yang diberikan

2. **Tidak Bisa Curang**

   - Type system akan catch error
   - Multiple test cases validate logic
   - Harus benar-benar belajar!

3. **Gunakan Feedback**

   - Lihat test case mana yang gagal
   - Baca error messages
   - Follow hints untuk perbaikan

4. **Target Perfect (100%)**
   - Partial (50-99%) = Belum sempurna
   - Perfect (100%) = Centang hijau + XP penuh

### Untuk BASIC Exercises:

1. **Jujur dalam Mengerjakan**

   - Meskipun bisa curang, jangan lakukan
   - Belajar untuk diri sendiri

2. **Verifikasi Manual**

   - Test kode Anda dengan berbagai input
   - Jangan hanya andalkan centang hijau

3. **Siap untuk Sistem Baru**
   - Exercise ini akan dikonversi ke VALIDATED
   - Practice dengan jujur dari sekarang

---

## 🔧 Untuk Developer

### Template Konversi Exercise:

Dari BASIC:

```dart
// EXERCISE X: Description
static bool? exerciseX() {
  int input = 10;
  // Instruksi...
  bool? output;
  return output == expected;
}
```

Ke VALIDATED:

```dart
// 🔒 EXERCISE X: Description (VALIDATED)
// INSTRUKSI: ...
// HINT: ...
static ReturnType? exerciseXSolution(InputType input) {
  ReturnType? output;

  // 👇 TULIS KODE DI SINI:

  return output;  // ← JANGAN UBAH BARIS INI!
}

// Di tests file:
static TestResult testExerciseX() {
  List<TestCase<InputType, ReturnType>> testCases = [
    TestCase(input: val1, expected: exp1, description: "Case 1"),
    TestCase(input: val2, expected: exp2, description: "Case 2"),
    // ... 4-8 test cases
  ];
  // ... validation logic
}
```

### Checklist Konversi:

- [ ] Buat function signature dengan parameter
- [ ] Pindahkan input data ke test cases
- [ ] Buat 4-8 test cases yang comprehensive
- [ ] Add hints di komentar
- [ ] Register di validator
- [ ] Update view untuk tampilkan validated widget
- [ ] Test dan verify

---

## 📞 Support

Jika ada pertanyaan:

1. **Untuk Siswa**: Baca instruksi di file exercises & tap exercise untuk feedback
2. **Untuk Guru**: Review documentation & check overall statistics
3. **Untuk Developer**: Check `PROPOSAL_SISTEM_VALIDASI.md` untuk technical details

---

## ✅ Kesimpulan

File `efd1100_exercises.dart` sekarang berisi:

- ✅ **8 VALIDATED exercises** - Sistem baru dengan multiple test cases
- ✅ **27 BASIC exercises** - Sistem lama (akan dikonversi bertahap)
- ✅ **Clear markers** - 🔒 untuk VALIDATED, tanpa marker untuk BASIC
- ✅ **Comprehensive instructions** - Hints & comments untuk setiap exercise
- ✅ **Ready for use** - Siswa bisa langsung mulai mengerjakan

**Status:** ✅ **READY FOR DEPLOYMENT**

Sistem hybrid ini memungkinkan transisi bertahap dari sistem lama ke sistem baru! 🚀📚✨
