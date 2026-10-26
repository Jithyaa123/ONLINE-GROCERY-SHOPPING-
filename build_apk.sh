#!/usr/bin/env bash
# Run this from inside the freshcart folder, with Flutter installed.
set -e
flutter create --org com.freshcart --project-name freshcart --platforms android .
flutter pub get
flutter build apk --release
echo
echo "APK ready at: build/app/outputs/flutter-apk/app-release.apk"
