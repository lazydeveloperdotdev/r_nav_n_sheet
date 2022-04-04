import 'package:flutter/material.dart';
import 'package:r_nav_n_sheet/r_nav_n_sheet.dart';
import 'package:r_nav_n_sheet_example/sheet.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  bool _open = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("RNavNSheet"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Remix.notification_2_fill),
            onPressed: () {},
          ),
        ],
      ),
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              [
                Remix.home_6_fill,
                Remix.search_2_fill,
                Remix.shopping_cart_2_fill,
                Remix.user_3_fill
              ][_index],
              color: theme.colorScheme.secondary,
              size: 48,
            ),
            const SizedBox(height: 10),
            Text(
              ["Home", "Search", "Cart", "Account"][_index],
              textScaleFactor: 2.0,
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RNavNSheet(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        backgroundGradient: _open
            ? const LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.red,
                  Colors.amber,
                ],
              )
            : const LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.teal,
                  Colors.red,
                ],
              ),
        borderColors: const [
          Colors.indigo,
          Colors.amber,
          Colors.red,
        ],
        unselectedItemGradient: LinearGradient(
          colors: [
            Colors.white,
            theme.colorScheme.secondary,
            Colors.white10,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        selectedItemGradient: LinearGradient(
          colors: [
            Colors.white,
            theme.colorScheme.secondary.withOpacity(0.3),
            Colors.white,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        initialSelectedIndex: _index,
        sheet: Sheet(),
        sheetOpenIcon: Remix.menu_4_line,
        sheetCloseIcon: Remix.add_line,
        sheetOpenIconBoxColor: Colors.white70,
        sheetCloseIconBoxColor: Colors.white,
        sheetCloseIconColor: Colors.teal,
        sheetOpenIconColor: Colors.red,
        onSheetToggle: (v) {
          setState(() {
            _open = v;
          });
        },
        items: const [
          RNavItem(
            activeIcon: Remix.home_6_fill,
            icon: Remix.home_6_line,
            label: "Home",
          ),
          RNavItem(
            icon: Remix.search_2_line,
            activeIcon: Remix.search_2_fill,
            label: "Search",
          ),
          RNavItem(
            icon: Remix.shopping_cart_2_line,
            activeIcon: Remix.shopping_cart_2_fill,
            label: "Cart",
          ),
          RNavItem(
            icon: Remix.user_3_line,
            activeIcon: Remix.user_3_fill,
            label: "Account",
          ),
        ],
      ),
    );
  }
}
