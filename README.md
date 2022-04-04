## RNavNSheet

[![Pub](https://img.shields.io/pub/v/r_nav_n_sheet.svg)](https://pub.dartlang.org/packages/r_nav_n_sheet)
[![License](https://img.shields.io/badge/licence-Apache2-green.svg)](https://github.com/rajyadavnp/r_nav_n_sheet/blob/master/LICENSE)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/rajyadavnp/r_nav_n_sheet.svg)](https://github.com/rajyadavnp/r_nav_n_sheet)
[![GitHub stars](https://img.shields.io/github/stars/rajyadavnp/r_nav_n_sheet.svg?style=social)](https://github.com/rajyadavnp/r_nav_n_sheet)

Animated, modern and highly customisable bottom navigation bar for flutter

## Features

- Animated, modern looking and highly customizable bottom navigation bar
- Custom bottom sheet with center docked action button to toggle the bottom sheet

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

For full implementation, see example