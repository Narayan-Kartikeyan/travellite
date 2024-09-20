import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start auth Group Code

class AuthGroup {
  static String getBaseUrl() =>
      'https://cpaas.messagecentral.com/verification/v3/';
  static Map<String, String> headers = {};
  static PostotpCall postotpCall = PostotpCall();
  static ValidateotpCall validateotpCall = ValidateotpCall();
}

class PostotpCall {
  Future<ApiCallResponse> call({
    String? num = '9686031673',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'postotp',
      apiUrl: '${baseUrl}send?countryCode=91&flowType=SMS&mobileNumber=${num}',
      callType: ApiCallType.POST,
      headers: {
        'authToken':
            'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLTExNjYzOURGNEI3NjQ3RSIsImlhdCI6MTcyMTExMTAwOCwiZXhwIjoxODc4NzkxMDA4fQ.ySz1NtS9_MPsjgrSqfGP_dl0FZkegB0dzerXnM8VtkkVf097P254F_z8waaTjnuwKijfICCdeWcqseLgZtIrBw',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic verifid(dynamic response) => getJsonField(
        response,
        r'''$.data.verificationId''',
      );
}

class ValidateotpCall {
  Future<ApiCallResponse> call({
    int? id,
    String? code = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'validateotp',
      apiUrl: '${baseUrl}validateOtp?verificationId=${id}&code=${code}',
      callType: ApiCallType.GET,
      headers: {
        'authToken':
            'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLTExNjYzOURGNEI3NjQ3RSIsImlhdCI6MTcyMTExMTAwOCwiZXhwIjoxODc4NzkxMDA4fQ.ySz1NtS9_MPsjgrSqfGP_dl0FZkegB0dzerXnM8VtkkVf097P254F_z8waaTjnuwKijfICCdeWcqseLgZtIrBw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End auth Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
