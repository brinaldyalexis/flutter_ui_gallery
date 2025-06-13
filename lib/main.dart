import 'package:flutter/material.dart';
import 'package:flutter_ui_gallery/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter UI Gallery',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}