import 'common_control.dart';

class CBothSide extends CWidget {
  CBothSide(
      {super.key,
      required super.children,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.crossAxisAlignment,
      super.mainAxisAlignment,
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
  
  @override
  Widget initChildren(Widget widget, List<Widget> children, MainAxisAlignment? mainAxisAlignment, CrossAxisAlignment? crossAxisAlignment, BuildContext context) {
    return Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: children);
  }
}