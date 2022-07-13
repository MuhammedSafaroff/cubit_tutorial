import 'package:equatable/equatable.dart';

class DataState<D, E> extends Equatable {
  final bool isInProgress;
  final bool isFailure;
  final bool isSuccess;
  final D? data;
  final E? error;

  const DataState(
      {this.isInProgress = false,
      this.isFailure = false,
      this.isSuccess = false,
      this.data,
      this.error});

  DataState<D, E> copyWith({
    final bool? isInProgress,
    final bool? isFailure,
    final bool? isSuccess,
    final D? data,
    final E? error,
  }) {
    return DataState(
        isInProgress: isInProgress ?? false,
        isFailure: isFailure ?? false,
        isSuccess: isSuccess ?? false,
        data: data ?? this.data,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [
        isInProgress,
        isFailure,
        isSuccess,
        data,
        error,
      ];
}
