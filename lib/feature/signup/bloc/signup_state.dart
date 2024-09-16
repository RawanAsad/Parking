part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SuccessSignup_state extends SignupState {}

final class Erorr extends SignupState {}

final class Exception extends SignupState {}
