import '../repositories/post_repositorie.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
