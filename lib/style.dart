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
      this.mainAxisSize,
      this.alignment,
      this.icon,
      this.rearIcon,
      this.expanded,
      this.decoration,
      this.visible,
      this.borderRadius,
      this.iconMargin,
      this.rearIconMargin,
      this.gap,
      this.lineWidth,
      this.lineColor});

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
  final MainAxisSize? mainAxisSize;
  final Alignment? alignment;

  final Widget? icon;
  final Widget? rearIcon;

  final double? gap;

  final double? lineWidth;
  final Color? lineColor;

  final bool? expanded;
  final Decoration? decoration;
  final bool? visible;
  final double? borderRadius;

  final double? iconMargin;
  final double? rearIconMargin;
}
