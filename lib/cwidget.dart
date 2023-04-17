import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ccontroller.dart';
import 'cdialog.dart';
import 'style.dart';

export 'cappbar.dart';
export 'cbutton.dart';
export 'ccolumn.dart';
export 'ccontainer.dart';
export 'cdialog.dart';
export 'cform.dart';
export 'cimage.dart';
export 'crow.dart';
export 'cscaffold.dart';
export 'cscroll.dart';
export 'csvg.dart';
export 'ctext.dart';
export 'ctextfield.dart';
export 'style.dart';
export 'cfixedbottom.dart';
export 'ccontent_scroll.dart';
export 'ccontroller.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:cached_network_image/cached_network_image.dart';

class CWidget extends StatelessWidget {
  CWidget(
      {super.key,
      this.margin,
      this.width,
      this.height,
      this.padding,
      this.border,
      this.flex,
      this.expanded,
      this.style,
      this.gap,
      this.backgroundColor,
      this.onTap,
      this.icon,
      this.rearIcon,
      this.crossAxisAlignment,
      this.mainAxisAlignment,
      this.decoration,
      this.tag});

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final int? flex;
  final bool? expanded;
  final double? gap;
  final Color? backgroundColor;

  final Style? style;

  final Function()? onTap;

  final Widget? icon;
  final Widget? rearIcon;

  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  final Decoration? decoration;

  final String? tag;

  final CController commonController = Get.find<CController>();

  Widget init(BuildContext context) {
    return Container();
  }

  get contentHeight =>
      Get.height -
      MediaQuery.of(Get.context!).padding.top +
      MediaQuery.of(Get.context!).padding.bottom -
      AppBar().preferredSize.height;

  unfocus() {
    Get.focusScope?.unfocus();
  }

  alert({title, onPressed, onCanceled, text, confirmText, cancelText}) {
    CDialog(
            title: title,
            onPressed: onPressed,
            onCanceled: onCanceled,
            text: text,
            type: CDialogType.alert,
            confirmText: confirmText,
            cancelText: cancelText)
        .show();
  }

  confirm({title, onPressed, onCanceled, text, confirmText, cancelText}) {
    CDialog(
            title: title,
            onPressed: onPressed,
            onCanceled: onCanceled,
            text: text,
            type: CDialogType.confirm,
            confirmText: confirmText,
            cancelText: cancelText)
        .show();
  }

  @override
  Widget build(BuildContext context) {
    double? width = this.width;
    double? height = this.height;
    EdgeInsetsGeometry? margin = this.margin;
    EdgeInsetsGeometry? padding = this.padding;
    Border? border = this.border;
    int? flex = this.flex;
    Widget? icon = this.icon;
    Widget? rearIcon = this.rearIcon;
    bool? expanded = this.expanded;
    Decoration? decoration = this.decoration;

    CrossAxisAlignment? crossAxisAlignment = this.crossAxisAlignment;
    MainAxisAlignment? mainAxisAlignment = this.mainAxisAlignment;

    Color? backgroundColor = this.backgroundColor;
    Style? style = this.style;

    if (this.style == null) {
      if (tag != null) {
        style = commonController.getStyle(Get.currentRoute, tag);
      }

      style ??= commonController.getStyle(Get.currentRoute, runtimeType);
    }

    if (style != null) {
      width = width ?? style.width ?? this.width;
      height = height ?? style.height ?? this.height;
      margin = margin ?? style.margin ?? this.margin;
      padding = padding ?? style.padding ?? this.padding;
      border = border ?? style.border ?? this.border;
      flex = flex ?? style.flex ?? this.flex;
      backgroundColor =
          backgroundColor ?? style.backgroundColor ?? this.backgroundColor;

      crossAxisAlignment = crossAxisAlignment ??
          style.crossAxisAlignment ??
          this.crossAxisAlignment;
      mainAxisAlignment = mainAxisAlignment ??
          style.mainAxisAlignment ??
          this.mainAxisAlignment;

      icon = icon ?? style.icon ?? this.icon;
      rearIcon = rearIcon ?? style.rearIcon ?? this.rearIcon;

      expanded = expanded ?? style.expanded ?? this.expanded;
      decoration = decoration ?? style.decoration ?? this.decoration;
    }

    Widget widget = init(context);

    if (padding != null) {
      widget = Container(padding: padding, child: widget);
    }

    if (flex != null && flex > 0) {
      widget = Flexible(flex: flex, child: widget);
    }

    if (expanded != null) {
      widget = Expanded(child: widget);
    }

    if (border != null) {
      decoration = decoration ?? BoxDecoration(border: border);
    }

    if (decoration != null || width != null || height != null) {
      widget = Container(
          decoration: decoration, width: width, height: height, child: widget);
    }

    if (onTap != null) {
      widget = GestureDetector(onTap: onTap, child: widget);
    }

    if (icon != null || rearIcon != null) {
      var icons = <Widget>[];

      if (icon != null) {
        icons.add(icon);
        icons.add(const SizedBox(width: 2));
      }

      icons.add(widget);

      if (rearIcon != null) {
        icons.add(const SizedBox(width: 2));
        icons.add(rearIcon);
      }

      widget = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: icons);
    }

    if (backgroundColor != null || margin != null) {
      widget = Container(color: backgroundColor, margin: margin, child: widget);
    }

    return widget;
  }
}
