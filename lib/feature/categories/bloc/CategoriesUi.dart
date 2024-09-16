import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/core/resourses/colors.dart';
import 'package:parkingapp/feature/categories/bloc/catgories_bloc.dart';

class CategorisUi extends StatelessWidget {
  const CategorisUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatgoriesBloc()..add(getCategory()),
      child: BlocBuilder<CatgoriesBloc, CatgoriesState>(
        builder: (context, state) {
          if (state is Sucsess_get_Catgories) {
            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  
                    itemCount: state.listsucses.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing:22,
                      mainAxisSpacing: 22,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container_Category(
                          text: state.listsucses[index].body.toString(),
                        ),
                      );
                    }),
              ),
            );
          } else {
            print(" be calm it is  an error");
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}

class Container_Category extends StatelessWidget {
  Container_Category({super.key, required, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: lightgreen,borderRadius: BorderRadius.circular(15)),
      width: 160,
      height: 160,
      child: Center(child: Text(text,style: TextStyle(fontSize: 17),)),
    );
  }
}
