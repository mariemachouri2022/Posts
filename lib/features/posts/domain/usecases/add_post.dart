import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repositorie.dart';

class AddPostUsecase {
  final PostsRepository repository;

  AddPostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
