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

  TeamScoreModel(this.teamInfo, this.mazesCompleted, this.keysFound);

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
