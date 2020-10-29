// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    id: json['id'] as String,
    title: json['title'] as String,
    locationNames: json['locationNames'] as String,
    description: json['description'] as String,
    applyUrl: json['applyUrl'] as String,
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    isFeatured: json['isFeatured'] as bool,
  );
}
