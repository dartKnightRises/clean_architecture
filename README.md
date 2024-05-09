# clean_architecture

A new Flutter project for understanding clean architecture.

## Explaination

This code defines several functions that return `TextStyle` objects with predefined characteristics. Let's break it down step by step:

1. **Import Statement**: This line imports the material package from Flutter, which contains widgets and classes for building UIs.

```dart
import 'package:flutter/material.dart';
```

2. **Import Font Manager**: This line imports a file named `font_manager.dart`, which likely contains constants or definitions related to fonts used in the application.

```dart
import 'font_manager.dart';
```

3. **Private Function `_getTextStyle`**: This function takes four parameters: `fontSize`, `fontFamily`, `fontWeight`, and `color`, and returns a `TextStyle` object with the specified characteristics.

```dart
TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}
```

4. **Text Style Functions**: Below are several functions, each representing a specific text style. Each function takes two parameters: `fontSize` and `color`, with `fontSize` having a default value of `FontSize.s12` and `color` being required. These functions utilize the `_getTextStyle` function to create the desired `TextStyle` object.

    - `getRegularStyle`: Returns a regular text style.
    - `getLightStyle`: Returns a light text style.
    - `getBoldStyle`: Returns a bold text style.
    - `getSemiBoldStyle`: Returns a semi-bold text style.
    - `getMediumStyle`: Returns a medium text style.

```dart
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// Other text style functions follow the same pattern...
```

Each of these functions provides a convenient way to obtain a `TextStyle` object with predefined characteristics such as font size, font family, font weight, and color, reducing redundancy and improving code readability when applying consistent text styles throughout the application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
