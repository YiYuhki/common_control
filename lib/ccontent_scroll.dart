import 'cwidget.dart';

class CContentScroll extends CWidget {
  CContentScroll(
      {super.key,
      super.width,
      super.margin,
      super.padding,
      super.border,
      super.flex,
      super.style,
      super.onTap,
      super.icon,
      super.rearIcon,
      super.backgroundColor,
      required this.child});

  final Widget child;

  @override
  Widget build(context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: CContainer(
            width: width,
            height: contentHeight,
            margin: margin,
            padding: padding,
            border: border,
            flex: flex,
            style: style,
            onTap: onTap,
            backgroundColor: backgroundColor,
            child: child));
  }
}
