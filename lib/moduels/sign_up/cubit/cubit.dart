import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalamni_app/moduels/sign_up/cubit/states.dart';


import '../../../models/social_create_user/social_create_user_model.dart';
import '../../../models/social_get_user_data/user_data_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  GetUserDataModel? getUserDataModel;
  void signUpUser(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(SignUpLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        email: email,
        name: name,
        uId: value.user!.uid,
        phone: phone,
      );
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState());
    });
  }

  void createUser({String? name, String? email, String? phone, String? uId}) {
    SocialCreateUserModel model = SocialCreateUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState());
      print(error.toString());
    });
  }
}
