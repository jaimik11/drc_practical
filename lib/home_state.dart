part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeStateSuccess extends HomeState {}

class HomeStateError extends HomeState {
  String? error;

  HomeStateError({this.error});
}
