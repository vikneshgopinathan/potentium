class ImagesModel {
  ImagesModel({
      this.albumId, 
      this.id, 
      this.title, 
      this.url, 
      this.thumbnailUrl,});

  ImagesModel.fromJson(dynamic json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
  num? albumId;
  num? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }
  static List<ImagesModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ImagesModel.fromJson(value)).toList();
  }
}