# IQ TEST QUIZ

A production-oriented Flutter/Android architecture for a quiz + reward app.

## What is included
- Firebase Auth + Google Sign-In
- Firestore-backed profiles, quiz history, leaderboard
- Server-authoritative answer checking and coin awarding
- 15–30 second question timer
- RevenueCat / Google Play Billing integration
- AdMob rewarded ads
- Six coin products
- Firestore security rules
- Firebase Cloud Functions for answer submission, ad reward, and RevenueCat webhook

## Required setup
1. Install Flutter 3.29+ and Dart 3.7+.
2. Create a Firebase project and run `flutterfire configure` to generate `lib/firebase_options.dart`.
3. Enable Google provider in Firebase Authentication.
4. Create Firestore database.
5. Configure RevenueCat Android app + Google Play products using the product IDs in `lib/core/app_config.dart`.
6. Configure AdMob Android app ID and rewarded ad unit. Use Google's test IDs during development.
7. Deploy functions: `cd functions && npm install && npm run build && firebase deploy --only functions`.
8. Deploy Firestore rules: `firebase deploy --only firestore:rules`.
9. In Google Play Console create the six one-time in-app products. Play Points and eligible coupons/discounts are applied by Google Play checkout; the app does not implement a private coupon engine.

## Important security model
The Flutter client can read its own profile and quiz questions, but cannot directly modify coin balances. Coin grants happen through trusted Cloud Functions/transactions. For maximum anti-cheat protection, production quiz question documents should not expose the correct answer to clients; the included callable `submitAnswer` validates the answer server-side.

## Product IDs
- starter_100
- basic_200
- value_500
- pro_master_1200
- mega_ultra_4000
- ultimate_vip_5000

RevenueCat should map these products into a current Offering. If you want to keep purchases fully server-authoritative, configure a RevenueCat webhook to `/revenuecatWebhook` and grant coins there.
