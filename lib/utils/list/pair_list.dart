class PairList<T> {
  final List<T> _items = [];

  PairList(List<T> itemList) {
    if (itemList.length != 2) {
      throw Exception("Items Should Be Two.");
    }
    _items.add(itemList[0]);
    _items.add(itemList[1]);
  }

  List<T> getList() {
    return _items;
  }
}
