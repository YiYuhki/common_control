import 'package:flutter/material.dart';

class Style {
  Style(
      {this.width,
      this.height,
      this.margin,
      this.padding,
      this.border,
      this.flex,
      this.textStyle,
      this.backgroundColor,
      this.crossAxisAlignment,
      this.mainAxisAlignment,
      this.alignment,
      this.icon,
      this.rearIcon,
      this.expanded,
      this.decoration,
      this.visible,
      this.borderRadius,
      this.iconMargin,
      this.rearIconMargin,
      this.gap});

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final int? flex;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Alignment? alignment;

  final Widget? icon;
  final Widget? rearIcon;

  final double? gap;

  final bool? expanded;
  final Decoration? decoration;
  final bool? visible;
  final double? borderRadius;

  final double? iconMargin;
  final double? rearIconMargin;
}
