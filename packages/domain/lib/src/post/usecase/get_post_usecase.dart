import 'package:core/errors.dart';
import 'package:core/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetPostParams extends Equatable {
  const GetPostParams({required this.offset, this.limit = 10});

  final int offset;
  final int limit;

  @override
  List<Object> get props => [offset, limit];
}

class GetPostUseCase implements UseCase<List<PostDisplay>, GetPostParams> {
  GetPostUseCase({required PostRepository postRepository})
    : _postRepository = postRepository;

  final PostRepository _postRepository;

  @override
  Future<Either<Failure, List<PostDisplay>>> call(GetPostParams params) async {
    return await _postRepository.getPosts(
      offset: params.offset,
      limit: params.limit,
    );
  }
}
