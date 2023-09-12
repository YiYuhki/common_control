import 'common_control.dart';

enum CDialogType { alert, confirm }

class CDialog extends CWidget {
  CDialog({
    super.key,
    this.title,
    this.onPressed,
    this.onCanceled,
    this.text,
    this.type = CDialogType.alert,
    this.confirmText,
    this.cancelText,
  });

  final String? title;
  final String? text;
  final CDialogType type;
  final String? confirmText;
  final String? cancelText;

  final VoidCallback? onPressed;
  final VoidCallback? onCanceled;

  Future<dynamic> show() {
    const dialogTitleTextStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff212121));
    const style = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff616161));

    var buttons = <Widget>[];

    if (type == CDialogType.confirm) {
      buttons.add(SizedBox(
        width: 82,
        child: CButton(
          text: cancelText ?? '닫기',
          type: CButtonStyle.outlined,
          onPressed: () {
            if (onCanceled != null) {
              onCanceled!();
            }
            Get.back();
          },
        ),
      ));
    }

    buttons.add(SizedBox(
      width: 82,
      child: CButton(
        text: confirmText ?? '확인',
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
          Get.back();
        },
      ),
    ));

    return Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        surfaceTintColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            title != null
                ? CText(
                    title!,
                    textStyle: dialogTitleTextStyle,
                    margin: const EdgeInsets.only(bottom: 16),
                  )
                : const SizedBox.shrink(),
            text != null
                ? CText(
                    text!,
                    textStyle: style,
                  )
                : const SizedBox.shrink(),
            CRow(
                margin: const EdgeInsets.only(top: 24),
                gap: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttons)
          ],
        ),
      ),
    );
  }
}
