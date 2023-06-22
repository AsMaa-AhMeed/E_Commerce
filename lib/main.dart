import 'package:e/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:e/cubits/category_cubit/category_cubit.dart';
import 'package:e/cubits/get_single_product/cubit/single_product_cubit.dart';
import 'package:e/cubits/product_cubit/cubit/product_cubit.dart';
import 'package:e/cubits/sale_cubit/cubit/sale_cubit.dart';
import 'package:e/screens/splash_screen.dart';
import 'package:e/shared/shared_theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => SaleCubit()),
        BlocProvider(create: (context) => SingleProductCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
          title: 'E-commerce App',
          debugShowCheckedModeBanner: false,
          theme: getApplicationLightTheme(),
          // theme: ThemeData(
          //     scaffoldBackgroundColor: Colors.white,
          //     primaryColor: SharedColors.blueColor,
          //     backgroundColor: Colors.white,
          //     appBarTheme: const AppBarTheme(
          //         elevation: 0.0,
          //         backgroundColor: Colors.white,
          //         systemOverlayStyle: SystemUiOverlayStyle(
          //             statusBarColor: SharedColors.blueColor,
          //             statusBarBrightness: Brightness.dark)),
          //     fontFamily: 'Poppins'),
          home: const SplashScreen()),
    );
  }
}
