import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rafay_dairies_and_farms/data/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  Map<String, dynamic> tokenMap = {"token": "some_token_value"};
  dynamic responseJson;
  Future<dynamic> getApi(String url, String? token) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on RequestTimeout {
      throw RequestTimeout('');
    }

    return responseJson;
  }

  Future<dynamic> postApi(var data, String url, {String? token}) async {
    try {
      if (token == null && tokenMap.containsKey('token')) {
        token = tokenMap['token'];
      }
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on RequestTimeout {
      throw RequestTimeout('this is request timeout');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException('Error' +
            response.statusCode.toString() +
            'occured while communicating with server');
    }
  }
}
