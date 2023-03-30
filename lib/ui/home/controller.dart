import 'package:dio_blog/data/models/user/new_user_model.dart';
import 'package:dio_blog/data/models/user/user_model.dart';
import 'package:dio_blog/data/repository/user_repository.dart';
import 'package:dio_blog/di/service_locator.dart';
import 'package:flutter/material.dart';

class HomeController {
  // --------------- Repository -------------
  final userRepository = getIt.get<UserRepository>();

  // -------------- Textfield Controller ---------------
  final emailController = TextEditingController();
  final companyController = TextEditingController();

  // -------------- Local Variables ---------------
  final List<NewUser> newUsers = [];

  // -------------- Methods ---------------

  Future<List<UserModel>> getUsers() async {
    final users = await userRepository.getUsersRequested();
    return users;
  }

  Future<NewUser> addNewUser() async {
    final newlyAddedUser = await userRepository.addNewUserRequested(
      emailController.text,
      companyController.text,
    );
    newUsers.add(newlyAddedUser);
    return newlyAddedUser;
  }

  Future<NewUser> updateUser(int id, String email, String company) async {
    final updatedUser = await userRepository.updateUserRequested(
      id,
      email,
      company,
    );
    newUsers[id] = updatedUser;
    return updatedUser;
  }

  Future<void> deleteNewUser(int id) async {
    await userRepository.deleteNewUserRequested(id);
    newUsers.removeAt(id);
  }
}
