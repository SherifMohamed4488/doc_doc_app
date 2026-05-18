import 'dart:ffi';

import 'package:booking/Core/networking/api_service.dart';
import 'package:booking/Core/networking/dio_factory.dart';
import 'package:booking/Features/Login/data/repos/login_repo.dart';
import 'package:booking/Features/SignUp/presentation/view_model/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Login/presentation/view_model/login_cubit/login_cubit.dart';
import '../../Features/SignUp/data/repos/sign_up_repo.dart';

final getIt = GetIt.instance;

Future <void> setupGetIt() async{

Dio dio =  DioFactory.getDio();
// dio & api
getIt.registerLazySingleton<ApiService>( ()=> ApiService(dio) );

// login
getIt.registerLazySingleton<LoginRepo>( ()=> LoginRepo(getIt()) );
getIt.registerFactory<LoginCubit>( ()=> LoginCubit(getIt()) );


// sign up
  getIt.registerLazySingleton<SignUpRepo>( ()=> SignUpRepo(getIt()) );
  getIt.registerFactory<SignUpCubit>( ()=> SignUpCubit(getIt()) );

}