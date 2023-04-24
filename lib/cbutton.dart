import 'common_control.dart';

enum CButtonSize { xsmall, small, normal, large }

enum CButtonStyle { filled, outlined }

class CButton extends CWidget {
  CButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.disabled,
      this.size,
      this.type,
      super.width,
      super.height,
      super.margin,
      super.padding,
      super.flex,
      super.visible,
      super.borderRadius,
      super.backgroundColor,
      super.style,      
      super.gap,
      super.onTap,
      super.expanded,
      super.decoration,
      super.tag});

  final String text;
  final VoidCallback? onPressed;
  final bool? disabled;
  final CButtonSize? size;
  final CButtonStyle? type;

  @override
  Widget init(BuildContext context) {
    const grey900 = Color(0xff212121);  
    const grey500 = Color(0xff9E9E9E);
    const grey200 = Color(0xffEEEEEE);  

    double height = 48;
    double fontsize = 14;
    double bdradius = 8;
    Color bgColor = grey900;
    Color textColor = Colors.white;
    Color borderColor = grey200;

    if (size != null) {
      if (size == CButtonSize.large) {
        height = 56;
        fontsize = 16;
      } else if (size == CButtonSize.small) {
        height = 40;
        fontsize = 14;
        bdradius = 4;
      } else if (size == CButtonSize.xsmall) {
        height = 32;
        fontsize = 12;
        bdradius = 4;
      }
    }

    if (disabled != true) {
      if (type == CButtonStyle.outlined) {
        bgColor = Colors.white;
        textColor = grey900;
        borderColor = grey900;
      }
    }

    final VoidCallback? click =
        disabled == null || disabled == false ? onPressed : null;

    Widget widget = Row(
      children: [
        Expanded(
          child: Container(
            margin: margin,
            height: height,
            child: TextButton(
              style: TextButton.styleFrom(
                // foregroundColor: config.white,
                side: BorderSide(
                  width: 1.0,
                  color: borderColor,
                ),
                foregroundColor: textColor,
                disabledForegroundColor: grey500,
                disabledBackgroundColor: grey200,
                backgroundColor: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(bdradius)),
                ),
              ),
              onPressed: click,
              child: Text(text,
                  style: TextStyle(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ),
        ),
      ],
    );

    return widget;
  }
}

