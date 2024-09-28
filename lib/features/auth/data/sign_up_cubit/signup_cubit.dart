import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_entity.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Icon suffixIcon = const Icon(Icons.visibility);
  bool isObscured = true;
  bool isTermsAccepted=false;
  void changePasswordVisibility(){
    isObscured = !isObscured;
    suffixIcon = isObscured
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(ChangePasswordVisibility());
  }
  Future<void> createUserWithEmailAndPassword() async {
    emit(SignUpLoading());
    var result = await authRepo.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    result.fold((failure) => emit(SignUpFailure(message: failure.message)),
        (userEntity) => emit(SignUpSuccess(userEntity: userEntity)));
  }
}
