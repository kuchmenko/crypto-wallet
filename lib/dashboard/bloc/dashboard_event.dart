part of 'dashboard_bloc.dart';

abstract class DashboardEvent  extends Equatable {
  const DashboardEvent();
}

/// {@template initialize_dashboard_event}
/// Event added to initialize the dashboard and extract user from repository
/// {@endtemplate}
class InitializeDashboardEvent extends DashboardEvent {
  /// {@macro initialize_dashboard_event}
  const InitializeDashboardEvent();

  @override
  List<Object> get props => [];
}
