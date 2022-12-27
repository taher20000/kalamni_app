import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalamni_app/moduels/login/cubit/states.dart';
import '../../../models/social_login_model/login_model.dart';


class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);


  LoginModel? loginModel;
  void loginUser({
    required String email,
    required String password
})
  {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(LoginSuccessState(value.user!.uid));
          print(value.user!.email);
          print(value.user!.emailVerified);
    }).catchError((error){
      print('error is$error.toString()');
      emit(LoginErrorState(error));

    });
    // DioHelper.postData(
    //     url: login,
    //     data:{
    //       'email':email,
    //       'password':password,
    //     },
    //
    //
    // ).then((value) {
    //    loginModel=LoginModel.fromJson(value.data);
    //    emit(LoginSuccessState());
    // }).catchError((error){
    //   // ignore: avoid_print
    //   print(error.toString());
    //   emit(LoginErrorState());
    // });
  }

  bool isPassword = true;
IconData suffixC =Icons.confirmation_number_sharp;


void changePasswordVisibility(){
  isPassword =!isPassword;
  suffixC=isPassword? Icons.visibility_off_rounded:Icons.visibility_rounded;
  emit(SocialLoginChangePasswordVisibilityState());
}
}