import 'package:dio/dio.dart';

import '../model/album_model.dart';
import '../remote/album_data_source.dart';

class AlbumRepository {
  AlbumDataSourceImpl album = AlbumDataSourceImpl(Dio());

  Future<AlbumModel> fetchAlbum(String id) async {
    return await album.fetchAlbum(id);
  }
}
