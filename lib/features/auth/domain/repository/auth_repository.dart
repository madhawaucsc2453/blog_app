import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpwithEmailPassword(
      {required String name, required String email, required String password});
  Future<Either<Failure, String>> LogInwithEmailPassword(
      {required String email, required String password});
}
