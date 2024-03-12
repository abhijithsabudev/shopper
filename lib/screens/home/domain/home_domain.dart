import 'dart:developer';

import 'package:shopper/utils/api/api_endpoints.dart';
import 'package:shopper/utils/api/api_service.dart';

class AuthRepository {
  final apiServices = ApiServices();

  /// >> Sign in Api Call >>
  Future getData() async {
    try {
      log('get data api calling');
      var response = await apiServices.dioRequestPublic(
        url: ApiEndPoints.baseUrl,
        method: DioMethod.get,
      );
      final json = response as List<dynamic>;
      //  log('response => ${json.toString()}');
      return json;
    } catch (e) {
      log('problem => ${e.toString()}');
      throw Exception(e);
    }
  }
}
