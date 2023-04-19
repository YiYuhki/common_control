import 'package:flutter_svg/svg.dart';
import 'common_control.dart';

class CSvg extends CWidget {
  CSvg(this.filename,
      {super.key,
      super.margin,
      super.width,
      super.height,
      super.padding,
      super.border,
      super.flex,
      super.style,
      this.color,
      super.expanded,
      super.decoration,
      super.visible,
      super.borderRadius,
      super.onTap,
      super.backgroundColor,
      super.tag});

  final String filename;
  final Color? color;

  @override
  Widget init(BuildContext context) {
    Widget widget =
        SvgPicture.asset(filename, width: width, height: height);

    return widget;
  }
}
