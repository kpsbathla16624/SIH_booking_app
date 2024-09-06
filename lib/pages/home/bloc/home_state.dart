part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChatSucessState extends HomeState {
  final List<chatMessageModel> messages;

  ChatSucessState({required this.messages});
}
