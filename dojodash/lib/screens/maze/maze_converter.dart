import 'package:dojodash/dashboard_model.dart';
import 'dart:math';

class MazeConverter {
  List<MazeInfo> getTeamInfoMazeData(DashboardModel data) {
    return data.scores.map(getMazeInfo).toList();
  }

  MazeInfo getMazeInfo(TeamScoreModel t) {
    var teamName = t.teamInfo.teamName;
    if (t.mazesCompleted == null || t.mazesCompleted.length == 0) {
      return MazeInfo(teamName, 0, 0, 0, 0, 0, 0, 0);
    }
    var number = t.mazesCompleted.length;
    var maxSteps = t.mazesCompleted.map((m) => m.stepsTaken).reduce(max);
    var minSteps = t.mazesCompleted.map((m) => m.stepsTaken).reduce(min);
    var maxSize = t.mazesCompleted.map((m) => m.mazeSize).reduce(max);
    var minSize = t.mazesCompleted.map((m) => m.mazeSize).reduce(min);
    var maxHits = t.mazesCompleted.map((m) => m.numberOfHits).reduce(max);
    var maxTimesHit =
        t.mazesCompleted.map((m) => m.numberOfTimesHit).reduce(max);

    return MazeInfo(teamName, number, maxSteps, minSteps, maxSize, minSize,
        maxHits, maxTimesHit);
  }
}

class MazeInfo {
  MazeInfo(this.teamName, this.numMazesCompleted, this.maxSteps, this.minSteps,
      this.maxSize, this.minSize, this.maxHits, this.maxTimesHit);

  final String teamName;
  final int numMazesCompleted;
  final int maxSteps;
  final int minSteps;
  final int maxSize;
  final int minSize;
  final int maxHits;
  final int maxTimesHit;
}
