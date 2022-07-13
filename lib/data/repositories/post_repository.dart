import 'package:dio/dio.dart';

import '../model/post_model.dart';
import '../remote/post_data_source.dart';

class PostRepository {
  PostDataSourceImpl post = PostDataSourceImpl(Dio());

  Future<List<PostModel>> fetchPost() async {
    return await post.fetchPost();
  }
}
