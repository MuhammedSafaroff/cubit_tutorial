import 'package:ders/core/constants/endpoints.dart';
import 'package:ders/data/model/album_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'album_data_source.g.dart';

abstract class AlbumDataSource {
  Future<AlbumModel> fetchAlbum(String id);
}

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AlbumDataSourceImpl implements AlbumDataSource {
  factory AlbumDataSourceImpl(Dio dio, {String baseUrl}) = _AlbumDataSourceImpl;

  @override
  @GET(EndPoints.albums)
  Future<AlbumModel> fetchAlbum(@Path() String id);
}
