import 'dart:io';

import 'package:ecommerce_v2/src/domain/models/Product.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:ecommerce_v2/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductCreateState extends Equatable {
  final int idCategory;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final GlobalKey<FormState>? formKey;
  File? file1;
  File? file2;
  final Resource? response;

  AdminProductCreateState(
      {this.name = const BlocFormItem(error: 'Ingresa el nombre'),
      this.description = const BlocFormItem(error: 'Ingresa la descripcion'),
      this.price = const BlocFormItem(error: 'Ingresa el precio'),
      this.idCategory = 0,
      this.formKey,
      this.response,
      this.file1,
      this.file2});

  toProduct() => Product(
      name: name.value,
      description: description.value,
      price: double.parse(price.value),
      idCategory: idCategory);

  AdminProductCreateState resetForm() {
    return AdminProductCreateState(
      name: const BlocFormItem(error: 'Ingresa el nombre'),
      description: const BlocFormItem(error: 'Ingresa la descripcion'),
    );
  }

  AdminProductCreateState copyWith(
      {int? idCategory,
      BlocFormItem? name,
      BlocFormItem? description,
      BlocFormItem? price,
      GlobalKey<FormState>? formKey,
      File? file1,
      File? file2,
      Resource? response}) {
    return AdminProductCreateState(
        idCategory: idCategory ?? this.idCategory,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props =>
      [idCategory, name, description, price, file1, file2, response];
}
