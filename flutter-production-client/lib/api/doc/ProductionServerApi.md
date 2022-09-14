# prod_api.api.ProductionServerApi

## Load the API package
```dart
import 'package:prod_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getResponse**](ProductionServerApi.md#getresponse) | **GET** / | Get response


# **getResponse**
> RESULT getResponse(CMD, PARAM)

Get response

Get response

### Example
```dart
import 'package:prod_api/api.dart';
// TODO Configure API key authorization: ApiKeyAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('ApiKeyAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('ApiKeyAuth').apiKeyPrefix = 'Bearer';

final api_instance = ProductionServerApi();
final CMD = CMD_example; // String | Function name
final PARAM = PARAM_example; // String | String of function parameters (user=user1;pswd=B1734C3C466B3DDCDD3B841D02A24B56;id_lang=rus;YEAR=2021;MONTH=3;IZD=1200;page_size=1;Page=0)

try {
    final result = api_instance.getResponse(CMD, PARAM);
    print(result);
} catch (e) {
    print('Exception when calling ProductionServerApi->getResponse: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **CMD** | **String**| Function name | 
 **PARAM** | **String**| String of function parameters (user=user1;pswd=B1734C3C466B3DDCDD3B841D02A24B56;id_lang=rus;YEAR=2021;MONTH=3;IZD=1200;page_size=1;Page=0) | [optional] 

### Return type

[**RESULT**](RESULT.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

