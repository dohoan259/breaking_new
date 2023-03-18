class ErrorEntity implements Exception {
  const ErrorEntity(
      {required this.title, required this.message, this.tag, this.params});

  final String title;
  final String message;
  final String? tag;
  final dynamic params;

  @override
  String toString() {
    return '$title $message';
  }
}

class NetworkException extends ErrorEntity {
  NetworkException()
      : super(title: 'Network Error', message: 'No Internet connection');
}

class RequestCancelledException extends ErrorEntity {
  RequestCancelledException()
      : super(title: 'Request cancelled', message: 'Cancelled');
}

class BadRequestException extends ErrorEntity {
  BadRequestException(String message)
      : super(title: 'Invalid Request', message: message);
}

class UnauthorisedException extends ErrorEntity {
  UnauthorisedException(String message)
      : super(title: 'Unauthorised', message: message);
}

class NotFoundException extends ErrorEntity {
  NotFoundException()
      : super(title: 'Not Found', message: 'The page is not exist');
}

class FetchDataException extends ErrorEntity {
  FetchDataException(String message)
      : super(title: 'Error During Communication', message: message);
}

class ConflictException extends ErrorEntity {
  ConflictException() : super(title: 'Conflict', message: 'Conflict');
}

class RequestTimeoutException extends ErrorEntity {
  RequestTimeoutException()
      : super(title: 'Timeout', message: 'Request time out');
}

class SendTimeoutException extends ErrorEntity {
  SendTimeoutException() : super(title: 'Timeout', message: 'Send timeout');
}

class ServiceUnavailableException extends ErrorEntity {
  ServiceUnavailableException()
      : super(title: 'Service unavailable', message: 'Unavailable');
}

class UnexpectedException extends ErrorEntity {
  UnexpectedException() : super(title: 'Unexpected', message: 'Unexpected');
}

class UnableToProcess extends ErrorEntity {
  UnableToProcess(String message)
      : super(title: 'Unexpected', message: message);
}

class FormatException extends ErrorEntity {
  FormatException(String message)
      : super(title: 'Formatted exception', message: message);
}

class ServerInternalException extends ErrorEntity {
  ServerInternalException()
      : super(title: 'Server exception', message: 'Server internal error');
}

class DefaultException extends ErrorEntity {
  DefaultException(String message)
      : super(title: 'Server exception', message: message);
}

class BusinessException extends ErrorEntity {
  BusinessException(String title, String message, {String? tag, dynamic params})
      : super(title: title, message: message, tag: tag, params: params);
}
