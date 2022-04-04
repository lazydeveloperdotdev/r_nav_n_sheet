library r_nav_n_sheet;

import 'dart:math' show max, pi;

import 'package:flutter/material.dart';

part 'src/bottom_clipper.dart';

part 'src/bottom_painter.dart';

part 'src/r_nav_item.dart';

part 'src/sheet_toggle_button.dart';

/// Animated, modern and highly customisable [BottomNavigationBar]
class RNavNSheet extends StatefulWidget {
  /// List of [RNavItem] (bottom navigation items)
  final List<RNavItem> items;

  /// [Function] callback that returns index of selected [RNavItem]
  final void Function(int index)? onTap;

  /// Index of default selected item
  final int? initialSelectedIndex;

  /// Bottom sheet to be displayed on dock icon click
  final Widget? sheet;

  /// Toggle button icon when sheet is open
  final IconData? sheetOpenIcon;

  /// Toggle button foreground [Color] when sheet is open
  final Color? sheetOpenIconBoxColor;

  /// Toggle button foreground [Color] when sheet is open
  final Color? sheetOpenIconColor;

  /// Toggle button background [Color] when sheet is closed
  final Color? sheetCloseIconBoxColor;

  /// Toggle button foreground [Color] when sheet is closed
  final Color? sheetCloseIconColor;

  /// Angle (in radians) to rotate toggle button when sheet is open
  final double? sheetIconRotateAngle;

  /// Toggle button icon when sheet is closed
  final IconData? sheetCloseIcon;

  /// [Decoration] for toggle button
  final BoxDecoration? sheetToggleDecoration;

  /// [List] of [Color] for border over [RNavNSheet] ([Gradient] from left to right)
  final List<Color>? borderColors;

  /// Background [Color] of [RNavNSheet]
  final Color? backgroundColor;

  /// Background [Gradient] of [RNavNSheet]
  final Gradient? backgroundGradient;

  /// [Color] of selected nav item
  final Color? selectedItemColor;

  /// [Color] of unselected nav item
  final Color? unselectedItemColor;

  /// [Gradient] of selected [RNavItem]
  final Gradient? selectedItemGradient;

  /// [Gradient] of unselected [RNavItem]
  final Gradient? unselectedItemGradient;

  /// [Function] callback that returns ```true``` if sheet is open
  /// and ```false``` if sheet is closed
  final void Function(bool value)? onSheetToggle;

  const RNavNSheet({
    Key? key,
    required this.items,
    this.onTap,
    this.initialSelectedIndex,
    this.sheet,
    this.borderColors,
    this.backgroundColor,
    this.backgroundGradient,
    this.sheetToggleDecoration,
    this.sheetOpenIcon,
    this.sheetCloseIcon,
    this.onSheetToggle,
    this.sheetIconRotateAngle,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedItemGradient,
    this.unselectedItemGradient,
    this.sheetOpenIconBoxColor,
    this.sheetCloseIconBoxColor,
    this.sheetOpenIconColor,
    this.sheetCloseIconColor,
  })  : assert(items.length >= 2 && items.length <= 5,
            "There must be at least 2 and at most 5 items!"),
        assert(
          (items.length % 2 == 0 && sheet != null) || sheet == null,
          "Please add either 2 or 4 items with sheet!",
        ),
        super(key: key);

  @override
  State<RNavNSheet> createState() => _RNavNSheetState();
}

