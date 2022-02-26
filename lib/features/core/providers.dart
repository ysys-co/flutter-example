import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final client = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      validateStatus: (_) => true,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
    ));
});
