/// 当前状态
class GameStatus {
  GameStatus({
    this.adds,
    this.moves,
    this.scores = 0,
    this.total,
    this.end,
  });

  int scores;
  int? total;
  int? adds;
  int? moves;
  bool? end;
}
