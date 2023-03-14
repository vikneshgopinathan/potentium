import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potentium_test/repository/models/album_model.dart';
import 'package:potentium_test/repository/models/api_client.dart';
import 'package:potentium_test/repository/models/images_model.dart';


void main(){

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dog.ceo/api',
    ),
  );

  final ApiClient apiClient = ApiClient(dio);

  test('test list of albums end point',() async {
   List<AlbumModel> albumList = await  apiClient.getAlbums();
 // print(albumList);
   expect(albumList.length != 0, true );
  });
  test('test list of Photos end point',() async {
    List<ImagesModel> albumList = await  apiClient.getImages("1");
   // print(albumList);
    expect(albumList.length != 0, true );
  });

  test('test list of search end point',() async {
    List<AlbumModel> albumList = await  apiClient.getAlbumsbySearch("a");
     print(albumList);
    expect(albumList.length != 0, true );
  });

}