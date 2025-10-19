# Security Configuration

## Firebase Configuration

This project uses Firebase for backend services. To set up the project securely:

### 1. Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing project
3. Add your app to the project

### 2. Download Configuration Files

**For Android:**
- Download `google-services.json` from Firebase Console
- Place it in `android/app/google-services.json`

**For iOS:**
- Download `GoogleService-Info.plist` from Firebase Console  
- Place it in `ios/Runner/GoogleService-Info.plist`

### 3. Generate Firebase Options

Run the following command to generate `lib/firebase_options.dart`:

```bash
flutterfire configure
```

### 4. Environment Variables (Optional)

Create a `.env` file in the root directory:

```env
FIREBASE_API_KEY_IOS=your_ios_api_key
FIREBASE_API_KEY_ANDROID=your_android_api_key
FIREBASE_API_KEY_WEB=your_web_api_key
FIREBASE_PROJECT_ID=your_project_id
```

### 5. Security Best Practices

- ✅ Never commit API keys to version control
- ✅ Use environment variables for sensitive data
- ✅ Rotate API keys regularly
- ✅ Use Firebase Security Rules
- ✅ Enable App Check for additional security

### 6. Files to Keep Secure

The following files contain sensitive information and should not be committed:

- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `.env` files
- `lib/config/firebase_config.dart`

### 7. If API Keys are Exposed

If your API keys are accidentally exposed:

1. **Immediately rotate the keys** in Firebase Console
2. **Revoke old keys** to prevent unauthorized access
3. **Update your app** with new configuration files
4. **Monitor usage** for any suspicious activity

## Contact

For security concerns, contact the development team immediately.
