import 'common_control.dart';

class CContainer extends CWidget {
  CContainer(
      {super.key,
      this.child,
      super.alignment,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.border,
      super.flex,
      super.style,
      super.gap,
      super.onTap,
      super.expanded,
      super.decoration,
      super.visible,
      super.borderRadius,
      super.backgroundColor});

  final Widget? child;

  @override
  Widget init(BuildContext context) {
    Widget widget = Container(alignment: alignment, child: child);

    return widget;
  }
}
