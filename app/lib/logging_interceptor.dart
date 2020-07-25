import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';

const _name = 'http';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    final title = 'REQUEST [${methodToString(data.method)}]';
    log('$title ${data.url}', name: _name);

    if (data.headers != null && data.headers.isNotEmpty) {
      log('$title headers: ${data.headers}', name: _name);
    }

    if (data.params != null && data.params.isNotEmpty) {
      log('$title params: ${data.params}', name: _name);
    }

    if (data.body != null) {
      log('$title body: ${data.body}', name: _name);
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    final title = 'REQUEST [${methodToString(data.method)}]';
    log('$title ${data.statusCode} ${data.url}', name: _name);

    if (data.headers != null && data.headers.isNotEmpty) {
      log('$title headers: ${data.headers}', name: _name);
    }

    if (data.body != null) {
      log('$title body: ${data.body}', name: _name);
    }

    return data;
  }
}
