import 'package:dio/dio.dart';
import 'package:parkingapp/core/config/option.dart';
import 'package:parkingapp/core/domain/models/CatgModel.dart';
import 'package:parkingapp/core/domain/models/basic_model.dart';
import 'package:parkingapp/core/domain/models/categoryModel.dart';
import 'package:parkingapp/core/resourses/constent.dart';

Dio dio = Dio();
late Response response;
Future<ResultModel> get_category_ser() async {
  print("hi_hi from ser categ");
  response = await dio.get("${Baseurl}bicycle/bicycles-categories",
      options: Options(headers: option()));
  try {
    print("hi from try in get categories");
    if (response.statusCode == 200) {
      print("hi from 200 in get categories");
      // List<CategoryModel> list1 = List.generate(response.data.length,
      //     (index) => CategoryModel.fromMap(response.data[index]));

    

 List<catgModel> adata=(response.data["body"]as List).map((e) => catgModel(body: e)).toList();
  //  ListModel Alist = ListModel(list: adata);
      print("a list is $adata");
      return ListModel(list: adata);
    } else {
      print("hi from error in get categories");
      print(response.data["message"]);
      return ErrorModel();
    }
  } catch (e) {
    print(response.data["message"]);
    print("hi from Exception in get categories");
    return ExceptionModel();
  }
}
