import 'package:dojodash/dashboard_model.dart';
import 'dart:math';

class CompilerConverter {
  List<CompilerInfo> getCompilerData(DashboardModel data) {
    return data.scores.map(getCompilerInfo).toList();
  }

  CompilerInfo getCompilerInfo(TeamScoreModel t) {
    var teamName = t.teamInfo.teamName;
    if (t.compilerGameRuns == null || t.compilerGameRuns.length == 0) {
      return CompilerInfo(teamName, "-", 0, 0, 0, 0, 0, 0.0, 0.0);
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

    return CompilerInfo(teamName, utc, numGames, spent, received, turns, wins, spt, rpt);
  }

  DateTime mostRecent(List<DateTime> utcs) {
    return utcs.reduce((value, element) => value.isAfter(element)? value : element);
  }

  int sum(int value, int element) {
    return value + element;
  }

  double ratio(int num, int div) {
    return num.toDouble() / div.toDouble();
  }
}

class CompilerInfo {
  CompilerInfo(
      this.teamName,
      this.utc,
      this.numberOfGames,
      this.totalSpent,
      this.totalReceived,
      this.totalTurns,
      this.wins,
      this.spentPerTurn,
      this.receivedPerTurn);

  final String teamName;
  final String utc;
  final int numberOfGames;
  final int totalSpent;
  final int totalReceived;
  final int totalTurns;
  final int wins;
  final double spentPerTurn;
  final double receivedPerTurn;
}
