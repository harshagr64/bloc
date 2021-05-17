part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

// Initial state when a bloc is created
class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({@required this.connectionType});
}

class InternetDisconnected extends InternetState {}
