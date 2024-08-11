import 'package:dartz/dartz.dart';
import 'package:test_aassignments/core/error/exceoption.dart';
import 'package:test_aassignments/core/error/failure.dart';
import 'package:test_aassignments/core/platform/network_info.dart';
import 'package:test_aassignments/feature/data/datasaources/feature_remote_source.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity_list.dart';
import 'package:test_aassignments/feature/domain/repositories/feature_repositori.dart';

class FeatureRepositoryImpl extends FeatureRepository {
  final FeatureRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  FeatureRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<UserListEntity>>> getUsers(
      int page, int totalUser) async {
    print("getUsers Future");
    if (await networkInfo.isConnected) {
      try {
        print("getUsers");
        final remoteUsers = await remoteDataSource.getUsers(page, totalUser);
        return Right(remoteUsers);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, UserDetailEntity>> getUser(String name) async {
    print("getUser Future");
    if (await networkInfo.isConnected) {
      try {
        print("getUsers");
        final remoteUser = await remoteDataSource.getUser(name);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
