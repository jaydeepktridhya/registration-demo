import 'package:demo_provider/provider/registration_provider.dart';
import 'package:demo_provider/screens/display_data_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirthdayPage extends StatelessWidget {
  const BirthdayPage({super.key});

  Future<void> onSubmit(
      RegistrationProvider provider, BuildContext context) async {
    await provider.submitRegistration();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Registration submitted!'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("BirthDay Page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Please press submit button to store the data."),
            const SizedBox(height: 30.0),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () async {
                // You can navigate to another page or perform any other action here
                onSubmit(provider, context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DisplayData()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
