import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/home_cubit/home_cubit.dart';
import 'screens/home_page.dart';
import 'screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        routes: {
          HomePage.id: (context) => HomePage(),
          UpdateProductPage.id: (context) => UpdateProductPage(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }
}
