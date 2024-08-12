import 'package:workout_fitness_app/service/infrastructure/error/exceptions/server_exceptions/server_exceptions.dart';

class TimeOutException extends ServerExceptions {
  @override
  final String errorCode;
  @override
  final String errorMessage;
  @override
  final int statusCode;

  TimeOutException({
    required this.errorCode,
    required this.statusCode,
    this.errorMessage = 'Could not load your data try again !',
  });
}
