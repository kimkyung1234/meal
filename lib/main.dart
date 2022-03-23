import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal/pages/home.dart';
import 'package:meal/providers/page.dart';
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
