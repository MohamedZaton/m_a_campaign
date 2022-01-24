import 'package:hive/hive.dart';

part 'persion_model.g.dart';

@HiveType(typeId: 0)
class PersonModel extends HiveObject {
  PersonModel({
    this.formId = "33",
    required this.nameFull,
    required this.schoolDistract,
    required this.title,
    required this.phoneNumber,
    required this.email,
  });
  @HiveField(0)
  late final String formId;
  @HiveField(1)
  late final String nameFull;
  @HiveField(2)
  late final String schoolDistract;
  @HiveField(3)
  late final String title;
  @HiveField(4)
  late final String phoneNumber;
  @HiveField(5)
  late final String email;
  String _nameEntyID = "1.3";
  String _schoolEntyID = "4";
  String _titleEntyID = "7";
  String _phoneEntyID = "3";
  String _emalEntyID = "2";

  PersonModel.fromJson(Map<String, dynamic> json) {
    formId = json['form_id'];
    nameFull = json[_nameEntyID];
    schoolDistract = json[_schoolEntyID];
    title = json[_titleEntyID];
    phoneNumber = json[_phoneEntyID];
    email = json[_emalEntyID];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['form_id'] = formId;
    _data[_nameEntyID] = nameFull;
    _data[_schoolEntyID] = schoolDistract;
    _data[_titleEntyID] = title;
    _data[_phoneEntyID] = phoneNumber;
    _data[_emalEntyID] = email;
    return _data;
  }
}
