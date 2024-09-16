part of 'catgories_bloc.dart';

@immutable
sealed class CatgoriesState {

}

final class CatgoriesInitial extends CatgoriesState {}

final class Sucsess_get_Catgories extends CatgoriesState {
    List<catgModel> listsucses;
    Sucsess_get_Catgories({required this.listsucses});
}

final class Error_get_Catgories extends CatgoriesState {}

final class Exception_get_Catgories extends CatgoriesState {}

final class loading_get_Catgories extends CatgoriesState {}
