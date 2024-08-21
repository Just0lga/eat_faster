import 'package:eat_faster/models/restaurant.dart';
import 'package:eat_faster/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => Restaurant())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black), // Default text color
          ),
          inputDecorationTheme: InputDecorationTheme(
            // Background color of the text fields
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey), // Border color when focused
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey), // Border color when not focused
            ),
            labelStyle:
                TextStyle(color: Colors.black), // Color of the label text
          ),
          colorScheme: ColorScheme.dark(
              background: Colors.grey.shade300,
              primary: Colors.grey.shade500,
              secondary: Colors.grey.shade100,
              tertiary: Colors.white,
              inversePrimary: Color.fromARGB(255, 0, 0, 0))),
      home: Homepage(),
    );
  }
}
