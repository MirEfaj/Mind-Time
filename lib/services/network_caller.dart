import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final bool isSuccess;
  final Map<String, dynamic>? body;
  final String? errorMessage;
  final int statusCode;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });
}

class NetworkCaller {
  static const String _defaultErrorMsg = "Something Went Wrong";
  static const String _unAutMsg = "Unauthorized Request";

  /// ====================== GET ======================
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, null);
      Response response = await get(uri);
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAutMsg,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _defaultErrorMsg,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  /// ====================== POST ======================
  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body);
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      _logResponse(url, response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAutMsg,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _defaultErrorMsg,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  /// ====================== PUT ======================
  static Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body);
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      Response response = await put(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      _logResponse(url, response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAutMsg,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _defaultErrorMsg,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  /// ====================== DELETE ======================
  static Future<NetworkResponse> deleteRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, null);
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      Response response = await delete(uri, headers: headers);
      _logResponse(url, response);

      if (response.statusCode == 200 || response.statusCode == 204) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: response.body.isNotEmpty ? jsonDecode(response.body) : null,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAutMsg,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _defaultErrorMsg,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  /// ====================== Logger ======================
  static void _logRequest(String url, Map<String, dynamic>? body) {
    debugPrint(
      "==========Request==================\nURL : $url\n BODY : $body\n========================================",
    );
  }

  static void _logResponse(String url, Response response) {
    debugPrint(
      "==========Response==================\nURL : $url\n StatusCode : ${response.statusCode}\nBODY : ${response.body}\n========================================",
    );
  }
}
