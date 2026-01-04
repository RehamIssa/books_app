import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        //The timeout happened while trying to connect to the API server
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad Certificate Error');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.message!,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection with ApiServer Error');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(errorMessage: 'No Internet Connection');
        } else {
          return ServerFailure(
            errorMessage: 'Unexpected Error, Please try again!',
          );
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Your request not found, please try again later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error, please try again later',
      );
    } else {
      return ServerFailure(
        errorMessage: 'Something went wrong, please try again',
      );
    }
  }
}
