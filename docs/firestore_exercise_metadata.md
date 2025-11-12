# Firestore Exercise Metadata Structure

## Overview

Metadata exercise disimpan di Firestore untuk memungkinkan update tanpa update app. Kode exercise tetap di local file Dart.

## Collection Structure

```
exercise_metadata/
  ├── {moduleId}/
  │   ├── moduleId: string
  │   ├── exercises: array<ExerciseMetadata>
  │   └── updatedAt: timestamp
```

## Exercise Metadata Document

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
      "instructions": "Buat variabel price bertipe String dan isi nilainya. Pastikan TIDAK menggunakan tipe int tanpa quotes (contoh: 100). Contoh benar: \"100\" (String)",
      "difficulty": "Easy",
      "isValidated": false,
      "hint": "Gunakan String? price = \"100\";",
      "example": null,
      "updatedAt": "2024-01-01T00:00:00Z"
    },
    {
      "id": "EFD1100_ex2",
      "moduleId": "EFD1100",
      "number": 2,
      "title": "Konversi String ke Double",
      "description": "Ubah parameter text (String) menjadi double, dan return hasilnya",
      "instructions": "Ubah parameter text (String) menjadi double, dan return hasilnya. Gunakan double.parse()",
      "difficulty": "Easy",
      "isValidated": true,
      "hint": "Gunakan double.parse(text)",
      "example": "Input: \"100.24\" Output: 100.24 (double)",
      "updatedAt": "2024-01-01T00:00:00Z"
    }
  ],
  "updatedAt": "2024-01-01T00:00:00Z"
}
```

## Field Descriptions

### Module Level
- `moduleId` (string): ID module (e.g., "EFD1100")
- `exercises` (array): Array of exercise metadata
- `updatedAt` (timestamp): Last update time

### Exercise Level
- `id` (string): Exercise ID (e.g., "EFD1100_ex1")
- `moduleId` (string): Module ID
- `number` (number): Exercise number (1, 2, 3, ...)
- `title` (string): Exercise title
- `description` (string): Short description
- `instructions` (string): Detailed instructions
- `difficulty` (string): Difficulty level ("Easy", "Medium", "Hard")
- `isValidated` (boolean): Whether exercise has automated validation
- `hint` (string, optional): Hint for the exercise
- `example` (string, optional): Example input/output
- `updatedAt` (timestamp, optional): Last update time

## Usage

### 1. Load Metadata from Firestore

```dart
final metadataService = ExerciseMetadataService();
final exercises = await metadataService.getModuleExerciseMetadata('EFD1100');
```

### 2. Save Metadata to Firestore

```dart
final metadataService = ExerciseMetadataService();
await metadataService.saveModuleExerciseMetadata('EFD1100', metadataList);
```

### 3. Upload Metadata (Admin)

```bash
# From JSON file
dart run tools/upload_exercise_metadata.dart --module EFD1100 --file assets/exercises/efd1100_exercises.json

# From hardcoded data
dart run tools/upload_exercise_metadata.dart --module EFD1100 --from-hardcoded
```

## Benefits

1. **Update tanpa update app**: Metadata bisa di-update di Firestore tanpa perlu update app
2. **Real-time updates**: Menggunakan Firestore streams untuk real-time updates
3. **Offline support**: Firestore menyediakan offline caching
4. **Kode tetap local**: Kode exercise tetap di local file Dart, tidak perlu upload ke backend
5. **Flexible**: Bisa update metadata kapan saja tanpa deploy app baru

## Migration

Untuk migrate dari hardcoded data ke Firestore:

1. Generate JSON dari hardcoded data
2. Upload ke Firestore menggunakan script
3. App akan otomatis load dari Firestore jika tersedia

## Security Rules

```javascript
// Firestore Security Rules
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

