# openapi.api.PetApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://example.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPetByIds**](PetApi.md#getPetByIds) | **GET** /pet | Find pet by ID


# **getPetByIds**
> List<Pet> getPetByIds(petIds)

Find pet by ID

Returns a single pet

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = PetApi();
var petIds = []; // List<int> | ID of pet to return

try { 
    var result = api_instance.getPetByIds(petIds);
    print(result);
} catch (e) {
    print("Exception when calling PetApi->getPetByIds: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petIds** | [**List&lt;int&gt;**](int.md)| ID of pet to return | [default to []]

### Return type

[**List<Pet>**](Pet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

