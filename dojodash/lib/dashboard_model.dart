import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  List<TeamScoreModel> scores;

  DashboardModel(this.scores);

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
}

@JsonSerializable()
class TeamScoreModel {
  TeamInfoModel teamInfo;
  // List<MazeCompletedModel> mazesCompleted;
  // List<KeyFoundModel> keysFound;

  TeamScoreModel(
    this.teamInfo,
    // this.mazesCompleted,
    // this.keysFound
  );

  factory TeamScoreModel.fromJson(Map<String, dynamic> json) => _$TeamScoreModelFromJson(json);
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

  factory TeamInfoModel.fromJson(Map<String, dynamic> json) => _$TeamInfoModelFromJson(json);
}
