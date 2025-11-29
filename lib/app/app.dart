import 'package:flutter/material.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Puntuación de películas",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.movieList,
      routes: Routes.getRoutes(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
