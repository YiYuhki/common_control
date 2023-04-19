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
      super.backgroundColor,
      super.scrollDirection});

  final List<Widget> children;

  @override
  Widget init(BuildContext context) {
    List<Widget>? children = this.children;

    CrossAxisAlignment? crossAxisAlignment = this.crossAxisAlignment;
    MainAxisAlignment? mainAxisAlignment = this.mainAxisAlignment;
    double? gap = this.gap;
    String? scrollDirection = this.scrollDirection;

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
          items.add(SizedBox(height: gap));
        }

        items.add(children[i]);
      }

      children = items;
    }

    if (scrollDirection != null) {
      scrollDirection = 'row';
    }
    scrollDirection ?? 'column';

    Widget widget = SingleChildScrollView(
      scrollDirection:
          scrollDirection == 'column' ? Axis.vertical : Axis.horizontal,
      child: scrollDirection == 'column'
          ? Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: children,
            )
          : Row(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: children,
            ),
    );

    return widget;
  }
}
