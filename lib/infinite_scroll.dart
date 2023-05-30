import 'common_control.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class InfiniteScroll<T> extends CWidget {
  final Widget Function(T, int index) builder;
  final InfiniteController controller;
  final String? params;
  final Axis axis;

  InfiniteScroll(
      {super.key,
      required this.builder,
      required this.controller,
      this.params,
      required this.axis,
      super.width,
      super.height,
      super.margin,
      super.padding,
      super.border,
      super.flex,
      super.style,
      super.onTap,
      super.icon,
      super.rearIcon,
      super.backgroundColor});

  @override
  Widget init(context) {
    const grey800 = Color(0xff424242);

    return CustomRefreshIndicator(
      builder: MaterialIndicatorDelegate(
        builder: (context, controller) {
          return const Center(
            child: SpinKitThreeBounce(
              color: grey800,
              size: 15,
            ),
          );
        },
        backgroundColor: Colors.white,
        withRotation: false,
      ),
      onRefresh: () => controller.reset(),
      child: Obx(() => _render()),
    );
  }

  Widget _render() {
    final cache = controller.getCache();
    final loading = controller.isLoading();
    final end = controller.isEnd();

    if (cache.isEmpty) {
      if (loading) {
        return Container();
      } else {
        return const Center(child: Text('아이템이 없습니다'));
      }
    }

    return ListView.builder(
        scrollDirection: axis,
        itemCount: cache.length + 1,
        itemBuilder: (context, index) {
          if (index < cache.length) {
            return builder(cache[index], index);
          }

          if (end) {
            return Container();
          }

          if (!loading) {
            controller.read();
          }

          return Container();
        });
  }
}
