# RNavNSheet

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
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: "Account",
          ),
        ],
      )
  );
}
```

## Additional information

For full implementation,
see [example](https://github.com/rajyadavnp/r_nav_n_sheet/tree/main/example)

### RNavItem

| Attributes | Type | Description |
| ---------- | ---- | ----------- |
| ```icon``` | ```IconData``` | icon when item is not selected |
| ```activeIcon``` | ```IconData?``` | icon when item is selected, ```icon``` is used if ```activeIcon``` not passed |
| ```label``` | ```String``` | label for the item |

### RNavNSheet

| Attributes | Type | Description |
| ---------- | ---- | ----------- |
| ```items``` | ```List<RNavItem>``` | list of bottom navigation items |
| ```initialSelectedIndex``` | ```int?``` | index of default selected item |
| ```sheet``` | ```Widget?``` | bottom sheet to be displayed on dock icon click |
| ```sheetOpenIcon``` | ```IconData?``` | toggle button icon when sheet is open |
| ```sheetCloseIcon``` | ```IconData?``` | toggle button icon when sheet is closed |
| ```sheetOpenIconBoxColor``` | ```Color?``` | toggle button background color when sheet is open |
| ```sheetCloseIconBoxColor``` | ```Color?``` | toggle button background color when sheet is closed |
| ```sheetOpenIconColor``` | ```Color?``` | toggle button foreground color when sheet is open |
| ```sheetCloseIconColor``` | ```Color?``` | toggle button foreground color when sheet is closed |
| ```sheetIconRotateAngle``` | ```double?``` | angle (in radians) to rotate toggle button when sheet is open |
| ```sheetToggleDecoration``` | ```BoxDecoration?``` | decoration for toggle button |
| ```borderColors``` | ```List<Color>?``` | list of colors for border over nav bar (gradient from left to right) |
| ```backgroundColor``` | ```Color?``` | background color of nav bar |
| ```backgroundGradient``` | ```Gradient?``` | background gradient of nav bar |
| ```selectedItemColor``` | ```Color?``` | color of selected nav item (overrides gradient) |
| ```unselectedItemColor``` | ```Color?``` | color of unselected nav item |
| ```selectedItemGradient``` | ```Gradient?``` | gradient of selected nav item |
| ```unselectedItemGradient``` | ```Gradient?``` | gradient of unselected nav item |
| ```onTap``` | ```void Function(int)?``` | function callback that returns index of selected item |
| ```onSheetToggle``` | ```void Function(bool)?``` | function callback that returns  ```true``` if sheet is open and ```false``` if sheet is closed |
