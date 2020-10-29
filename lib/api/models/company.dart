import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(createToJson: false)
class Company {
  const Company({this.name, this.logoUrl, this.websiteUrl});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  final String name;
  final String logoUrl;
  final String websiteUrl;
}
