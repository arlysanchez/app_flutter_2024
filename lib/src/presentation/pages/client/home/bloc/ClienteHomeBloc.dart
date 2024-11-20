import 'package:ecommerce_v2/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClienteHomeEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClienteHomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteHomeBloc extends Bloc<ClienteHomeEvent, ClienteHomeState> {
  AuthUseCases authUseCases;

  ClienteHomeBloc(this.authUseCases) : super(ClienteHomeState()) {
    on<ClienteChangeDrawerPage>(_onClienteChangeDrawerPage);
    on<ClienteLogout>(_onClienteLogout);
  }

  Future<void> _onClienteLogout(
      ClienteLogout event, Emitter<ClienteHomeState> emit) async {
    await authUseCases.logout.run();
  }

  Future<void> _onClienteChangeDrawerPage(
      ClienteChangeDrawerPage event, Emitter<ClienteHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }
}
