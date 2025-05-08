import 'common_control.dart';

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
      super.expanded,
      super.decoration,
      super.visible,
      super.borderRadius,
      this.overflow,
      this.maxLines,
      this.softWrap,
      super.iconMargin,
      super.rearIconMargin,
      super.alignment,
      super.tag,
      this.textAlign});

  final String text;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextAlign? textAlign;

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

    Widget widget = XtyleText(
      text,
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
    );

    return widget;
  }
}
