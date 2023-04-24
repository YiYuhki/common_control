import 'common_control.dart';

class CFixedBottom extends CWidget {
  CFixedBottom(
      {super.key,
      this.body,
      super.children,
      required this.bottom,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.border,
      super.flex,
      super.style,
      super.onTap,
      super.expanded,
      super.decoration,
      super.visible,
      super.borderRadius,
      super.backgroundColor,
      super.tag});

  final Widget? body;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    Widget? body = this.body;
    EdgeInsetsGeometry padding = super.padding ?? const EdgeInsets.all(0);

    if (children != null) {
      body = CColumn(children: children!);
    }

    Widget widget = CColumn(
        margin: margin,
        width: width,
        height: height,
        padding: padding,
        border: border,
        flex: flex,
        style: style,
        expanded: expanded,
        decoration: decoration,
        visible: visible,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        tag: tag,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SingleChildScrollView(child: body!)),
          Container(child: bottom)
        ]);

    return widget;
  }
}
