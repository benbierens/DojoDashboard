import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  List<TeamScoreModel> scores;

  DashboardModel(this.scores);

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

@JsonSerializable()
class TeamScoreModel {
  TeamInfoModel teamInfo;
  List<MazeCompletedModel> mazesCompleted;
  List<KeyFoundModel> keysFound;
  List<CompilerGameRunModel> compilerGameRuns;

  TeamScoreModel(this.teamInfo, this.mazesCompleted, this.keysFound,
      this.compilerGameRuns);

  factory TeamScoreModel.fromJson(Map<String, dynamic> json) =>
      _$TeamScoreModelFromJson(json);
}

@JsonSerializable()
class TeamInfoModel {
  String teamName;
  String iconUrl;
  String teamMembers;
  String repositoryUrl;

  TeamInfoModel(
    this.teamName,
    this.iconUrl,
    this.teamMembers,
    this.repositoryUrl,
  );

  factory TeamInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TeamInfoModelFromJson(json);
}

@JsonSerializable()
class MazeCompletedModel {
  int stepsTaken;
  int mazeSize;
  int numberOfHits;
  int numberOfTimesHit;
  DateTime utc;

  MazeCompletedModel(this.stepsTaken, this.mazeSize, this.numberOfHits,
      this.numberOfTimesHit, this.utc);

  factory MazeCompletedModel.fromJson(Map<String, dynamic> json) =>
      _$MazeCompletedModelFromJson(json);
}

@JsonSerializable()
class KeyFoundModel {
  DateTime playerStartUtc;
  DateTime keyFoundUtc;
  int numberOfEntriesEvaluated;

  KeyFoundModel(
      this.playerStartUtc, this.keyFoundUtc, this.numberOfEntriesEvaluated);

  factory KeyFoundModel.fromJson(Map<String, dynamic> json) =>
      _$KeyFoundModelFromJson(json);

  int getPlayDuration() {
    return this.keyFoundUtc.difference(this.playerStartUtc).inSeconds;
  }
}

@JsonSerializable()
class CompilerGameRunModel {
  DateTime utc;
  int numberOfGames;
  int totalCoinsSpent;
  int totalCoinsReceived;
  int totalNumberOfTurns;
  int totalNumberOfWins;

  CompilerGameRunModel(this.utc, this.numberOfGames, this.totalCoinsSpent,
      this.totalCoinsReceived, this.totalNumberOfTurns, this.totalNumberOfWins);

  factory CompilerGameRunModel.fromJson(Map<String, dynamic> json) =>
      _$CompilerGameRunModelFromJson(json);
}

@JsonSerializable()
class MazeServerStatusResponse {
  DateTime lastServerUpdateUtc;
  int lastNumberOfPlayerMoves;

  MazeServerStatusResponse(
      this.lastNumberOfPlayerMoves, this.lastServerUpdateUtc);

  factory MazeServerStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$MazeServerStatusResponseFromJson(json);
}

@JsonSerializable()
class KeyServerStatusResponse {
  int currentKeyNumber;
  List<String> playersJoined;
  List<String> winners;
  DateTime expiresUtc;
  int maxNumberOfEntries;
  int maxLineLength;

  KeyServerStatusResponse(
      this.currentKeyNumber,
      this.playersJoined,
      this.winners,
      this.expiresUtc,
      this.maxNumberOfEntries,
      this.maxLineLength);

  factory KeyServerStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$KeyServerStatusResponseFromJson(json);
}

@JsonSerializable()
class CompilerStatusResponse {
  List<CompilerPlayerReportModel> playerReports;
  DateTime latestCompilerRunUtc;

  CompilerStatusResponse(this.playerReports, this.latestCompilerRunUtc);

  factory CompilerStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$CompilerStatusResponseFromJson(json);
}

@JsonSerializable()
class CompilerPlayerReportModel {
  String playerId;
  String playerName;
  CompilerPlayerStatus status;
  String statusString;
  // String buildOutput; Not parsed. May be long. Not desirable for dashboard viewing.
  List<CompilerGameRunReport> gameRunReports;

  CompilerPlayerReportModel(this.playerId, this.playerName, this.status,
      this.statusString, this.gameRunReports);

  factory CompilerPlayerReportModel.fromJson(Map<String, dynamic> json) =>
      _$CompilerPlayerReportModelFromJson(json);
}

@JsonSerializable()
class CompilerGameRunReport {
  int numberOfCoinsSpent;
  int numberOfCoinsReceived;
  int numberOfTurns;
  bool winner;

  CompilerGameRunReport(this.numberOfCoinsSpent, this.numberOfCoinsReceived,
      this.numberOfTurns, this.winner);

  factory CompilerGameRunReport.fromJson(Map<String, dynamic> json) =>
      _$CompilerGameRunReportFromJson(json);
}

enum CompilerPlayerStatus {
  WaitingForCompilerRun,
  CompilerIsRunning,
  FailedToCompile,
  TurnFunctionDidntCallPlay,
  CodeDidntReturn,
  MemoryLeakDetected,
  CompiledAndExecuted,
}
