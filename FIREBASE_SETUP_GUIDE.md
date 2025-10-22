# Magic Book - Firebase Integration Setup

## Overview
Magic Book sekarang terintegrasi dengan Firebase untuk:
- **Google SSO Authentication**
- **Firestore Database** untuk menyimpan data user dan progress exercise
- **Real-time progress tracking**

## Features Implemented

### 1. Authentication System
- Google Sign-In integration
- User profile management (nama, jurusan, kelas, absen)
- Automatic user creation in Firestore

### 2. Data Models
- **UserModel**: Menyimpan informasi user lengkap
- **ExerciseProgress**: Tracking progress per exercise
- **ModuleProgress**: Summary progress per module

### 3. UI Screens
- **LoginScreen**: Google SSO login
- **ProfileSetupScreen**: Setup profil user
- **MainNavigationScreen**: Dashboard utama dengan 4 tab
- **ExerciseDetailScreen**: Detail exercise dengan code editor dan UI preview
- **ModuleExercisesScreen**: List exercises dalam module

### 4. Reusable Components
- **ReusableCard**: Card component yang konsisten
- **ReusableButton**: Button dengan loading state
- **ReusableTextField**: Form input yang seragam
- **ReusableProgressIndicator**: Progress bar component
- **ReusableLoadingWidget**: Loading indicator

## Firebase Setup Required

### 1. Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create new project: `magicbook-app`
3. Enable Authentication and Firestore Database

### 2. Configure Authentication
1. Go to Authentication > Sign-in method
2. Enable Google provider
3. Add your app's SHA-1 fingerprint (for Android)

### 3. Configure Firestore
1. Go to Firestore Database
2. Create database in production mode
3. Set up security rules (see below)

### 4. Download Configuration Files
1. Download `google-services.json` for Android
2. Download `GoogleService-Info.plist` for iOS
3. Replace the sample files in the project

### 5. Update Package Names
Update the following files with your actual package names:
- `android/app/build.gradle` - applicationId
- `android/app/google-services.json` - package_name
- `ios/Runner/GoogleService-Info.plist` - BUNDLE_ID

## Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Exercise progress - users can read/write their own progress
    match /exercise_progress/{progressId} {
      allow read, write: if request.auth != null && 
        resource.data.userId == request.auth.uid;
    }
    
    // Module progress - users can read/write their own progress
    match /module_progress/{progressId} {
      allow read, write: if request.auth != null && 
        resource.data.userId == request.auth.uid;
    }
  }
}
```

## Database Structure

### Users Collection
```json
{
  "uid": "user_uid",
  "email": "user@example.com",
  "displayName": "User Name",
  "photoURL": "https://...",
  "nama": "Nama Lengkap",
  "jurusan": "Teknik Informatika",
  "kelas": "TI-2023",
  "absen": "01",
  "createdAt": "timestamp",
  "updatedAt": "timestamp"
}
```

### Exercise Progress Collection
```json
{
  "id": "user_id_exercise_id",
  "userId": "user_uid",
  "moduleId": "EFD1100",
  "exerciseId": "exercise_1",
  "isCompleted": true,
  "score": 85,
  "userCode": "// user's code here",
  "uiPreview": "{\"type\":\"row\",\"children\":[...]}",
  "metadata": {},
  "completedAt": "timestamp",
  "updatedAt": "timestamp"
}
```

### Module Progress Collection
```json
{
  "moduleId": "EFD1100",
  "userId": "user_uid",
  "totalExercises": 10,
  "completedExercises": 7,
  "completionPercentage": 70.0,
  "totalScore": 650,
  "lastAccessed": "timestamp",
  "updatedAt": "timestamp"
}
```

## UI Preview System

Untuk exercise UI (Row/Column), sistem menyimpan preview dalam format JSON:

```json
{
  "type": "row",
  "children": [
    {
      "type": "container",
      "text": "A",
      "color": "#FF0000"
    },
    {
      "type": "container", 
      "text": "B",
      "color": "#00FF00"
    }
  ]
}
```

## Running the App

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Setup Firebase Configuration**
   - Replace sample config files with your actual Firebase config
   - Update package names in configuration files

3. **Run the App**
   ```bash
   flutter run
   ```

## Testing

1. **Authentication Flow**
   - Test Google Sign-In
   - Test profile setup
   - Test logout functionality

2. **Data Persistence**
   - Test user data saving
   - Test exercise progress tracking
   - Test module progress calculation

3. **UI Preview**
   - Test Row/Column exercise preview
   - Test code editor functionality
   - Test progress saving

## Next Steps

1. **Real Firebase Configuration**
   - Replace sample config files
   - Set up proper security rules
   - Configure production environment

2. **Enhanced Features**
   - Add more exercise types
   - Implement code validation
   - Add social features (leaderboard, sharing)

3. **Performance Optimization**
   - Implement caching
   - Optimize Firestore queries
   - Add offline support

## Troubleshooting

### Common Issues
1. **Google Sign-In not working**
   - Check SHA-1 fingerprint
   - Verify package name matches
   - Ensure Google provider is enabled

2. **Firestore permission denied**
   - Check security rules
   - Verify user authentication
   - Check collection/document paths

3. **Build errors**
   - Run `flutter clean`
   - Run `flutter pub get`
   - Check Firebase configuration files

### Support
For issues related to Firebase setup, refer to:
- [Firebase Flutter Documentation](https://firebase.flutter.dev/)
- [Google Sign-In Flutter Plugin](https://pub.dev/packages/google_sign_in)
- [Cloud Firestore Flutter Plugin](https://pub.dev/packages/cloud_firestore)
