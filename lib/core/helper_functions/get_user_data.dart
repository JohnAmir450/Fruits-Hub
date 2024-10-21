import 'dart:convert';

import 'package:fruit_hub/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_model.dart';

import '../utils/constants.dart';

 UserEntity  getUser() {
  var jsonString = Prefs.getString(kSaveUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
return userEntity;
}
