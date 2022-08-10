import 'dart:async';

import 'package:account/account.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokens/tokens.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.accountRepository,
    required this.tokensRepository,
}) : super(const DashboardInitial()) {
    on<InitializeDashboardEvent>(_onDashboardInitializationEvent);
  }

  final AbstractAccountRepository accountRepository;
  final AbstractTokensRepository tokensRepository;

  Future<FutureOr<void>> _onDashboardInitializationEvent(
    InitializeDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      emit(const DashboardLoading());
      final account = await accountRepository.getAccount();
      final tokens = await tokensRepository.getTokens();
      emit(DashboardLoaded(account: account, tokens: tokens));
    } catch (e) {
      emit(DashboardError(error: e));
    }
  }
}
