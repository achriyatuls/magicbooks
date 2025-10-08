# 💡 SOLUSI EXERCISE - FbkDartVariable

## ✅ Exercise 1 - SUDAH BENAR

```dart
bool? exercise1() {
  //Ubah tipe data variable dibawah ini menjadi String
  String price = "100";
  return price is String;
}
```

**Status**: ✅ Centang Hijau  
**Penjelasan**: Variable `price` sudah bertipe `String` dengan nilai `"100"`, sehingga `price is String` return `true`.

---

## ❌ Exercise 2 - PERLU DIPERBAIKI

### Original (Salah):

```dart
bool? exercise2() {
  double? price;
  String text = "100.24";
  //Ubahlah variable text di atas menjadi double,
  //dan isilah varibel price dengan hasil konversinya
  //di bagian bawah
  return price == 100.24;
}
```

**Status**: ❌ Minus Abu-Abu  
**Masalah**: Variable `price` tidak diisi, masih `null`

### Solusi (Benar):

```dart
bool? exercise2() {
  double? price;
  String text = "100.24";

  // TAMBAHKAN KODE INI:
  price = double.parse(text);  // Konversi String → double

  return price == 100.24;  // ✅ true
}
```

---

## ❌ Exercise 3 - PERLU DIPERBAIKI

### Original (Salah):

```dart
bool? exercise3() {
  double? price;
  //Uncomment kode dibawah ini
  //Perbaiki kode-nya agar tidak error
  //[TIPS] Hilangkan semua String selain angka 0-9 dan titik.
  //Gunakan Regex seperti ini: .replaceAll(RegExp(r'[^\d.]'), '')

  String text = "300.24a";
  price = double.tryParse(text) ?? 0;
  return price == 300.24;
}
```

**Status**: ❌ Minus Abu-Abu  
**Masalah**: `text` punya huruf 'a', sehingga `tryParse` gagal dan hasilnya `0`, bukan `300.24`

### Solusi (Benar):

```dart
bool? exercise3() {
  double? price;

  String text = "300.24a";

  // PERBAIKI: Hilangkan huruf 'a' dengan regex
  text = text.replaceAll(RegExp(r'[^\d.]'), '');  // "300.24a" → "300.24"
  price = double.tryParse(text) ?? 0;  // Parse "300.24" → 300.24

  return price == 300.24;  // ✅ true
}
```

---

## ❌ Exercise 4 - PERLU DIPERBAIKI

### Original (Salah):

```dart
bool exercise4() {
  int input = 12;
  // Tuliskan kode untuk memverifikasi apakah input adalah bilangan ganjil
  bool? output;
  return output == false;
}
```

**Status**: ❌ Minus Abu-Abu  
**Masalah**: Variable `output` tidak diisi

### Solusi (Benar):

```dart
bool exercise4() {
  int input = 12;

  // TAMBAHKAN KODE INI:
  output = input % 2 != 0;  // 12 % 2 = 0, jadi 0 != 0 = false ✅

  return output == false;  // ✅ true (12 adalah bilangan genap)
}
```

**Penjelasan**:

- `input % 2` = sisa bagi 2
- Bilangan ganjil: sisa bagi 2 = 1 (contoh: 13 % 2 = 1)
- Bilangan genap: sisa bagi 2 = 0 (contoh: 12 % 2 = 0)
- `12 % 2 != 0` → `0 != 0` → `false` (benar, 12 bukan ganjil)

---

## ❌ Exercise 5 - PERLU DIPERBAIKI

### Original (Salah):

```dart
bool? exercise5() {
  double? total;

  //Uncomment kode dibawah ini!
  //Perbaiki dengan meng-gunakan .tryParse("300aa")??0
  /*
  total = double.parse("300aa");
  */
  return total != null;
}
```

**Status**: ❌ Minus Abu-Abu  
**Masalah**: Kode masih di-comment, `total` masih `null`

### Solusi (Benar):

```dart
bool? exercise5() {
  double? total;

  // UNCOMMENT DAN PERBAIKI:
  total = double.tryParse("300aa") ?? 0;  // tryParse gagal → 0

  return total != null;  // ✅ true (total = 0, bukan null)
}
```

---

## ❌ Exercise 6 - PERLU DIPERBAIKI

### Solusi:

```dart
bool? exercise6() {
  int? age;

  // UNCOMMENT DAN PERBAIKI:
  age = int.tryParse("39ads") ?? 0;  // tryParse gagal → 0

  return age != null;  // ✅ true
}
```

---

## ❌ Exercise 7 - PERLU DIPERBAIKI

### Solusi:

```dart
bool? exercise7() {
  int price = 0;
  String value = "5000";

  // UNCOMMENT DAN PERBAIKI:
  price = int.parse(value);  // "5000" → 5000

  return price == 5000;  // ✅ true
}
```

---

## ❌ Exercise 8 - PERLU DIPERBAIKI

### Solusi:

```dart
bool? exercise8() {
  String text = "hello 'Deny', apa kabar?";
  String? name;

  // TAMBAHKAN KODE BERDASARKAN CONTOH:
  int startIndex = text.indexOf("'") + 1;  // Index setelah '
  int endIndex = text.lastIndexOf("'");    // Index sebelum ' terakhir
  name = text.substring(startIndex, endIndex);  // Ambil "Deny"

  return name == "Deny";  // ✅ true
}
```

---

## 🎯 Pola Umum Solusi

### **1. String → Number:**

```dart
String text = "100";
int number = int.parse(text);       // String → int
double num = double.parse("100.5"); // String → double
```

### **2. String Invalid → Number (Aman):**

```dart
String text = "100abc";
int number = int.tryParse(text) ?? 0;      // null → 0
double num = double.tryParse(text) ?? 0.0; // null → 0.0
```

### **3. Number → String:**

```dart
int price = 100;
String text = price.toString();  // 100 → "100"
```

### **4. Regex - Hilangkan Huruf:**

```dart
String text = "300.24abc";
text = text.replaceAll(RegExp(r'[^\d.]'), '');  // "300.24"
```

### **5. Substring - Ambil Text:**

```dart
String str = "hello 'world'";
int start = str.indexOf("'") + 1;   // 7
int end = str.lastIndexOf("'");     // 13
String result = str.substring(start, end);  // "world"
```

### **6. Cek Ganjil/Genap:**

```dart
int num = 12;
bool isGanjil = num % 2 != 0;   // false (12 genap)
bool isGenap = num % 2 == 0;    // true
```

---

## 🚀 Workflow Ideal

1. **Buka exercise page** (contoh: FbkDartVariable)
2. **Scroll dari atas** (exercise1, exercise2, ...)
3. **Untuk setiap exercise**:
   - Baca instruksi
   - Tulis kode sesuai instruksi
   - Save file (Cmd+S atau Ctrl+S)
   - Hot reload (r di terminal atau auto)
   - Cek icon: jika hijau ✅, lanjut; jika abu ❌, debug
4. **Target**: Semua exercise centang hijau!

---

## 💪 Motivasi

Setiap centang hijau adalah **achievement**! 🏆

- 1 centang = +1 Progress
- 10 centang = Quick Learner 🚀
- 35 centang (semua) = Master Variable! 👑

**Keep going! You can do it!** 💪✨
