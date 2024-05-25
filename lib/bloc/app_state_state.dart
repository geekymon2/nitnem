part of 'app_state_bloc.dart';

abstract class AppStateState extends Equatable {
  const AppStateState();
  
  @override
  List<Object> get props => [];
}

class AppStateInitial extends AppStateState {}
