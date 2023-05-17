import 'common_control.dart';

class CAppBar extends CWidget {
  CAppBar(
      {super.key,
      required this.title,
      this.onPressed,
      this.backButton = true,
      this.backButtonImage,
      this.action,
      this.actionWidth,
      this.actionHeight,
      this.onActioned});

  final String title;
  final VoidCallback? onPressed;
  final bool backButton;
  final String? backButtonImage;
  final String? action;
  final double? actionWidth;
  final double? actionHeight;
  final VoidCallback? onActioned;

  @override
  Widget init(BuildContext context) {
    const grey400 = Color(0xffE0E0E0);
    const appbarTitleTextStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff212121));

    // if (action == "assets/imgs/icon_close.svg") {
    //   16;
    //   actionHeight :16;
    // }

    return AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: grey400,
              height: 1,
            )),
        leading: backButton
            ? IconButton(
                onPressed: () {
                  if (onPressed == null) {
                    Get.back();
                  } else {
                    onPressed!();
                  }
                },
                icon: CSvg(
                  backButtonImage!,
                ),
              )
            : Container(),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(title, style: appbarTitleTextStyle),
        actions: action != null
            ? [
                Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: CSvg(action!,
                            width: actionWidth, height: actionHeight),
                        onPressed: () {
                          if (onActioned == null) {
                            Get.back();
                          } else {
                            onActioned!();
                          }
                        }))
              ]
            : []);
  }
}
