# Keep the JS-to-native TTS bridge methods reachable from WebView's JavaScript engine.
-keepclassmembers class com.countit.kids.MainActivity$TtsBridge {
    public *;
}
