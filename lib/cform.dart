import 'common_control.dart';

class CForm extends CColumn {
  CForm(
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
      super.gap = 8,
      super.onTap,
      super.backgroundColor});
}

class CFormfield extends CWidget {
  CFormfield(
      {super.key,
      this.title,
      this.onChanged,
      this.text = '',
      this.buttonText,
      this.controller,
      this.onPressed,
      this.disabled = false,
      super.visible,
      this.obscure = false,
      this.errText,
      this.focusNode,
      this.readOnly = false,
      this.type = CTextFieldType.text});

  final TextEditingController? controller;
  final String? title;
  final Function(dynamic)? onChanged;
  final String text;
  final String? buttonText;
  final void Function()? onPressed;
  final bool disabled;
  final bool obscure;
  final String? errText;
  final FocusNode? focusNode;
  final CTextFieldType type;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    if (visible == false) {
      return const SizedBox.shrink();
    }

    final textStyle = Style(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff212121)),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
    );

    var flex = 0;

    if (buttonText != null) {
      flex = 2;
    }
    Widget widget = CTextField(
      
        flex: flex,
        obscure: obscure,
        onChanged: onChanged,
        controller: controller,
        text: text,
        focusNode: focusNode,
        errText: errText,
        readOnly: readOnly,
        type: type,
        textStyle: const TextStyle(fontSize: 14)
      );

    if (buttonText != null) {
      widget = CRow(
        gap: 8,
        children: [
          widget,
          CButton(
              flex: 1,
              text: buttonText!,
              type: CButtonStyle.outlined,
              disabled: disabled,
              onPressed: onPressed),
        ],
      );
    }

    if (title == null) {
      return widget;
    }

    return CColumn(children: [CText(title!, style: textStyle), widget]);
  }
}
