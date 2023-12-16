
import 'package:fitness/Features/auth/manger/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<Auth>{
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);



  // Auth Login
  login({required String email, required String password}) async {
    emit(LoginLoading());
    try{
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
      print(user.user!.email);
    }catch(e){
      emit(LoginError(error: e.toString()));
    }
  }

  // Auth Register
  register({required String email, required String password})async{
    emit(RegisterLoading());
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password).then((value) {
        emit(RegisterSuccess());
      });
    }  on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginError(error: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginError(error: 'wrong password'));
      }
    } catch (ex) {
      print(ex);
      emit(LoginError(error: 'there was an error'));

    }
  }





}