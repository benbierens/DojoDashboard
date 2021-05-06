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
  );
}

Map<String, dynamic> _$TeamScoreModelToJson(TeamScoreModel instance) =>
    <String, dynamic>{
      'teamInfo': instance.teamInfo,
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
