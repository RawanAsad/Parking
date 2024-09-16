class ResultModel {}

class Successmodel extends ResultModel {}

class ErrorModel extends ResultModel {}

class ExceptionModel extends ResultModel {}
class ListModel<T extends ResultModel> extends ResultModel{
  List<T>list;
ListModel({required this.list});
}