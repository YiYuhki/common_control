import 'cwidget.dart';

class CController extends GetxController {
  final isUse = true.obs;
  final _style = <String, Map<String, Style>>{}.obs;

  Map<String, Map<String, Style>> get style => _style;
  set style(Map<String, Map<String, Style>> value) => _style.value = value;

  Style? getStyle(route, tag) {
    if (style[route] == null) {
      return null;
    }

    if (tag is Type) {
      return style[route]![tag.toString()];
    } else {
      return style[route]![tag];
    }
  }

  setStyle(name, value) {
    style[name] = value;
  }
}
