import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_aassignments/feature/data/datasaources/feature_remote_source_impl.dart';
import 'package:test_aassignments/feature/data/repositories/fearute_reposotpry.dart';

import 'package:test_aassignments/feature/domain/usecases/get_user.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_list/user_list_bloc.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_list/user_list_event.dart';

import 'package:test_aassignments/feature/presntation/widget/userlistWidjet.dart';

import '../../../core/platform/network_info.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserListBloc(
            getUsers: GetUsers(FeatureRepositoryImpl(
          remoteDataSource: FeatureRemoteDataSourceImpl(),
          networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
        )))
          ..add(LoadUsersEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Список пользователей"),
          centerTitle: true,
        ),
        body: const UserListWidget(),
      ),
    );
  }
}
