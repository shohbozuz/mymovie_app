import 'dart:io';

import 'package:mymovie/core/constants/base_url.dart';
import 'package:mymovie/models/get_users_model.dart';
import 'package:dio/dio.dart';

// class GetUserService {
//   static Future<List<UsersModel>> getUsers() async {
//     try {
//       Response res = await Dio().get(BaseUrls.apiUrl);
//       if (res.statusCode == HttpStatus.ok) {
//         var resData =
//         (res.data as List).map((e) => UsersModel.fromJson(e)).toList();
//         return resData;
//       } else {
//         print("The request returned an invalid status code of ${res.statusCode}");
//         return [];
//       }
//     } catch (e) {
//       print(e);
//       return Future.error(e);
//
//     }
//   }
// }



