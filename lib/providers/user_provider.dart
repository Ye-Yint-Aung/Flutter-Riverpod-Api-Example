import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/model/user.dart';
import 'package:riverpod_api/services/api_service.dart';

final userProvider = FutureProvider<List<UserModel>>(
  (ref) async {
    return ref.read(apiProvider).getUser();
  },
);
