import 'package:dartz/dartz.dart';
import 'package:test_aassignments/core/error/failure.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity_list.dart';

abstract class FeatureRepository {
  Future<Either<Failure, List<UserListEntity>>> getUsers(
      int page, int totalUser);
  Future<Either<Failure, UserDetailEntity>> getUser(String name);
}
