# Preserve generic type information
-keepattributes Signature
-keepattributes RuntimeVisibleAnnotations

# Preserve all classes and members of the library
-keep class com.dexterous.** { *; }
-keepclassmembers class com.dexterous.** { *; }

-keep class com.google.common.reflect.TypeToken
-keep class * extends com.google.common.reflect.TypeToken

-keep class com.google.gson.reflect.TypeToken
-keep class * extends com.google.gson.reflect.TypeToken