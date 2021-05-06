import 'package:dojodash/dashboard_model.dart';
import 'dart:math';

class KeyConverter {
  List<KeyInfo> getTeamInfoKeyData(DashboardModel data) {
    return data.scores.map(getKeyInfo).toList();
  }

  KeyInfo getKeyInfo(TeamScoreModel t) {
    var teamName = t.teamInfo.teamName;
    if (t.keysFound == null || t.keysFound.length == 0) {
      return KeyInfo(teamName, 0, 0, 0, 0, 0);
    }

    var total = t.keysFound
        .map((k) => k.numberOfEntriesEvaluated)
        .reduce((value, element) => value + element);
    var minEntries =
        t.keysFound.map((k) => k.numberOfEntriesEvaluated).reduce(min);
    var maxEntries =
        t.keysFound.map((k) => k.numberOfEntriesEvaluated).reduce(max);
    var minSeconds = t.keysFound.map((k) => k.getPlayDuration()).reduce(min);
    var maxSeconds = t.keysFound.map((k) => k.getPlayDuration()).reduce(max);

    return KeyInfo(
        teamName, total, minEntries, maxEntries, minSeconds, maxSeconds);
  }
}

class KeyInfo {
  KeyInfo(this.teamName, this.totalEntries, this.minEntries, this.maxEntries,
      this.minSeconds, this.maxSeconds);

  final String teamName;
  final int totalEntries;
  final int minEntries;
  final int maxEntries;
  final int minSeconds;
  final int maxSeconds;
}
