## 0.0.1

* # RNavNSheet

[![Pub](https://img.shields.io/pub/v/r_nav_n_sheet.svg)](https://pub.dartlang.org/packages/r_nav_n_sheet)
[![License](https://img.shields.io/badge/licence-Apache2-green.svg)](https://github.com/rajyadavnp/r_nav_n_sheet/blob/main/LICENSE)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/rajyadavnp/r_nav_n_sheet.svg)](https://github.com/rajyadavnp/r_nav_n_sheet)
[![GitHub stars](https://img.shields.io/github/stars/rajyadavnp/r_nav_n_sheet.svg?style=social)](https://github.com/rajyadavnp/r_nav_n_sheet)

Animated, modern and highly customisable bottom navigation bar for flutter

## Features

- Animated, modern looking and highly customizable bottom navigation bar
- Custom bottom sheet with center docked action button to toggle the bottom sheet

| DEMO 1 | DEMO 2 | DEMO 3 |
|--------|--------|--------|
|![DEMO1](https://raw.githubusercontent.com/rajyadavnp/r_nav_n_sheet/main/demo/rnns_normal.gif)|![DEMO2](https://raw.githubusercontent.com/rajyadavnp/r_nav_n_sheet/main/demo/rnns_gradient.gif)|![DEMO3](https://raw.githubusercontent.com/rajyadavnp/r_nav_n_sheet/main/demo/rnns_tabs.gif)|

## Getting started

- Add ```r_nav_n_sheet: <latest_version>``` to ```pubspec.yaml```
- Run ```flutter pub get``` in the terminal in the project directory or select ```pub get``` from
  within   ```pubspec.yaml``` file
- Add import statement,

```dart
import 'package:r_nav_n_sheet/r_nav_n_sheet.dart';
```

## Usage

```dart

@override
Widget build(BuildContext context) {
  return Scaffold(
    //Other scaffold properties
      bottomNavigationBar: RNavNSheet(
        sheet: MySheet(), //Replace MySheet with your own bottom sheet
        items: const [
          RNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: "Home",
          ),
          RNavItem(
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
            label: "Search",
          ),
          RNavItem(
            icon: Icons.shopping_cart_outlined,
            activeIcon: Icons.shopping_cart,
            label: "Cart",
          ),
          RNavItem(
            icon: Icons.person,
            activeIcon: Icons.person_outline,
            label: "Account",
          ),
        ],
      )
  );
}
```

## Additional information

For full implementation, see [example](https://github.com/rajyadavnp/r_nav_n_sheet/tree/main/example)

## 0.0.2

**1. Example added**

## 0.0.3

* No changes

## 0.0.4

* No changes

## 1.0.0

**1. Code documentation**

## 1.0.1

**1. Repaint bug fixes**

## 1.0.2

**1. Hide [ModalBarrier](https://api.flutter.dev/flutter/widgets/ModalBarrier-class.html) on bottomSheet close