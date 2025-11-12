# Exercise Metadata System - Backend Integration

## 🎯 Overview

Sistem ini memungkinkan **metadata exercise disimpan di Firestore (backend)** sementara **kode exercise tetap di local file Dart**. Ini memungkinkan update metadata tanpa perlu update app.

## 📋 Arsitektur

```
┌─────────────────────────────────────────────────────────┐
│                   FLUTTER APP                          │
│                                                         │
│  Metadata (Title, Description, Hint, etc.)            │
│  └─> Load dari Firestore (Backend)                    │
│                                                         │
│  Kode Exercise (Dart Code)                            │
│  └─> Local File: lib/module/.../exercises/..._exercises.dart │
│                                                         │
└─────────────────────────────────────────────────────────┘
                          │
                          │ Metadata Only
                          ▼
┌─────────────────────────────────────────────────────────┐
│              FIRESTORE (Backend)                       │
│                                                         │
│  Collection: exercise_metadata                         │
│  Document: {moduleId}                                   │
│  Fields:                                                │
│    - exercises: array<ExerciseMetadata>                 │
│    - updatedAt: timestamp                               │
└─────────────────────────────────────────────────────────┘
```

## ✅ Benefits

1. **Update Metadata tanpa Update App**: Metadata bisa di-update di Firestore tanpa perlu update app
2. **Kode Exercise tetap Local**: Kode exercise tetap di local file Dart, user mengerjakan di file tersebut
3. **Real-time Updates**: Menggunakan Firestore streams untuk real-time updates
4. **Offline Support**: Firestore menyediakan offline caching
5. **Flexible**: Bisa update metadata kapan saja tanpa deploy app baru

## 🚀 Quick Start

### 1. Upload Metadata ke Firestore

#### Option A: Dari App (Recommended)

```dart
// Upload hardcoded metadata ke Firestore
await ModuleExerciseService.uploadHardcodedMetadataToFirestore('EFD1100');
```

#### Option B: Dari JSON File

```bash
# 1. Buat file JSON: assets/exercises/efd1100_exercises.json
# 2. Upload ke Firestore
dart run tools/upload_exercise_metadata.dart --module EFD1100 --file assets/exercises/efd1100_exercises.json
```

#### Option C: Manual di Firestore Console

1. Buka [Firebase Console](https://console.firebase.google.com/)
2. Pilih Firestore Database
3. Buat collection `exercise_metadata`
4. Buat document dengan ID `EFD1100`
5. Tambah field `exercises` (array)
6. Tambah exercise metadata ke array

### 2. Verify di App

```dart
// App akan otomatis load dari Firestore
final exercises = await ModuleExerciseService.getModuleExercises('EFD1100');
// Metadata akan di-load dari Firestore jika tersedia
```

## 📊 Priority Loading

App akan load exercise metadata dengan priority:

1. **Firestore (Backend)** - PRIORITAS TERTINGGI
2. JSON File (Local Asset)
3. Parse dari Dart File (Development Only)
4. Hardcoded Data (Fallback)

## 📝 Struktur Firestore

```json
{
  "moduleId": "EFD1100",
  "exercises": [
    {
      "id": "EFD1100_ex1",
      "moduleId": "EFD1100",
      "number": 1,
      "title": "Type Check",
      "description": "Buat variabel price bertipe String dan isi nilainya",
      "instructions": "Buat variabel price bertipe String dan isi nilainya...",
      "difficulty": "Easy",
      "isValidated": false,
      "hint": "Gunakan String? price = \"100\";",
      "example": null,
      "updatedAt": "2024-01-01T00:00:00Z"
    }
  ],
  "updatedAt": "2024-01-01T00:00:00Z"
}
```

## 🔧 Usage

### Load Metadata dari Firestore

```dart
final metadataService = ExerciseMetadataService();
final exercises = await metadataService.getModuleExerciseMetadata('EFD1100');
```

### Save Metadata ke Firestore

```dart
final metadataService = ExerciseMetadataService();
await metadataService.saveModuleExerciseMetadata('EFD1100', metadataList);
```

### Real-time Updates

```dart
final metadataService = ExerciseMetadataService();
metadataService.watchModuleExerciseMetadata('EFD1100').listen((metadataList) {
  // Update UI when metadata changes
  print('Metadata updated: ${metadataList.length} exercises');
});
```

## 🔐 Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Exercise metadata - read only for users, write for admins
    match /exercise_metadata/{moduleId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
                      get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
  }
}
```

## 📚 Documentation

- [Firestore Structure](./docs/firestore_exercise_metadata.md)
- [Usage Guide](./docs/exercise_metadata_usage.md)

## ❓ FAQ

### Q: Apakah kode exercise bisa di-upload ke backend?

**A: Tidak perlu.** Kode exercise tetap di local file Dart. Hanya metadata yang disimpan di backend.

### Q: Bagaimana jika metadata tidak ada di Firestore?

**A: App akan fallback** ke JSON file, parse dari Dart file, atau hardcoded data.

### Q: Bagaimana update metadata?

**A: Update di Firestore Console** atau menggunakan method `uploadHardcodedMetadataToFirestore()`. App akan otomatis load metadata baru.

### Q: Apakah kode exercise bisa di-download dari backend?

**A: Tidak.** Kode exercise tetap di local file Dart. User mengerjakan exercise di file local tersebut.

## 🎉 Next Steps

1. Upload metadata untuk semua module ke Firestore
2. Test real-time updates
3. Setup Firestore security rules
4. Setup admin panel untuk update metadata (optional)

