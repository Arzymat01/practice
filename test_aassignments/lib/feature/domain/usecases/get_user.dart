import 'package:dartz/dartz.dart';

import 'package:test_aassignments/core/error/failure.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity_list.dart';
import 'package:test_aassignments/feature/domain/repositories/feature_repositori.dart';

class GetUsers {
  final FeatureRepository featureRepository;

  GetUsers(this.featureRepository);

  Future<Either<Failure, List<UserListEntity>>> getUsers(
      int page, int totalUser) async {
    print("featureRepository.getUsers()");
    return await featureRepository.getUsers(page, totalUser);
  }

  Future<Either<Failure, UserDetailEntity>> getUser(String name) async {
    print("featureRepository.getUser()");
    return await featureRepository.getUser(name);
  }
}
