import 'package:dojodash/dashboard_model.dart';
import 'dart:math';

import '../../utils.dart';

class OverviewConverter {
  List<TeamInfoOverview> getTeamInfoOverviewData(DashboardModel data) {
    return data.scores
        .map((e) => TeamInfoOverview(
            valueOrEmpty(e.teamInfo.teamName),
            valueOrEmpty(e.teamInfo.teamMembers),
            getMazeReport(e.mazesCompleted),
            getKeyReport(e.keysFound),
            getCompilerReport(e.compilerGameRuns)))
        .toList();
  }

  String getMazeReport(List<MazeCompletedModel>? mazesCompleted) {
    if (mazesCompleted == null || mazesCompleted.length == 0) return "-";
    var number = mazesCompleted.length;
    var fastest = mazesCompleted.map((m) => m.stepsTaken).reduce(min);

    return 'Completed: $number - Fastest: $fastest steps';
  }

  String getKeyReport(List<KeyFoundModel>? keysFound) {
    if (keysFound == null || keysFound.length == 0) return "-";
    var number = keysFound.length;
    var fastest = keysFound.map((k) => k.getPlayDuration()).reduce(min);
    var kEntries =
        (keysFound.map((e) => e.numberOfEntriesEvaluated).reduce(sum)) / 1000;

    return "Solved: $number - Fastest: $fastest seconds - KiloEntries: $kEntries";
  }

  String getCompilerReport(List<CompilerGameRunModel>? runs) {
    if (runs == null || runs.length == 0) return "-";
    var turns = runs.map((e) => e.totalNumberOfTurns).reduce(sum);
    var spent = runs.map((e) => e.totalCoinsSpent).reduce(sum);
    var received = runs.map((e) => e.totalCoinsReceived).reduce(sum);

    return "Turns: $turns - Spend/Received: $spent/$received";
  }

  int sum(int value, int element) {
    return value + element;
  }
}

class TeamInfoOverview {
  TeamInfoOverview(this.teamName, this.teamMembers, this.mazeReport,
      this.keyReport, this.compilerReport);

  final String teamName;
  final String teamMembers;
  final String mazeReport;
  final String keyReport;
  final String compilerReport;
}
