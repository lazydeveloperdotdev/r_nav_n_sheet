import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r_nav_n_sheet/r_nav_n_sheet.dart';

void main() {
  test('adds one to input values', () {
    final nav = RNavNSheet(items: const [
      RNavItem(icon: Icons.home, label: "Home"),
      RNavItem(icon: Icons.search, label: "Search"),
    ]);
    findsNWidgets(nav.items.length);
  });
}
