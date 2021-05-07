// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return DashboardModel(
    (json['scores'] as List<dynamic>)
        .map((e) => TeamScoreModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'scores': instance.scores,
    };

TeamScoreModel _$TeamScoreModelFromJson(Map<String, dynamic> json) {
  return TeamScoreModel(
    TeamInfoModel.fromJson(json['teamInfo'] as Map<String, dynamic>),
    (json['mazesCompleted'] as List<dynamic>)
        .map((e) => MazeCompletedModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['keysFound'] as List<dynamic>)
        .map((e) => KeyFoundModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['compilerGameRuns'] as List<dynamic>)
        .map((e) => CompilerGameRunModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TeamScoreModelToJson(TeamScoreModel instance) =>
    <String, dynamic>{
      'teamInfo': instance.teamInfo,
      'mazesCompleted': instance.mazesCompleted,
      'keysFound': instance.keysFound,
      'compilerGameRuns': instance.compilerGameRuns,
    };

TeamInfoModel _$TeamInfoModelFromJson(Map<String, dynamic> json) {
  return TeamInfoModel(
    json['teamName'] as String,
    json['iconUrl'] as String,
    json['teamMembers'] as String,
    json['repositoryUrl'] as String,
  );
}

Map<String, dynamic> _$TeamInfoModelToJson(TeamInfoModel instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'iconUrl': instance.iconUrl,
      'teamMembers': instance.teamMembers,
      'repositoryUrl': instance.repositoryUrl,
    };

MazeCompletedModel _$MazeCompletedModelFromJson(Map<String, dynamic> json) {
  return MazeCompletedModel(
    json['stepsTaken'] as int,
    json['mazeSize'] as int,
    json['numberOfHits'] as int,
    json['numberOfTimesHit'] as int,
    DateTime.parse(json['utc'] as String),
  );
}

Map<String, dynamic> _$MazeCompletedModelToJson(MazeCompletedModel instance) =>
    <String, dynamic>{
      'stepsTaken': instance.stepsTaken,
      'mazeSize': instance.mazeSize,
      'numberOfHits': instance.numberOfHits,
      'numberOfTimesHit': instance.numberOfTimesHit,
      'utc': instance.utc.toIso8601String(),
    };

KeyFoundModel _$KeyFoundModelFromJson(Map<String, dynamic> json) {
  return KeyFoundModel(
    DateTime.parse(json['playerStartUtc'] as String),
    DateTime.parse(json['keyFoundUtc'] as String),
    json['numberOfEntriesEvaluated'] as int,
  );
}

Map<String, dynamic> _$KeyFoundModelToJson(KeyFoundModel instance) =>
    <String, dynamic>{
      'playerStartUtc': instance.playerStartUtc.toIso8601String(),
      'keyFoundUtc': instance.keyFoundUtc.toIso8601String(),
      'numberOfEntriesEvaluated': instance.numberOfEntriesEvaluated,
    };

CompilerGameRunModel _$CompilerGameRunModelFromJson(Map<String, dynamic> json) {
  return CompilerGameRunModel(
    DateTime.parse(json['utc'] as String),
    json['numberOfGames'] as int,
    json['totalCoinsSpent'] as int,
    json['totalCoinsReceived'] as int,
    json['totalNumberOfTurns'] as int,
    json['totalNumberOfWins'] as int,
  );
}

Map<String, dynamic> _$CompilerGameRunModelToJson(
        CompilerGameRunModel instance) =>
    <String, dynamic>{
      'utc': instance.utc.toIso8601String(),
      'numberOfGames': instance.numberOfGames,
      'totalCoinsSpent': instance.totalCoinsSpent,
      'totalCoinsReceived': instance.totalCoinsReceived,
      'totalNumberOfTurns': instance.totalNumberOfTurns,
      'totalNumberOfWins': instance.totalNumberOfWins,
    };
