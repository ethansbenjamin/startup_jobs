import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable(createToJson: false)
class Job {
  const Job({
    @required this.id,
    @required this.title,
    @required this.locationNames,
    @required this.description,
    @required this.applyUrl,
    this.isFeatured = false,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  final String id;
  final String title;
  final String locationNames;
  final bool isFeatured;
  final String description;
  final String applyUrl;
}
