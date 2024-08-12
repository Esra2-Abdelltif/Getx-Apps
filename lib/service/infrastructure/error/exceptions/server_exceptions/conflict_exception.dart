import 'package:workout_fitness_app/service/infrastructure/error/exceptions/server_exceptions/server_exceptions.dart';

class ConflictException extends ServerExceptions {
  @override
  final String errorCode;
  @override
  final String errorMessage;
  @override
  final int statusCode;

  ConflictException({
    required this.errorCode,
    required this.statusCode,
    required this.errorMessage,
  });
}
