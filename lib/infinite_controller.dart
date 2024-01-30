import 'package:get/get.dart';

typedef ItemReader = Future<List<dynamic>> Function(
    {int page, int pagesize, String? params});

class InfiniteController extends GetxController {
  final _cache = [].obs;
  final _loading = false.obs;
  final _end = false.obs;
  final _pagesize = 20;
  final _page = 1.obs;

  get items => _cache;
  set items(value) => _cache.value = value;

  final ItemReader reader;
  String params;

  InfiniteController({required this.reader, required this.params});

  @override
  void onInit() {
    super.onInit();
    read();
  }

  getCache() {
    return _cache;
  }

  isLoading() {
    return _loading.value;
  }

  isEnd() {
    return _end.value;
  }

  reset() {
    _cache.value = [];
    _page.value = 1;
    _loading.value = false;
    _end.value = false;
    return fetch();
  }

  read() {
    Future.microtask(() => fetch());
  }

  readItem() async {    
    return reader(page: _page.value, pagesize: _pagesize, params: params);
  }

  fetch() async {
    if (_loading.value == true) {
      return;
    }

    if (_end.value == true) {
      return;
    }

    _loading.value = true;

    final items = await readItem();

    if (items.isEmpty || items.length < _pagesize) {
      _end.value = true;
    }

    _cache.value = [
      ..._cache,
      ...items,
    ];

    _page.value++;

    _loading.value = false;

    onReadEnd();
  }

  onReadEnd() {}

  get(int index) {
    return _cache[index];
  }

  set(int index, dynamic item) {
    var list = _cache.toList();
    list[index] = item;
    _cache.value = list;
  }

  setExtra(int index, String key, dynamic value) {
    var list = _cache.toList();
    list[index].extra[key] = value;
    _cache.value = list;
  }
}
