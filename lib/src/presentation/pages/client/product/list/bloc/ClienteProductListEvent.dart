import 'package:equatable/equatable.dart';

abstract class ClienteProductListEvent extends Equatable {
  const ClienteProductListEvent();
  @override
  List<Object?> get props => [];
}

class GetProductsByCategory extends ClienteProductListEvent {
  final int idCategory;

  const GetProductsByCategory({required this.idCategory});

  @override
  List<Object?> get props => [idCategory];
}

class DeleteProduct extends ClienteProductListEvent {
  final int id;

  const DeleteProduct({required this.id});

  @override
  List<Object?> get props => [id];
}
