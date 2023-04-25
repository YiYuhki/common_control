import 'common_control.dart';

class CScaffold extends CWidget {
  CScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.autoLostFocus,
      super.backgroundColor,
      this.bottomNavigationBar,
      this.extendBodyBehindAppBar = false,
      this.safeArea = true,
      this.resizeToAvoidBottomInset = true,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,});

  final Widget body;
  final Widget? appBar;
  final bool? autoLostFocus;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;
  final bool safeArea;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final appbarHeight = const Size.fromHeight(54);

  PreferredSize getAppBar(appBar) {
    return PreferredSize(preferredSize: appbarHeight, child: appBar);
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    Widget body = this.body;
    bool extendBody = false;

    if (bottomNavigationBar != null) {
      extendBody = true;
    }

    if (safeArea == true) {
      body = SafeArea(child: body);
    }

    if (appBar == null) {
      widget = Scaffold(
          backgroundColor: backgroundColor,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButton:floatingActionButton,
          floatingActionButtonLocation:floatingActionButtonLocation,
          floatingActionButtonAnimator:floatingActionButtonAnimator
          );
    } else {
      widget = Scaffold(
          backgroundColor: backgroundColor,
          appBar: getAppBar(appBar),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButton:floatingActionButton,
          floatingActionButtonLocation:floatingActionButtonLocation,
          floatingActionButtonAnimator:floatingActionButtonAnimator);
    }

    if (autoLostFocus != null && autoLostFocus == true) {
      widget = GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: widget);
    }

    return widget;
  }
}
