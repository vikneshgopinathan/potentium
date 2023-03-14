import 'dart:async';

import 'package:dio/dio.dart';
import 'package:potentium_test/repository/models/album_model.dart';
import 'package:potentium_test/repository/models/api_client.dart';
import 'package:potentium_test/repository/models/images_model.dart';

class AlbumRepository {

  static final AlbumRepository _albumRepository = AlbumRepository._internal();

  factory AlbumRepository(){
    return _albumRepository;
  }

  AlbumRepository._internal();

  Future<List<AlbumModel>> fetchAlbums() async {
    return await ApiClient(Dio()).getAlbums();
  }

  Future<List<ImagesModel>> fetchImages(String id) async {
    return await ApiClient(Dio()).getImages(id);
  }


  Future<List<AlbumModel>> fetchAlbumsbySearch(String title) async {
    return await ApiClient(Dio()).getAlbumsbySearch(title);
  }
}