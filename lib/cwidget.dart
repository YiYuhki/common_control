import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ccontroller.dart';
import 'cdialog.dart';
import 'style.dart';

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
      this.visible,
      this.borderRadius,
      this.iconMargin,
      this.rearIconMargin,
      this.children,
      this.tag,
      this.scrollDirection});

  final List<Widget>? children;

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

  final double? iconMargin;
  final double? rearIconMargin;

  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  final Decoration? decoration;

  final String? tag;
  final bool? visible;
  final double? borderRadius;

  final Axis? scrollDirection;

  final CController commonController = Get.find<CController>();

  Widget init(BuildContext context) {
    return Container();
  }

  Widget initChildren(
      Widget widget,
      List<Widget> children,
      MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      BuildContext context) {
    return widget;
  }

  get contentHeight =>
      Get.height -
      MediaQuery.of(Get.context!).padding.top +
      MediaQuery.of(Get.context!).padding.bottom -
      AppBar().preferredSize.height;

  static initialize() {
    Get.put(CController());
  }

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
    bool? visible = this.visible;
    double? borderRadius = this.borderRadius;
    double? iconMargin = this.iconMargin;
    double? rearIconMargin = this.rearIconMargin;

    CrossAxisAlignment? crossAxisAlignment = this.crossAxisAlignment;
    MainAxisAlignment? mainAxisAlignment = this.mainAxisAlignment;

    Color? backgroundColor = this.backgroundColor;
    Style? style = this.style;
    double? gap = this.gap;

    List<Widget>? children = this.children;

    if (this.style == null) {
      if (tag != null) {
        style = commonController.getStyle(Get.currentRoute, tag);
      }

      style ??=
          commonController.getStyle(Get.currentRoute, runtimeType.toString());
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
      visible = visible ?? style.visible ?? this.visible;
      borderRadius = borderRadius ?? style.borderRadius ?? this.borderRadius;

      iconMargin = iconMargin ?? style.iconMargin ?? this.iconMargin;
      rearIconMargin =
          rearIconMargin ?? style.rearIconMargin ?? this.rearIconMargin;

      gap = gap ?? style.gap ?? this.gap;
    }

    if (visible == false) {
      return const SizedBox.shrink();
    }

    Widget widget = init(context);

    if (gap != null && children != null) {
      var items = <Widget>[];

      for (var i = 0; i < children.length; i++) {
        if (i > 0) {
          items.add(SizedBox(width: gap, height: gap));
        }

        items.add(children[i]);
      }

      children = items;
    }

    if (children != null) {
      widget = initChildren(
          widget, children, mainAxisAlignment, crossAxisAlignment, context);
    }

    if (padding != null) {
      widget = Container(padding: padding, child: widget);
    }

    if (border != null) {
      decoration = decoration ?? BoxDecoration(border: border);
    }

    if (decoration != null || width != null || height != null) {
      widget = Container(
          decoration: decoration, width: width, height: height, child: widget);
    }

    if (onTap != null) {
      widget = GestureDetector(
          behavior: HitTestBehavior.translucent, onTap: onTap, child: widget);
    }

    if (icon != null || rearIcon != null) {
      var icons = <Widget>[];

      double width = iconMargin ?? 2;

      if (icon != null) {
        icons.add(icon);
        icons.add(SizedBox(width: width));
      }

      icons.add(widget);

      width = rearIconMargin ?? 2;

      if (rearIcon != null) {
        icons.add(SizedBox(width: width));
        icons.add(rearIcon);
      }

      widget = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: icons);
    }

    if (borderRadius != null) {
      widget = ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius), child: widget);
    }

    if (backgroundColor != null || margin != null) {
      widget = Container(color: backgroundColor, margin: margin, child: widget);
    }

    if (flex != null && flex > 0) {
      widget = Flexible(flex: flex, child: widget);
    }

    if (expanded != null) {
      widget = Expanded(child: widget);
    }

    return widget;
  }
}
