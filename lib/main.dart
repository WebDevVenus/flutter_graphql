import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'list_of_characters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GraphQL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 145, 211, 128),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'RobotoMono',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          displayMedium: TextStyle(
            fontFamily: 'RobotoMono',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          displaySmall: TextStyle(
            fontFamily: 'RobotoMono',
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            fontFamily: 'RobotoMono',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      home: const ListOfCharacters(),
    );
  }
}
