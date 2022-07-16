import 'package:bloc/bloc.dart';
import 'package:ders/core/state/data_state.dart';
import 'package:ders/data/model/album_model.dart';
import 'package:ders/data/repositories/album_repository.dart';
import 'package:dio/dio.dart';

class AlbumCubit extends Cubit<DataState<AlbumModel, String>> {
  AlbumCubit() : super(const DataState());

  AlbumRepository repository = AlbumRepository();

  Future<void> fetchAlbum(id) async {
    emit(state.copyWith(isInProgress: true));
    try {
      AlbumModel data = await repository.fetchAlbum(id);

      emit(state.copyWith(isSuccess: true, data: data));
    } on DioError catch (e) {
      emit(state.copyWith(isFailure: true, error: e.message));
    }
  }
}
