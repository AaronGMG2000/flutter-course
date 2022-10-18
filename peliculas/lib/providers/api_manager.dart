import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:peliculas/models/response_model.dart';
import 'package:peliculas/utils/app_type.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._privateConstructor();

  static final ApiManager shared = ApiManager._privateConstructor();

  final Map<String, String> _myHeaders = {};

  Future<ServiceResponse> request({
    required String baseUrl,
    required String pathUrl,
    required HttpType type,
    dynamic bodyParams,
    Map<String, dynamic>? uriParams = const {},
    Map<String, String> headers = const {},
  }) async {
    final uri = Uri.https(baseUrl, pathUrl, uriParams);

    _myHeaders.addAll(headers);

    Response response;
    switch (type) {
      case HttpType.get:
        response = await http.get(uri, headers: _myHeaders);
        break;
      case HttpType.post:
        response = await http.post(
          uri,
          body: jsonEncode(bodyParams),
          headers: _myHeaders,
        );
        break;
      case HttpType.put:
        response = await http.put(
          uri,
          body: jsonEncode(bodyParams),
          headers: _myHeaders,
        );
        break;
      case HttpType.patch:
        response = await http.patch(
          uri,
          body: jsonEncode(bodyParams),
          headers: _myHeaders,
        );
        break;
      case HttpType.delete:
        response = await http.delete(uri);
        break;
    }

    if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
      return ServiceResponse.success(response.statusCode, response.reasonPhrase, json.decode(response.body));
    } else {
      return ServiceResponse.error(response.statusCode, response.reasonPhrase);
    }
  }
}
