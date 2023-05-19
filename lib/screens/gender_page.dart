import 'package:demo_provider/provider/registration_provider.dart';
import 'package:demo_provider/screens/birthday_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gender"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: provider.registrationData.gender,
                onChanged: (newValue) {
                  provider.updateGender(newValue!);
                },
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                items: <String>[
                  'Male',
                  'Female',
                  'Other',
                ].map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                child: const Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BirthdayPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
