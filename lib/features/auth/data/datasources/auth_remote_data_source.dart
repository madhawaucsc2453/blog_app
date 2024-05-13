import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> LogInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> LogInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try{
         final res= supabaseClient.auth.signInWithPassword(password: password, email: email);
        return "success";
    }catch (e){
      throw ServerException(e.toString());

    }
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {"name": name},
      );
      if (res.user == null) {
        throw ServerException("User is null");
      } else {
        return res.user!.id;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
