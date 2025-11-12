# Cara Menggunakan Exercise Metadata System

## Overview

Sistem ini memungkinkan:
1. **Metadata di Backend (Firestore)**: Title, description, instructions, hint, example, difficulty, isValidated
2. **Kode Exercise di Local**: Kode exercise tetap di file Dart local (`lib/module/.../exercises/..._exercises.dart`)
3. **Update tanpa Update App**: Metadata bisa di-update di Firestore tanpa perlu update app

## Arsitektur

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUTTER APP                              │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  ModuleExerciseService.getModuleExercises()          │  │
│  │                                                       │  │
│  │  Priority 1: Firestore (Backend)                     │  │
│  │  Priority 2: JSON File (Local Asset)                 │  │
│  │  Priority 3: Parse Dart File (Development Only)      │  │
│  │  Priority 4: Hardcoded Data (Fallback)               │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  Exercise Code (Local File Dart)                     │  │
│  │  - lib/module/efd1100_variable/exercises/            │  │
│  │    efd1100_exercises.dart                            │  │
│  │  - User mengerjakan exercise di file ini             │  │
│  │  - Validator membaca dari file ini                   │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                          │
                          │ Metadata Only
                          ▼
┌─────────────────────────────────────────────────────────────┐
│                    FIRESTORE (Backend)                      │
│                                                             │
│  Collection: exercise_metadata                              │
│  Document: {moduleId}                                       │
│  Fields:                                                    │
│    - moduleId: string                                       │
│    - exercises: array<ExerciseMetadata>                     │
│    - updatedAt: timestamp                                   │
│                                                             │
│  ExerciseMetadata:                                          │
│    - id: string                                             │
│    - title: string                                          │
│    - description: string                                    │
│    - instructions: string                                   │
│    - difficulty: string                                     │
│    - isValidated: boolean                                   │
│    - hint: string (optional)                                │
│    - example: string (optional)                             │
└─────────────────────────────────────────────────────────────┘
```

## Flow

1. **App Load Exercise List**:
   - Coba load dari Firestore (backend)
   - Jika tidak ada, load dari JSON file (local)
   - Jika tidak ada, parse dari Dart file (development only)
   - Jika tidak ada, gunakan hardcoded data

2. **User Mengerjakan Exercise**:
   - Buka file Dart: `lib/module/efd1100_variable/exercises/efd1100_exercises.dart`
   - Edit kode di file tersebut
   - Validator membaca dari file Dart ini

3. **Admin Update Metadata**:
   - Update metadata di Firestore
   - App akan otomatis load metadata baru (real-time atau setelah restart)

## Setup

### 1. Upload Metadata ke Firestore

#### Option A: Dari JSON File

```bash
# 1. Buat file JSON
# assets/exercises/efd1100_exercises.json
{
  "moduleId": "EFD1100",
  "exercises": [
    {
      "id": "EFD1100_ex1",
      "number": 1,
      "title": "Type Check",
      "description": "Buat variabel price bertipe String dan isi nilainya",
      "instructions": "Buat variabel price bertipe String dan isi nilainya. Pastikan TIDAK menggunakan tipe int tanpa quotes (contoh: 100). Contoh benar: \"100\" (String)",
      "difficulty": "Easy",
      "isValidated": false,
      "hint": "Gunakan String? price = \"100\";"
    }
  ]
}

# 2. Upload ke Firestore
dart run tools/upload_exercise_metadata.dart --module EFD1100 --file assets/exercises/efd1100_exercises.json
```

#### Option B: Dari Hardcoded Data

```bash
dart run tools/upload_exercise_metadata.dart --module EFD1100 --from-hardcoded
```

#### Option C: Manual di Firestore Console

1. Buka Firebase Console
2. Pilih Firestore Database
3. Buat collection `exercise_metadata`
4. Buat document dengan ID `EFD1100`
5. Tambah field `exercises` (array)
6. Tambah exercise metadata ke array

### 2. Verify Metadata di App

```dart
// App akan otomatis load dari Firestore
final exercises = await ModuleExerciseService.getModuleExercises('EFD1100');
// Metadata akan di-load dari Firestore jika tersedia
```

## Update Metadata

### Via Firestore Console

1. Buka Firebase Console
2. Pilih Firestore Database
3. Pilih collection `exercise_metadata`
4. Pilih document `EFD1100`
5. Edit field `exercises` array
6. Save changes

### Via Code

```dart
final metadataService = ExerciseMetadataService();

// Update single exercise
final metadata = ExerciseMetadata(
  id: 'EFD1100_ex1',
  moduleId: 'EFD1100',
  number: 1,
  title: 'Updated Title',
  description: 'Updated Description',
  instructions: 'Updated Instructions',
  difficulty: 'Easy',
  isValidated: false,
  hint: 'Updated Hint',
);

await metadataService.saveExerciseMetadata(metadata);
```

## Real-time Updates

```dart
// Listen to metadata changes
final metadataService = ExerciseMetadataService();
metadataService.watchModuleExerciseMetadata('EFD1100').listen((metadataList) {
  // Update UI when metadata changes
  print('Metadata updated: ${metadataList.length} exercises');
});
```

## Benefits

1. **Update tanpa Update App**: Metadata bisa di-update tanpa perlu update app
2. **Kode tetap Local**: Kode exercise tetap di local file Dart
3. **Real-time Updates**: Menggunakan Firestore streams untuk real-time updates
4. **Offline Support**: Firestore menyediakan offline caching
5. **Flexible**: Bisa update metadata kapan saja tanpa deploy app baru

## FAQ

### Q: Apakah kode exercise bisa di-upload ke backend?
A: Tidak perlu. Kode exercise tetap di local file Dart. Hanya metadata yang disimpan di backend.

### Q: Bagaimana jika metadata tidak ada di Firestore?
A: App akan fallback ke JSON file, parse dari Dart file, atau hardcoded data.

### Q: Bagaimana update metadata?
A: Update di Firestore Console atau menggunakan script upload. App akan otomatis load metadata baru.

### Q: Apakah kode exercise bisa di-download dari backend?
A: Tidak. Kode exercise tetap di local file Dart. User mengerjakan exercise di file local tersebut.

## Security

### Firestore Security Rules

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

## Next Steps

1. Upload metadata untuk semua module ke Firestore
2. Update app untuk menggunakan metadata dari Firestore
3. Setup Firestore security rules
4. Test real-time updates
5. Setup admin panel untuk update metadata

