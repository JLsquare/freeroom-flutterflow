import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD1RFATrYeXGgOg1fBIn6IwBxn6MSbMpd4",
            authDomain: "free-room-zyu508.firebaseapp.com",
            projectId: "free-room-zyu508",
            storageBucket: "free-room-zyu508.appspot.com",
            messagingSenderId: "455077469000",
            appId: "1:455077469000:web:5aab9fef6e086db18b317d"));
  } else {
    await Firebase.initializeApp();
  }
}
