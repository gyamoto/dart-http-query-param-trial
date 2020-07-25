part of openapi.api;



class PetApi {
  final ApiClient apiClient;

  PetApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Find pet by ID with HTTP info returned
  ///
  /// Returns a single pet
  Future<Response> getPetByIdsWithHttpInfo(List<int> petIds) async {
    Object postBody;

    // verify required params are set
    if(petIds == null) {
     throw ApiException(400, "Missing required param: petIds");
    }

    // create path and map variables
    String path = "/pet".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("multi", "petIds", petIds));

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Find pet by ID
  ///
  /// Returns a single pet
  Future<List<Pet>> getPetByIds(List<int> petIds) async {
    Response response = await getPetByIdsWithHttpInfo(petIds);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Pet>') as List).map((item) => item as Pet).toList();
    } else {
      return null;
    }
  }

}
