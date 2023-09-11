
import 'package:ana_project/bloc/category/category_cubit.dart';
import 'package:ana_project/router.dart';
import 'package:ana_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_name/home_name_cubit.dart';

void main() {
  final AppRouter appRouter;
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => HomeNameCubit(),),
        BlocProvider(create: (context) => CategoryCubit(),),
      ],
      child: MaterialApp( home: HomeScreen(),
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        title: "ANA",
      ),
    );
  }
}


