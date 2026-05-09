import 'package:flutter/material.dart';
import 'package:news/screens/category/category_details.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: CategoryDetails(),
    );
  }
}
