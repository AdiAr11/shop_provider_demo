import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/providers/products_provider.dart';
import 'package:shop_provider_demo/screens/products_overview_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Products()),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.orange),
          textTheme: GoogleFonts.latoTextTheme(Theme
              .of(context)
              .textTheme)
      ),
      home: const ProductsOverviewScreen(),
    );
  }
}
