class PersonModel {
  PersonModel({
    required this.formId,
    required this.nameFull,
    required this.schoolDistract,
    required this.title,
    required this.phoneNumber,
    required this.email,
  });
  late final String formId;
  late final String nameFull;
  late final String schoolDistract;
  late final String title;
  late final String phoneNumber;
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
