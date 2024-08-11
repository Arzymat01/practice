import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_aassignments/core/platform/network_info.dart';
import 'package:test_aassignments/feature/data/datasaources/feature_remote_source_impl.dart';
import 'package:test_aassignments/feature/data/repositories/fearute_reposotpry.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity.dart';
import 'package:test_aassignments/feature/domain/usecases/get_user.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_detail/user_detail_bloc.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_detail/user_detail_event.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_detail/user_detail_state.dart';

class UserDetailScreen extends StatelessWidget {
  final String login;
  const UserDetailScreen({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
          create: (context) {
            return UserDetailBloc(
                getUsers: GetUsers(FeatureRepositoryImpl(
                  remoteDataSource: FeatureRemoteDataSourceImpl(),
                  networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.createInstance()),
                )),
                login: login)
              ..add(LoadUserDetailEvent());
          },
          child: const UserDetailWidget()),
    );
  }
}

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
        UserDetailEntity? userDetailEntity;
        if (state is UserDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserDetailLoaded) {
          userDetailEntity = state.user;
        } else if (state is UserDetailError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(state.message),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<UserDetailBloc>(context)
                      .add(LoadUserDetailEvent());
                },
                child: Text("Обновить"),
              ),
            ],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(userDetailEntity?.avatarUrl ?? "")),
              ),
            ),
            SizedBox(height: 20),
            Text(userDetailEntity?.login ?? "Login"),
            SizedBox(height: 40),
            _rowTitleAndText(
              title: "Имя",
              text: userDetailEntity?.name ?? "Name",
            ),
            SizedBox(height: 20),
            _rowTitleAndText(
              title: "Био",
              text: userDetailEntity?.bio ?? "Bio",
            ),
            SizedBox(height: 20),
            _rowTitleAndText(
              title: "Локация",
              text: userDetailEntity?.location ?? "Location",
            ),
            SizedBox(height: 20),
            _rowTitleAndText(
              title: "Email",
              text: userDetailEntity?.email ?? "Email",
            ),
            SizedBox(height: 20),
            _rowTitleAndText(
              title: "Подписчики",
              text: "${userDetailEntity?.followers ?? "Незвестно"}",
            ),
            SizedBox(height: 20),
            _rowTitleAndText(
              title: "Подписки",
              text: "${userDetailEntity?.following ?? "Незвестно"}",
            ),
          ],
        );
      }),
    );
  }

  Widget _rowTitleAndText({required String title, required String text}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
