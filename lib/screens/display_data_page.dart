import 'package:demo_provider/provider/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Data Display.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30),
            ),
            const SizedBox(height: 16.0),
            Text("Firstname:  ${provider.registrationData.firstName}"),
            Text("Lastname:  ${provider.registrationData.lastName}"),
            Text("Email:  ${provider.registrationData.email}"),
            Text("password:  ${provider.registrationData.password}"),
            Text("Gender:  ${provider.registrationData.gender}"),
          ],
        ),
      ),
    );
  }
}
