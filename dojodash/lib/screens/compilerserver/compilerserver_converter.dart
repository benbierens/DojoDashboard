import 'package:dojodash/dashboard_model.dart';

class CompilerServerConverter {
  List<CompilerServerInfo> getCompilerServerData(CompilerStatusResponse data) {
    return data.playerReports.map(getCompilerServerInfo).toList();
  }

  String formatGameReport(CompilerGameRunReport report) {
    return '[Spt:${report.numberOfCoinsSpent}/Rcv:${report.numberOfCoinsReceived}/Turns:${report.numberOfTurns}/Win:${report.winner ? 'Y' : 'N'}]';
  }

  String formatGameReports(List<CompilerGameRunReport> reports) {
    return reports.map(formatGameReport).join(',');
  }

  CompilerServerInfo getCompilerServerInfo(CompilerPlayerReportModel c) {
    var reports = formatGameReports(c.gameRunReports);

    return CompilerServerInfo(
        c.playerId, c.playerName, c.statusString, reports);
  }
}

class CompilerServerInfo {
  CompilerServerInfo(this.playerId, this.playerName,
      this.statusString, this.gameReports);

  final String playerId;
  final String playerName;
  final String statusString;
  final String gameReports;
}
