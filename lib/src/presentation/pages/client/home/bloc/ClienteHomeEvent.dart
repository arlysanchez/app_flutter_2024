import 'package:equatable/equatable.dart';

abstract class ClienteHomeEvent extends Equatable {
  const ClienteHomeEvent();

  @override
  List<Object?> get props => [];
}

class ClienteChangeDrawerPage extends ClienteHomeEvent {
  final int pageIndex;
  const ClienteChangeDrawerPage({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class ClienteLogout extends ClienteHomeEvent {
  const ClienteLogout();
}
