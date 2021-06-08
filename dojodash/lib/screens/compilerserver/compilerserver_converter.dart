import 'package:dojodash/dashboard_model.dart';

class CompilerServerConverter {
  List<CompilerServerInfo> getCompilerServerData(CompilerStatusResponse data) {
    return data.playerReports.map(getCompilerServerInfo).toList();
  }

  String formatGameReport(CompilerGameRunReport report) {
    var spt = ratio(report.numberOfCoinsSpent, report.numberOfTurns);
    var rpt = ratio(report.numberOfCoinsReceived, report.numberOfTurns);
    var turns = report.numberOfTurns;
    return '[Spent/t:${spt} Rcv/t:${rpt} #Turns:${turns}]';
  }

  String formatGameReports(List<CompilerGameRunReport> reports) {
    return reports.map(formatGameReport).join(',');
  }

  CompilerServerInfo getCompilerServerInfo(CompilerPlayerReportModel c) {
    var reports = formatGameReports(c.gameRunReports);

    return CompilerServerInfo(
        c.playerId, c.playerName, c.statusString, c.language, reports);
  }

  double ratio(int num, int div) {
    return num.toDouble() / div.toDouble();
  }
}

class CompilerServerInfo {
  CompilerServerInfo(this.playerId, this.playerName, this.statusString,
      this.language, this.gameReports);

  final String playerId;
  final String playerName;
  final String statusString;
  final String language;
  final String gameReports;
}
