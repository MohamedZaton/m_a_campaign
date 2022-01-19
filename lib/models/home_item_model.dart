class HomeItemModel {
  String? labelName;
  String? iconPath;
  String? htmlGoPath;

  HomeItemModel({this.labelName, this.iconPath, this.htmlGoPath});

  factory HomeItemModel.fromJson(Map<String, dynamic> map) {
    return HomeItemModel(
      labelName: map['label_name'] ?? "",
      iconPath: map['icon_path'] ?? "",
      htmlGoPath: map['html_go_path'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label_name'] = this.labelName;
    data['icon_path'] = this.iconPath;
    data['html_go_path'] = this.htmlGoPath;
    return data;
  }

  static List<HomeItemModel> getListObject(List<dynamic> jsonBody) {
    List<HomeItemModel> itemsList = List<HomeItemModel>.from(
        jsonBody.map((val) => HomeItemModel.fromJson(val)));
    return itemsList;
  }
}
