import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  Future<void> loginUer({required String email , required String password})async{

    emit(LoginLoading());

    try{
      //Login Func
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
      emit(LoginSuccess());

    }on FirebaseAuthException catch (ex) {

  if(ex.code =='user-not-found'){
      emit(LoginFailure(errMessage:'user-not-found' ));
  }else if(ex.code=='Wrog-password'){
     emit(LoginFailure(errMessage: 'Wrog-password'));
     }
}
    catch (e){
        emit(LoginFailure(errMessage: 'something went wrong'));
    }

  }
}
