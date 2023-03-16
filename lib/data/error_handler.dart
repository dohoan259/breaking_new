import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/error_entity.dart';

@singleton
class ErrorHandler {
  ErrorEntity handleError(error) {
    if (error is Exception) {
      try {
        late ErrorEntity networkException;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkException = RequestCancelledException();
              break;
            case DioErrorType.connectTimeout:
              networkException = RequestTimeoutException();
              break;
            case DioErrorType.other:
              if (error.toString().contains('is not a subtype of')) {
                networkException = FormatException(error.toString());
              } else {
                networkException = NetworkException();
              }
              break;
            case DioErrorType.receiveTimeout:
              networkException = SendTimeoutException();
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                case 401:
                case 403:
                  networkException = UnauthorisedException(
                      error.response?.statusMessage ?? 'Network exception');
                  break;
                case 404:
                  networkException = NotFoundException();
                  break;
                case 409:
                  networkException = ConflictException();
                  break;
                case 408:
                  networkException = RequestTimeoutException();
                  break;
                case 500:
                  networkException = ServerInternalException();
                  break;
                case 503:
                  networkException = ServiceUnavailableException();
                  break;
                default:
                  networkException = DefaultException(
                      'received invalid code : ${error.response?.statusCode}');
                  break;
              }
              break;
            case DioErrorType.sendTimeout:
              networkException = SendTimeoutException();
              break;
          }
        } else if (error is SocketException) {
          networkException = NetworkException();
        } else {
          networkException = UnexpectedException();
        }
        return networkException;
      } on FormatException catch (e) {
        return FormatException(e.message);
      } catch (_) {
        return UnexpectedException();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return UnableToProcess(error.toString());
      } else {
        return UnexpectedException();
      }
    }
  }
}
