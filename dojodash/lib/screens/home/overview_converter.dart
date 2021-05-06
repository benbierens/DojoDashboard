import 'package:dojodash/dashboard_model.dart';

class OverviewConverter {
  List<TeamInfoOverview> getTeamInfoOverviewData(DashboardModel data) {
    return data.scores
        .map((e) => TeamInfoOverview(e.teamInfo.teamName,
            e.teamInfo.teamMembers, getMazeReport(), getKeyReport()))
        .toList();
  }

  String getMazeReport() {
    return 'Maze report here';
  }

  String getKeyReport() {
    return 'Key report here';
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
