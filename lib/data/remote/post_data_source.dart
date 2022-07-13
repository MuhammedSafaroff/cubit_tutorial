import 'package:ders/core/constants/endpoints.dart';
import 'package:ders/data/model/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'post_data_source.g.dart';

abstract class PostDataSource {
  Future<List<PostModel>> fetchPost();
}

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class PostDataSourceImpl implements PostDataSource {
  factory PostDataSourceImpl(Dio dio, {String baseUrl}) = _PostDataSourceImpl;

  @override
  @GET(EndPoints.posts)
  Future<List<PostModel>> fetchPost();
}
