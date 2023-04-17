import 'cwidget.dart';

class CScroll extends CWidget {
  CScroll(
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
      super.decoration,
      super.backgroundColor});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    List<Widget>? children = this.children;

    CrossAxisAlignment? crossAxisAlignment = this.crossAxisAlignment;
    MainAxisAlignment? mainAxisAlignment = this.mainAxisAlignment;
    double? gap = this.gap;

    Decoration? decoration = this.decoration;

    if (style != null) {
      crossAxisAlignment = crossAxisAlignment ??
          style?.crossAxisAlignment ??
          this.crossAxisAlignment;
      mainAxisAlignment = mainAxisAlignment ??
          style?.mainAxisAlignment ??
          this.mainAxisAlignment;
      gap = gap ?? style?.gap ?? this.gap;

      decoration = decoration ?? style?.decoration ?? this.decoration;
    }

    if (gap != null) {
      var items = <Widget>[];

      for (var i = 0; i < children.length; i++) {
        if (i > 0) {
          items.add(SizedBox(height: gap));
        }

        items.add(children[i]);
      }

      children = items;
    }

    Widget widget = SingleChildScrollView(
      child: CColumn(
        margin: padding,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: children,
      ),
    );

    if (border != null) {
      decoration = decoration ?? BoxDecoration(border: border);
    }

    if (margin != null || width != null || height != null || decoration != null) {
      widget = Container(
          margin: margin,
          width: width,
          height: height,
          decoration: decoration,
          child: widget);
    }

    if (backgroundColor != null || margin != null) {
      widget = Container(color: backgroundColor, margin: margin, child: widget);
    }

    return widget;
  }
}
