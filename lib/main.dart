import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal/pages/pages.dart';
import 'package:meal/providers/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Pages>(create: (_) => Pages()),
        ChangeNotifierProvider<DatabaseHelper>(create: (_) => DatabaseHelper()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        )),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
