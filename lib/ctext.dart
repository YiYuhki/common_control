import 'cwidget.dart';

class CText extends CWidget {
  CText(this.text,
      {super.key,
      super.width,
      super.height,
      super.margin,
      super.padding,
      this.textStyle,
      super.border,
      super.flex,
      super.style,
      super.onTap,
      super.icon,
      super.rearIcon,
      super.backgroundColor,
      super.tag});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget init(BuildContext context) {
    TextStyle? textStyle = this.textStyle;
    Style? style = this.style;

    if (style != null) {
      textStyle = textStyle ?? style.textStyle ?? this.textStyle;
    } else {
      if (tag != null) {
        style = commonController.getStyle(Get.currentRoute, tag);
      }

      style ??= commonController.getStyle(Get.currentRoute, runtimeType);

      textStyle = textStyle ?? style?.textStyle;
    }

    Widget widget = Text(text, style: textStyle);

    return widget;
  }
}
