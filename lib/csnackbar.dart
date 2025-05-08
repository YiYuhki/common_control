import 'common_control.dart';

enum Type { basic, action }

enum Position { top, bottom }

class CSnackbar extends CWidget {
  CSnackbar({
    super.key,
    required this.content,
    this.type = Type.basic,
    this.position = Position.bottom,
    this.label,
    this.onPressed,
  });

  final String content;
  final Type type;
  final Position position;
  final String? label;
  final VoidCallback? onPressed;

  showSnackbar() {
    const contentTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );

    const labelTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xffFAE100),
    );

    SnackPosition snackPosition;

    snackPosition = SnackPosition.BOTTOM;

    if (position == Position.top) {
      snackPosition = SnackPosition.TOP;
    }

    TextButton mainButton;

    mainButton = TextButton(
      onPressed: null,
      child: CText(''),
    );

    if (type == Type.action) {
      mainButton = TextButton(
        onPressed: onPressed,
        child: CText('$label', textStyle: labelTextStyle),
      );
    }

    return Get.snackbar(
      '',
      '',
      snackPosition: snackPosition,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 20),
      margin: const EdgeInsets.all(15),
      borderRadius: 14,
      backgroundColor: Colors.black.withValues(alpha: 0.8),
      barBlur: 0.0,
      titleText: const SizedBox.shrink(),
      messageText: CText(content, textStyle: contentTextStyle),
      mainButton: mainButton,
    );
  }
}
