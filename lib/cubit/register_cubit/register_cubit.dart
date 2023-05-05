import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(
      {required String firstName,
      required String lastName,
      required String emai,
      required String password,
      required confirmPassword}) async {
    emit(RegisterLoading());

    try {
      //Register Func

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emai, password: password);

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage:'weak-password' ));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'The account already exists for that email'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: 'Something Went Wrong'));
    }
  }

  Future<void> gotoSignin() async {
    emit(GoToSignInState());
  }
}
