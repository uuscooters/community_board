import 'package:core/errors.dart';
import 'package:core/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../post.dart';

class GetCommentParams extends Equatable {
  const GetCommentParams({
    required this.postId,
    required this.offset,
    this.limit = 10,
  });

  final String postId;
  final int offset;
  final int limit;

  @override
  List<Object> get props => [postId, offset, limit];
}

class GetCommentUseCase
    implements UseCase<List<CommentDisplay>, GetCommentParams> {
  GetCommentUseCase({required PostRepository postRepository})
    : _postRepository = postRepository;

  final PostRepository _postRepository;

  @override
  Future<Either<Failure, List<CommentDisplay>>> call(
    GetCommentParams params,
  ) async {
    return await _postRepository.getComments(
      postId: params.postId,
      offset: params.offset,
      limit: params.limit,
    );
  }
}
