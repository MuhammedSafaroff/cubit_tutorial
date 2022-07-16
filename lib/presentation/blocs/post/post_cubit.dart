import 'package:bloc/bloc.dart';
import 'package:ders/core/state/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/post_model.dart';
import '../../../data/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<DataState<List<PostModel>, String>> {
  PostCubit() : super(const DataState(data: [], error: "Error"));

  PostRepository repository = PostRepository();

  Future<void> postFetch() async {
    emit(state.copyWith(isInProgress: true));
    try {
      List<PostModel> data = await repository.fetchPost();
      emit(state.copyWith(data: data, isSuccess: true));
    } on DioError catch (e) {
      emit(state.copyWith(isFailure: true, error: e.message));
    }
  }

  void shuffle() {
    List<PostModel> data = [...state.data!];
    data.shuffle();
    emit(state.copyWith(data: data, isSuccess: true));
  }
}
