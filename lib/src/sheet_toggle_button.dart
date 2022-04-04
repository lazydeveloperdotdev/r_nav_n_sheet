part of '../r_nav_n_sheet.dart';

/// Toggle button for the bottom sheet
class _SheetToggleButton extends StatelessWidget {
  final BoxDecoration? decoration;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData icon;
  final VoidCallback? onTap;

  const _SheetToggleButton(
      {Key? key,
      this.decoration,
      this.backgroundColor,
      this.foregroundColor,
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: InkResponse(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 56,
            height: 56,
            decoration: decoration ??
                BoxDecoration(
                  color: backgroundColor ?? theme.colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
            child: Icon(
              icon,
              color: foregroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
