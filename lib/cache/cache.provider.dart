import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lecture_one/constant/api.constant.dart';
import 'package:lecture_one/model/user.model.dart';

class CacheProvider with ChangeNotifier {
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  Future<void> getData() async {
    final fileInfo = await _loadFromChache();
    if (fileInfo != null && fileInfo.file != null) {
      String cachedData = await fileInfo.file.readAsString();

      print('Cached Data: $cachedData');

      List<dynamic> jsonList = json.decode(cachedData);

      print('----------------- Data from cache:');
      print(jsonList);

      List<UserModel> userModelList = jsonList.map((json) {
        return UserModel.fromJson(json);
      }).toList();

      _users = userModelList;

      print('----------------- Data from cache:');
      print(userModelList);
    } else {
      print('Data not in cache. Fetching from network...');
      _users = await _getTodoUsers();
    }
    notifyListeners();
  }

  Future<dynamic> _loadFromChache() async {
    WidgetsFlutterBinding.ensureInitialized();
    DefaultCacheManager cacheManager = DefaultCacheManager();
    dynamic fileInfo = await cacheManager.getFileFromCache(API.users);
    return fileInfo;
  }

  Future<List<UserModel>> _getTodoUsers() async {
    Dio dio = Dio();
    DefaultCacheManager cacheManager = DefaultCacheManager();

    final response = await dio.get(API.users);
    List<dynamic> jsonResponse = response.data;
    List<UserModel> userData =
        jsonResponse.map((e) => UserModel.fromJson(e)).toList();

    List<Map<String, dynamic>> userMaps =
        userData.map((user) => user.toMap()).toList();
    String jsonString = json.encode(userMaps);

    await cacheManager.putFile(
        response.realUri.toString(), Uint8List.fromList(jsonString.codeUnits));
    FileInfo cachedFile = await cacheManager
        .getFileFromCache(response.realUri.toString()) as FileInfo;
    return userData;
  }

  void clearCache() async {
    DefaultCacheManager cacheManager = DefaultCacheManager();
    await cacheManager.emptyCache();
    print('Cache cleared');
  }
}
