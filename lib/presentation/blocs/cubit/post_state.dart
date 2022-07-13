part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<PostModel> data;

  const PostSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class PostFailure extends PostState {
  final String message;

  const PostFailure(this.message);

  @override
  List<Object> get props => [message];
}
