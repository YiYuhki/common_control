import 'cwidget.dart';

class CRow extends CWidget {
  CRow(
      {super.key,
      required this.children,
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
      super.backgroundColor});

  final List<Widget> children;

  @override
  Widget init(BuildContext context) {
    List<Widget>? children = this.children;

    CrossAxisAlignment? crossAxisAlignment = this.crossAxisAlignment;
    MainAxisAlignment? mainAxisAlignment = this.mainAxisAlignment;
    double? gap = this.gap;

    if (style != null) {
      crossAxisAlignment = crossAxisAlignment ??
          style?.crossAxisAlignment ??
          this.crossAxisAlignment;
      mainAxisAlignment = mainAxisAlignment ??
          style?.mainAxisAlignment ??
          this.mainAxisAlignment;
      gap = gap ?? style?.gap ?? this.gap;
    }

    if (gap != null) {
      var items = <Widget>[];

      for (var i = 0; i < children.length; i++) {
        if (i > 0) {
          items.add(SizedBox(width: gap));
        }

        items.add(children[i]);
      }

      children = items;
    }

    Widget widget = Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: children);

    return widget;
  }
}
