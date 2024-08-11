import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aassignments/feature/domain/entites/user_entity_list.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_list/user_list_bloc.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_list/user_list_event.dart';
import 'package:test_aassignments/feature/presntation/bloc/user_list/user_list_state.dart';
import 'package:test_aassignments/feature/presntation/screens/user_detail_screen.dart';
import 'package:test_aassignments/feature/presntation/widget/pagination.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userListBloc = BlocProvider.of<UserListBloc>(context);
    return RefreshIndicator(
      onRefresh: () async {
        userListBloc.add(LoadUsersEvent());
      },
      child: SingleChildScrollView(
        child:
            BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
          List<UserListEntity> listUser = [];
          if (state is UserListLoading) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is UserListLoaded) {
            listUser = state.users;
          } else if (state is UserListError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(state.message),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    userListBloc.add(LoadUsersEvent());
                  },
                  child: const Text("Update"),
                ),
              ],
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PaginationContainerWidget(
                    onTap: () {
                      userListBloc.page--;
                      userListBloc.add(LoadUsersEvent());
                    },
                    isEnable: userListBloc.page > 1 ? true : false,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: userListBloc.page > 1
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                  PaginationContainerWidget(
                      child: Text(
                    userListBloc.page.toString(),
                    style: const TextStyle(fontSize: 20),
                  )),
                  PaginationContainerWidget(
                    onTap: () {
                      userListBloc.page++;
                      userListBloc.add(LoadUsersEvent());
                    },
                    isEnable: userListBloc.page < 10 ? true : false,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: userListBloc.page < 10
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(
                            login: listUser.elementAt(index).login ?? "",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    listUser.elementAt(index).avatarUrl ?? "")),
                          ),
                        ),
                        title: Text(listUser.elementAt(index).login ?? "login"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: listUser.length,
              ),
            ],
          );
        }),
      ),
    );
  }
}
