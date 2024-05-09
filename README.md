# clean_architecture

A new Flutter project for understanding clean architecture.

## Explaination

This code defines a `ColorManager` class and an extension method `HexColor` on the `Color` class in Flutter. Let's break it down:

1. **Import Statement**: This line imports the material package from Flutter, which contains widgets and classes for building UIs.

```dart
import 'package:flutter/material.dart';
```

2. **ColorManager Class**: This class holds static properties representing different colors. Each color is defined using the `HexColor.fromHex` method, which converts a hexadecimal color string to a `Color` object.

```dart
class ColorManager {
  static Color primary = HexColor.fromHex("#ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
}
```

3. **Extension Method**: This extension method extends the functionality of the `Color` class. It provides a static method `fromHex` that takes a hexadecimal color string as input and returns a `Color` object corresponding to that color.

```dart
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
```

This extension method allows you to directly convert hexadecimal color strings to `Color` objects without having to create an instance of the `Color` class explicitly.

Overall, this code provides a convenient way to manage and use colors in a Flutter application by defining them statically and allowing conversion from hexadecimal color strings.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
