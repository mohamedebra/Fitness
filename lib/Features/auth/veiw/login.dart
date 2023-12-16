import 'dart:ffi';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Features/auth/manger/auth_cubit.dart';
import 'package:fitness/Features/auth/manger/auth_state.dart';
import 'package:fitness/Features/auth/veiw/register.dart';
import 'package:fitness/Features/home/presentation/home_screen.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/core/widgets/custom_button.dart';
import 'package:fitness/core/widgets/custom_text_field.dart';
import 'package:fitness/core/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



class LoginPage extends  StatelessWidget {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,Auth>(
      listener: (BuildContext context, state) {
        if(state is LoginLoading){
          isLoading = true;
        }
        else if(state is LoginSuccess){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/Fitness-Gym-logo-design-template-on-transparent-background-PNG.png',
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fitness',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButon(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          BlocProvider.of<AuthCubit>(context).login(email: email!, password: password!);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showSnackBar(context, 'user not found');
                          } else if (ex.code == 'wrong-password') {
                            showSnackBar(context, 'wrong password');
                          }
                        } catch (ex) {
                          print(ex);
                          showSnackBar(context, 'there was an error');
                        }

                        isLoading = false;
                      } else {}
                    },
                    text: 'LOGIN',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15,),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, RegisterPage.id);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                        },
                        child: Text(
                          '  Register',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
