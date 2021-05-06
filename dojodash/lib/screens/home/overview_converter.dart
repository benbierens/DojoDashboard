import 'package:dojodash/dashboard_model.dart';
import 'dart:math';

class OverviewConverter {
  List<TeamInfoOverview> getTeamInfoOverviewData(DashboardModel data) {
    return data.scores
        .map((e) => TeamInfoOverview(
            e.teamInfo.teamName,
            e.teamInfo.teamMembers,
            getMazeReport(e.mazesCompleted),
            getKeyReport(e.keysFound)))
        .toList();
  }

  String getMazeReport(List<MazeCompletedModel>? mazesCompleted) {
    if (mazesCompleted == null || mazesCompleted.length == 0) return "-";
    var number = mazesCompleted.length;
    var fastest = mazesCompleted.map((m) => m.stepsTaken).reduce(min);

    return 'Completed: $number - Fastest: $fastest steps';
  }

  int getPlayDuration(KeyFoundModel keyFoundModel) {
    return keyFoundModel.keyFoundUtc
        .difference(keyFoundModel.playerStartUtc)
        .inSeconds;
  }

  String getKeyReport(List<KeyFoundModel>? keysFound) {
    if (keysFound == null || keysFound.length == 0) return "-";
    var number = keysFound.length;
    var fastest = keysFound.map(getPlayDuration).reduce(min);
    var kEntries = (keysFound
        .map((e) => e.numberOfEntriesEvaluated)
        .reduce((value, element) => element + value)) / 1000;

    return "Solved: $number - Fastest: $fastest seconds - KiloEntries: $kEntries";
  }
}

class TeamInfoOverview {
  TeamInfoOverview(
      this.teamName, this.teamMembers, this.mazeReport, this.keyReport);

  final String teamName;
  final String teamMembers;
  final String mazeReport;
  final String keyReport;
}
