import 'package:equatable/equatable.dart';

abstract class ClienteCategoryListEvent extends Equatable {
  const ClienteCategoryListEvent();
  @override
  List<Object?> get props => [];
}

class GetCategories extends ClienteCategoryListEvent {
  const GetCategories();
}

class DeleteCategory extends ClienteCategoryListEvent {
  final int id;
  const DeleteCategory({required this.id});
  @override
  List<Object?> get props => [id];
}
