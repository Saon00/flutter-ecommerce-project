import 'dart:convert';

import 'package:demo/data/models/response_model.dart';
import 'package:demo/data/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  // singleton -> if i don't want
  // to make instance of this class
  NetworkCaller._();

  // by using ResponseModel class
  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(Uri.parse(URLs.baseURL + url));
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returndata: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returndata: jsonDecode(response.body));
      }
    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel(
          isSuccess: false, statusCode: -1, returndata: e.toString());
    }
  }
}

/* without using ResponseModel
 try {
      final Response response = await get(Uri.parse(URLs.baseURL + url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
*/
