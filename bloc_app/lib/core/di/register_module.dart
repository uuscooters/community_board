import 'package:data_supabase/auth.dart';
import 'package:data_supabase/post.dart';
import 'package:domain/auth.dart';
import 'package:domain/post.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/presentation/blocs/authentication/authentication_bloc.dart';
import '../config/router/app_router.dart';

@module
abstract class RegisterModule {
  @singleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @Singleton()
  GoRouter router(AuthenticationBloc authBloc) => createRouter(authBloc);

  // ----- Data Layer Registration (LazySingleton) -----
  // Auth
  @LazySingleton(as: AuthRemoteDataSource)
  SupabaseAuthRemoteDataSource get authRemoteDataSource;

  @LazySingleton(as: AuthRepository)
  AuthRepositoryImpl get authRepositoryImpl;

  // post
  @LazySingleton(as: PostRemoteDataSource)
  SupabasePostRemoteDataSource get postRemoteDataSource;

  @LazySingleton(as: PostRepository)
  PostRepositoryImpl get postRepository;

  // ----- Domain Layer (UseCase) Registration (Injectable - factory) -----
  // Auth
  @injectable
  SignupUseCase get signupUseCase;

  @injectable
  LoginUseCase get loginUseCase;

  @injectable
  LogoutUseCase get logoutUseCase;

  // Post
  @injectable
  GetPostUseCase get getPostUseCase;

  @injectable
  CreatePostUseCase get createPostUseCase;

  @injectable
  UploadPostImageUseCase get uploadPostImageUseCase;
}
