import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productos_app/utils/urils.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _firebaseToken = 'AIzaSyAzqHS5UCQ50Zg0nGfwtONoTOcwg5tbP44';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
      Urls.auth,
      Access.authRegister,
      {'key': _firebaseToken},
    );

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }
    return decodeResp['error']['message'];
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
      Urls.auth,
      Access.authLogin,
      {'key': _firebaseToken},
    );

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }

    return decodeResp['error']['message'];
  }

  Future logout() async {
    await storage.delete(key: 'token');
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
