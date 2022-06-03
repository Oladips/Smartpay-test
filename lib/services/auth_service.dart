import 'dart:convert';

import 'package:get/get.dart';
import 'package:test/helpers/constants.dart';
import 'package:test/models/token.dart';
import 'package:test/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:test/services/local_storage.dart';
import 'package:test/services/test.dart';

class AuthService implements Api {
  final prefs = Get.find<LocalSharedPreferences>();
  var client = http.Client();

  @override
  Future<Secret> dashboard({required String token}) async {
    var jsonrespon;
    var secret = null;
    try {
      var secret = null;
      final response = await client.get(
        Uri.parse(dashboardapi),
        headers: {'Authorization': 'Bearer $token'},
      );
      

      if (response.statusCode == 200) {
        print('success');
        jsonrespon = json.decode(response.body);
        secret = Secret.fromJson(jsonrespon);
        return secret;
      }
    } catch (e) {
      e.toString();
    }
    return secret;
  }

  @override
  Future getEmailToken({required String email}) async {
    try {
      final response = await client.post(
        Uri.parse(getEmailTokenapi),
        body: {
          'email': email,
        },
        headers: {'Accept': 'application/json'},
      );
      return ApiUtils.toApiResponse(response);
    } on Exception catch (e) {
      e.toString();
    }
  }

  @override
  Future loginUser({
    required String email,
    required String password,
    required String device_name,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(loginapi),
        body: {
          'email': email,
          'password': password,
          'device_name': device_name,
        },
        headers: {'Accept': 'application/json'},
      );

      return ApiUtils.toApiResponse(response);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Future logoutUser() async {
    var jsonrespon;
    try {
      final response = await client.post(
        Uri.parse(loginapi),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('success');
        jsonrespon = json.decode(response.body);
        print(jsonrespon['message']);
        print(jsonrespon['status']);
      }
    } catch (e) {
      e.toString();
    }
  }

  @override
  Future registerUser({
    required String email,
    required String username,
    required String fullname,
    required String country,
    required String password,
    required String device_name,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(registerapi),
        body: {
          'full_name': fullname,
          'username': username,
          'email': email,
          'country': country,
          'password': password,
          'device_name': device_name,
        },
        headers: {'Accept': 'application/json'},
      );

      return ApiUtils.toApiResponse(response);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Future verifyEmailToken({
    required String email,
    required String token,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(verifyEmailTokenapi),
        body: {
          'email': email,
          'token': token,
        },
        headers: {'Accept': 'application/json'},
      );

      return ApiUtils.toApiResponse(response);
    } on Exception catch (e) {
      e.toString();
    }
  }
}