class _RNavNSheetState extends State<RNavNSheet>
    with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  late AnimationController _animationController;
  late double _animValue = 0.0;
  bool _sheetOpen = false;

  PersistentBottomSheetController? _bottomSheetController;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  _onSheetToggle(bool value) {
    setState(() {
      _sheetOpen = value;
    });
    if (widget.onSheetToggle != null) widget.onSheetToggle!(value);
  }

  _showBottomSheet() {
    if (_sheetOpen) {
      _bottomSheetController?.close();
      return;
    }
    _onSheetToggle(true);
    _animationController.reset();
    _animationController.animateTo(1.0);
    _bottomSheetController = Scaffold.of(context).showBottomSheet(
      (_) => Transform.translate(
        offset: const Offset(0, 96),
        child: widget.sheet!,
      ),
      backgroundColor: Colors.transparent,
    )..closed.whenComplete(() {
        _animationController.animateBack(0.0).then((value) {
          _onSheetToggle(false);
        });
      });
  }

  _initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationController.addListener(() {
      setState(() {
        _animValue = _animationController.value;
      });
    });
  }

  @override
  void initState() {
    _initAnimation();
    _selectedIndex = widget.initialSelectedIndex;
    super.initState();
  }

  List<double> get padding => widget.items.length == 2
      ? [35.0, 35.0]
      : widget.items.length == 3
          ? [35.0, 25.0, 35.0]
          : widget.items.length == 4
              ? [35.0, 30.0, 30.0, 35.0]
              : [35.0, 30.0, 25.0, 30.0, 35.0];

  @override
  Widget build(BuildContext context) {
    List<RNavItem> _items = widget.items;
    var theme = Theme.of(context);
    var items = <Widget>[];

    for (var item in _items) {
      var i = _items.indexOf(item);
      items.add(Expanded(
        child: _RNavItem(
          icon: item.icon,
          activeIcon: item.activeIcon,
          label: item.label,
          hide: _sheetOpen,
          selectedItemColor: widget.selectedItemColor,
          unselectedItemColor: widget.unselectedItemColor,
          selectedItemGradient: widget.selectedItemGradient,
          unselectedItemGradient: widget.unselectedItemGradient,
          padding: EdgeInsets.only(top: padding[i]),
          selected: _selectedIndex == i,
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(i);
              setState(() {
                _selectedIndex = i;
              });
            }
          },
        ),
      ));
    }

    var openIcon = widget.sheetOpenIcon ?? Icons.add;
    var iconBg = _sheetOpen
        ? widget.sheetOpenIconBoxColor
        : widget.sheetCloseIconBoxColor ?? widget.sheetOpenIconBoxColor;
    var iconFg = _sheetOpen
        ? widget.sheetOpenIconColor
        : widget.sheetCloseIconColor ?? widget.sheetOpenIconColor;
    var fab = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Transform.rotate(
          angle:
              _animValue * (pi / 180) * (widget.sheetIconRotateAngle ?? 45.0),
          child: _SheetToggleButton(
            onTap: () => _showBottomSheet(),
            backgroundColor: iconBg,
            icon: _sheetOpen ? widget.sheetCloseIcon ?? openIcon : openIcon,
            foregroundColor: iconFg,
            decoration: widget.sheetToggleDecoration,
          ),
        ),
      ),
    );

    if (widget.sheet != null) {
      if (_items.length == 2) {
        items.insert(1, fab);
      } else if (_items.length == 4) {
        items.insert(2, fab);
      }
    }

    var bgColor = widget.backgroundColor ?? theme.canvasColor;
    var gradientColors =
        widget.borderColors ?? [bgColor, theme.iconTheme.color!, bgColor];
    CustomPainter painter = _BottomPainterPlain(gradientColors);
    CustomClipper<Path> clipper = _BottomClipperPlain();

    if (widget.sheet != null) {
      painter = _BottomPainter(
        gradientColors,
        value: max(10, _animValue * 30),
      );
      clipper = _BottomClipper(
        value: max(10, _animValue * 30),
      );
    }

    return SizedBox(
      height: 96,
      child: Stack(
        children: [
          CustomPaint(
            painter: painter,
            child: Container(),
          ),
          ClipPath(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: bgColor,
                gradient: widget.backgroundGradient,
              ),
              height: 96,
              duration: const Duration(milliseconds: 300),
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: items,
                ),
              ),
            ),
            clipper: clipper,
          ),
        ],
      ),
    );
  }
}
