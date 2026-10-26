# FreshCart – Flutter grocery shopping app

Features: product catalogue, category filter, search, cart with quantities,
checkout form with validation and payment choice (demo – no real payment).

## Build the APK

```bash
flutter create --org com.example --project-name fresh_cart fresh_cart_app
cd fresh_cart_app
# copy lib/ and pubspec.yaml from this project over the generated ones
flutter pub get
flutter run                    # test on emulator/phone
flutter build apk --release    # output: build/app/outputs/flutter-apk/app-release.apk
```
