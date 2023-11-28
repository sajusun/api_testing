import 'package:api_testing/modal/bossend_categories.dart';
import 'package:api_testing/ui/bosssend_categories.dart';
import 'package:api_testing/ui/home.dart';
import 'package:api_testing/widget/bd_wash_product_list.dart';
import 'package:api_testing/widget/product_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Testing',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  bsCategoriesUi(),
    );
  }
}


