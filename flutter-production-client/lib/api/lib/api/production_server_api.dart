//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProductionServerApi {
  ProductionServerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get response
  ///
  /// Get response
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] CMD (required):
  ///   Function name
  ///
  /// * [String] PARAM:
  ///   String of function parameters (user=user1;pswd=B1734C3C466B3DDCDD3B841D02A24B56;id_lang=rus;YEAR=2021;MONTH=3;IZD=1200;page_size=1;Page=0)
  Future<Response> getResponseWithHttpInfo(String CMD, { String? PARAM, }) async {
    // ignore: prefer_const_declarations
    final path = r'/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'CMD', CMD));
    if (PARAM != null) {
      queryParams.addAll(_queryParams('', 'PARAM', PARAM));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get response
  ///
  /// Get response
  ///
  /// Parameters:
  ///
  /// * [String] CMD (required):
  ///   Function name
  ///
  /// * [String] PARAM:
  ///   String of function parameters (user=user1;pswd=B1734C3C466B3DDCDD3B841D02A24B56;id_lang=rus;YEAR=2021;MONTH=3;IZD=1200;page_size=1;Page=0)
  Future<RESULT?> getResponse(String CMD, { String? PARAM, }) async {
    final response = await getResponseWithHttpInfo(CMD,  PARAM: PARAM, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RESULT',) as RESULT;
    
    }
    return null;
  }
}
