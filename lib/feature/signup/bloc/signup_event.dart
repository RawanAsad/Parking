// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class Signedup extends SignupEvent {
  final Signupmodel user;
  Signedup({
    required this.user,
  });
}
