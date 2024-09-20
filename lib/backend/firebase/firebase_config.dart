import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCvSgNccGbYDO8yxkZOWLPbvsS-LjPcqiU",
            authDomain: "travel-lite-7irmx2.firebaseapp.com",
            projectId: "travel-lite-7irmx2",
            storageBucket: "travel-lite-7irmx2.appspot.com",
            messagingSenderId: "294703838025",
            appId: "1:294703838025:web:a965bcea260c69d5b3e098"));
  } else {
    await Firebase.initializeApp();
  }
}
