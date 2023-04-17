import 'cwidget.dart';

class CContainer extends CWidget {
  CContainer(
      {super.key,
      required this.child,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.border,
      super.flex,
      super.style,
      super.gap,
      super.onTap,
      super.decoration,
      super.backgroundColor});

  final Widget child;

  @override
  Widget init(BuildContext context) {
    Widget widget = Container(child: child);

    return widget;
  }
}
