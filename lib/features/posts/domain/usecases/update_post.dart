import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repositorie.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
