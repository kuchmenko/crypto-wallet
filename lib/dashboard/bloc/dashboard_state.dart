part of 'dashboard_bloc.dart';

/// {@template dashboard_state}
/// DashboardState description
/// {@endtemplate}
class DashboardState extends Equatable {
  /// {@macro dashboard_state}
  const DashboardState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current DashboardState with property changes
  DashboardState copyWith({
    String? customProperty,
  }) {
    return DashboardState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template dashboard_initial}
/// The initial state of DashboardState
/// {@endtemplate}
class DashboardInitial extends DashboardState {
  /// {@macro dashboard_initial}
  const DashboardInitial() : super();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading() : super();
}


class DashboardLoaded extends DashboardState {
  const DashboardLoaded({
    required this.account,
    required this.tokens,
  });
  final Account account;
  final List<Token> tokens;
  @override
  List<Object> get props => [account, tokens];
}

class DashboardError extends DashboardState {
  const DashboardError({
    required this.error,
  });
  final Object error;
  @override
  List<Object> get props => [error];
}
