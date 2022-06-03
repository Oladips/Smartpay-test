import 'package:http/http.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.statusCode,
      data: res.body,
    );
  }
}

class ApiResponse {
  final int? statusCode;
  final dynamic data;

  ApiResponse({
    this.statusCode,
    this.data,
  });

  @override
  String toString() {
    return '$data';
  }
}
