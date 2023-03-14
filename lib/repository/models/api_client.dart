import 'package:dio/dio.dart';
import 'package:potentium_test/repository/models/album_model.dart';
import 'package:potentium_test/repository/models/images_model.dart';

import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('albums/')
  Future<List<AlbumModel>> getAlbums();
  
  @GET('albums/{album_id}/photos')
  Future<List<ImagesModel>> getImages(@Path("album_id") String id);

  @GET('albums?title={title}')
  Future<List<AlbumModel>> getAlbumsbySearch(@Path("title") String title);


}