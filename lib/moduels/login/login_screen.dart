import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:kalamni_app/moduels/login/cubit/states.dart';
import '../../home/home_screen.dart';
import '../../shared/components/component.dart';
import '../../shared/components/validate.dart';
import '../../shared/network/local/cache_helper.dart';
import '../sign_up/sign_up_screen.dart';
import 'cubit/cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.error);
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(context, const HomeScreen());
            }).catchError((error) {
              print(error.toString());
            });
          }
        },
        builder: (context, state) {
          var login = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset('assets/image/upLogin.png'),
                        Column(
                          children: [
                            const SizedBox(
                              height: 90,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Enter your credentials to continue',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor('7C7C7C')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            onTap: () {},
                            validator: Validator.email,
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('E2E2E2'))),
                                prefixIcon: const Icon(Icons.email)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: login.isPassword,
                            keyboardType: TextInputType.visiblePassword,
                            onTap: () {},
                            validator: Validator.password,
                            controller: passwordController,
                            // controller: TextEditingController(),
                            decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('E2E2E2'))),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    login.changePasswordVisibility();
                                  },
                                  icon: Icon(login.suffixC),
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Image.asset('assets/image/upLogin.png'),
                        Column(
                          children: [
                            defualtButton(
                                context: context,
                                name: 'Login',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    login.loginUser(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    print(emailController);
                                    print(passwordController);
                                  }
                                },
                                color: Colors.white),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don’t have an account? '),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupScreen()));
                                    },
                                    child: Text(
                                      'Signup',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: HexColor('53B175')),
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
