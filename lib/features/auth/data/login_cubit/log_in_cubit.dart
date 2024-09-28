import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_entity.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final AuthRepo authRepo;
  LogInCubit(this.authRepo) : super(LogInInitial());

  final GlobalKey<FormState>formKey=GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  Icon suffixIcon=const Icon(Icons.visibility);
  bool isObscured=true;

  void changePasswordVisibility(){
    isObscured = !isObscured;
    suffixIcon = isObscured
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(ChangePasswordVisibility());
  }
  Future<void> signInWithEmailAndPassword()async{
    emit(LogInLoading());
    var result=await authRepo.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    result.fold((failure) => emit(LogInFailure(errorMessage: failure.message)),
     (user) => emit(LogInSuccess(userEntity: user)));
  }

  Future<void>signInWithGoogle()async{
    emit(LogInLoading());
    var result=await authRepo.signInWithGoogle();
    result.fold((failure) => emit(LogInFailure(errorMessage: failure.message)),
        (user) => emit(LogInSuccess(userEntity: user)));
  }

  Future<void>signInWithFacebook()async{
    emit(LogInLoading());
    var result=await authRepo.signInWithFacebook();
    result.fold((failure) => emit(LogInFailure(errorMessage: failure.message)),
        (user) => emit(LogInSuccess(userEntity: user)));
  }


}
