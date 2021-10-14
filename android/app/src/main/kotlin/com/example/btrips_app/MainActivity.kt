package com.example.revolution

// import io.flutter.app.FlutterFragmentActivity

// import io.flutter.embedding.android.FlutterActivity

// class MainActivity : FlutterFragmentActivity() {}
// class MainActivity : FlutterActivity() {}

// import android.os.Bundle
// import io.flutter.app.FlutterFragmentActivity
// import io.flutter.plugins.GeneratedPluginRegistrant

// class MainActivity: FlutterFragmentActivity() {
//    override fun onCreate(savedInstanceState: Bundle?) {
//       super.onCreate(savedInstanceState)
//       GeneratedPluginRegistrant.registerWith(this)
//   }
// }

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
