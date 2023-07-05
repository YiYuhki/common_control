import 'common_control.dart';

class CScroll extends CWidget {
  CScroll(
      {super.key,
      required super.children,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.crossAxisAlignment,
      super.mainAxisAlignment,
      super.mainAxisSize,
      super.alignment,
      super.border,
      super.flex,
      super.style,
      super.gap,
      super.onTap,
      super.expanded,
      super.decoration,
      super.visible,
      super.borderRadius,
      super.backgroundColor,
      super.tag,
      super.scrollDirection});

  @override
  Widget initChildren(
      Widget widget,
      List<Widget> children,
      MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      MainAxisSize? mainAxisSize,
      Alignment? alignment,
      BuildContext context) {
    final scrollDirection = this.scrollDirection ?? Axis.vertical;

    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      child: scrollDirection == Axis.vertical
          ? Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize ?? MainAxisSize.max,
              children: children)
          : Row(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize ?? MainAxisSize.max,
              children: children,
            ),
    );
  }
}
