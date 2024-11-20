import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:ecommerce_v2/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final Resource? response;
  final BlocFormItem password;

  final GlobalKey<FormState>? formKey;

  const LoginState(
      {this.email = const BlocFormItem(error: 'Ingresa el email'),
      this.password = const BlocFormItem(error: 'Ingresa el password'),
      this.formKey,
      this.response});

  LoginState copyWith(
      {BlocFormItem? email,
      BlocFormItem? password,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, response];
}
