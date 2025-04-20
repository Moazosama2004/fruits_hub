import 'dart:convert';

import 'package:fruits_hub/config/cache_helper/cache_helper.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUserEntitiy() {
  var jsonString = CacheHelper.getString(key: kUserData);
  var userEntitiy = UserModel.fromJson(jsonDecode(jsonString!));
  return userEntitiy;
}
