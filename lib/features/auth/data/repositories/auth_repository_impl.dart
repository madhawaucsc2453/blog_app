import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';

import 'package:fpdart/src/either.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, String>> LogInwithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement LogInwithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpwithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
  final userId= await   authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
