import 'package:flutter/services.dart';
import 'common_control.dart';

enum CTextFieldType { text, number }

enum CTextFieldDisabledType { fill, outline }

// ignore: must_be_immutable
class CTextField extends CWidget {
  CTextField(
      {super.key,
      this.maxLines,
      this.disabled,
      this.obscure,
      this.readOnly,
      this.controller,
      this.text,
      this.errText,
      this.onChanged,
      this.focusNode,
      this.type = CTextFieldType.text,
      this.disabledtype = CTextFieldDisabledType.fill,
      this.svg,
      this.filledColor,
      this.suffixText,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.border,
      super.flex,
      this.textStyle,
      super.style,
      super.onTap,
      super.visible,
      super.borderRadius,
      super.alignment,
      super.tag});

  final int? maxLines;
  final bool? disabled;
  final bool? obscure;
  final bool? readOnly;
  final CTextFieldDisabledType disabledtype;
  final TextEditingController? controller;
  final String? suffixText;
  final String? text;
  String? errText;
  final Function(dynamic)? onChanged;
  final FocusNode? focusNode;
  final CTextFieldType type;
  final String? svg;
  final Color? filledColor;
  final TextStyle? textStyle;

  @override
  Widget init(BuildContext context) {
    double height = 48;

    const grey700 = Color(0xff616161);
    const grey400 = Color(0xffBDBDBD);
    const grey300 = Color(0xffE0E0E0);
    const grey50 = Color(0xffFAFAFA);
    const hintText =
        TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: grey400);
    const errorText = TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffff6262));

    var disabledFillColor = grey50;
    var filled = disabled ?? false ? true : false;
    var suffixText = this.suffixText ?? '';

    if (filled != true) {
      if (filledColor != null) {
        disabledFillColor = filledColor!;
        filled = true;
      }
    }

    Widget? icon;

    if (svg != null) {
      icon = IconButton(
        icon: CSvg(svg!, width: 24, height: 24),
        onPressed: null,
      );
    }

    var textfield = SizedBox(
      height: maxLines == null || maxLines == 1 ? height : maxLines! * height,
      child: TextField(
          style: textStyle,
          maxLines: maxLines ?? 1,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          readOnly: readOnly ?? false ? true : false,
          keyboardType: type == CTextFieldType.number
              ? TextInputType.number
              : maxLines == 1
                  ? TextInputType.text
                  : TextInputType.multiline,
          inputFormatters: type == CTextFieldType.number
              ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
              : [],
          cursorColor: grey300,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscure ?? false ? true : false,
          enabled: disabled ?? false ? false : true,
          decoration: InputDecoration(
              suffixText: suffixText,
              isDense: true,
              filled: filled,
              fillColor: disabledFillColor,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: text,
              hintStyle: hintText,
              prefixIcon: icon,
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: disabledtype == CTextFieldDisabledType.fill
                          ? disabledFillColor
                          : grey400)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: grey700),
                  borderRadius: BorderRadius.circular(8.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: grey300)))),
    );

    Widget widget =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      textfield,
      errText == '' || errText == null
          ? const SizedBox.shrink()
          : Column(children: [
              const SizedBox(height: 6),
              Text(errText.toString(), style: errorText)
            ])
    ]);

    return widget;
  }
}
