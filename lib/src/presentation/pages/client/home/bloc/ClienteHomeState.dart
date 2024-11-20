import 'package:equatable/equatable.dart';

class ClienteHomeState extends Equatable {
  final int pageIndex;

  const ClienteHomeState({this.pageIndex = 0});

  ClienteHomeState copyWith({int? pageIndex}) {
    return ClienteHomeState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object?> get props => [pageIndex];
}
