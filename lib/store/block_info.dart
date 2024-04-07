class BlockInfo {
  BlockInfo(
      {required this.value,
      required this.current,
      this.before,
      this.isNew = true}) {
    before = before ?? current;
  }

  int value;
  int current;
  int? before;
  bool needMove = false;
  bool needCombine = false;
  bool isNew = false;

  void reset() {
    value = 0;
    needMove = false;
    needCombine = false;
    isNew = false;
  }
}
