import 'package:demo_provider/provider/registration_provider.dart';
import 'package:demo_provider/screens/first_name_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Demo',
        theme: ThemeData(
            useMaterial3: true,
            // primarySwatch: Colors.blue,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 56, 29, 42))),
        home: const FirstNamePage(),
      ),
    );
  }
}
