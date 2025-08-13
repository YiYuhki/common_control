import 'common_control.dart';

class CImage extends CWidget {
  CImage(
      {super.key,
      super.width,
      super.height,
      this.fit,
      this.hero,
      required this.image,
      super.border,
      super.margin,
      super.padding,
      super.onTap,
      super.flex,
      super.expanded,
      super.decoration,
      super.visible,
      super.borderRadius,
      super.style,
      super.backgroundColor,
      super.alignment,
      this.errorImage = '',
      super.tag});

  final BoxFit? fit;
  final String? hero;
  final String image;
  final String errorImage;

  @override
  Widget init(BuildContext context) {
    double? width = this.width;

    if (style != null) {
      width = width ?? style?.width ?? this.width;
    }

    width = width ?? double.infinity;

    if (image == '') {
      return SizedBox(width: width, height: height);
    }

    final fit = this.fit ?? BoxFit.cover;

    Widget widget;

    if (errorImage.isNotEmpty) {
      widget = CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: image,
        errorWidget: (context, url, error) =>
            Image.asset(errorImage, width: width, height: height),
      );
    } else {
      widget = CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: image,
      );
    }

    if (hero != null && hero!.isNotEmpty) {
      widget = Hero(tag: '$hero $image', child: widget);
    }

    return widget;
  }
}
