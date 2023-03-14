import 'package:equatable/equatable.dart';

class AlbumModel extends Equatable{
  AlbumModel({
      this.userId, 
      this.id, 
      this.title,});

  AlbumModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
  num? userId;
  num? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }

  static List<AlbumModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => AlbumModel.fromJson(value)).toList();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userId,id,title];

}