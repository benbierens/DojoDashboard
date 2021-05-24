import 'package:dojodash/dashboard_model.dart';

import '../../utils.dart';

class CompilerConverter {
  List<CompilerInfo> getCompilerData(DashboardModel data) {
    return data.scores.map(getCompilerInfo).toList();
  }

  CompilerInfo getCompilerInfo(TeamScoreModel t) {
    var teamName = t.teamInfo.teamName;
    if (t.compilerGameRuns == null || t.compilerGameRuns.length == 0) {
      return CompilerInfo(valueOrEmpty(teamName), "-", 0, 0, 0.0, 0.0, 0.0);
    }

    var utc = mostRecent(t.compilerGameRuns.map((c) => c.utc).toList())
        .toIso8601String();
    var numGames = t.compilerGameRuns.map((e) => (e.numberOfGames)).reduce(sum);
    var spent = t.compilerGameRuns.map((e) => (e.totalCoinsSpent)).reduce(sum);
    var received =
        t.compilerGameRuns.map((e) => (e.totalCoinsReceived)).reduce(sum);
    var turns =
        t.compilerGameRuns.map((e) => (e.totalNumberOfTurns)).reduce(sum);
    var wins = t.compilerGameRuns.map((e) => (e.totalNumberOfWins)).reduce(sum);

    var spt = ratio(spent, turns);
    var rpt = ratio(received, turns);
    var wpt = ratio(wins, turns);

    return CompilerInfo(
        valueOrEmpty(teamName), utc, numGames, turns, spt, rpt, wpt);
  }

  DateTime mostRecent(List<DateTime> utcs) {
    return utcs
        .reduce((value, element) => value.isAfter(element) ? value : element);
  }

  int sum(int value, int element) {
    return value + element;
  }

  double ratio(int num, int div) {
    return num.toDouble() / div.toDouble();
  }
}

class CompilerInfo {
  CompilerInfo(this.teamName, this.utc, this.numberOfGames, this.totalTurns,
      this.spentPerTurn, this.receivedPerTurn, this.winsPerTurn);

  final String teamName;
  final String utc;
  final int numberOfGames;
  final int totalTurns;
  final double spentPerTurn;
  final double receivedPerTurn;
  final double winsPerTurn;
}
