import 'package:demo_provider/provider/registration_class.dart';
import 'package:flutter/foundation.dart';

class RegistrationProvider extends ChangeNotifier {
  final RegistrationData _registrationData = RegistrationData();

  RegistrationData get registrationData => _registrationData;

  void updateFirstName(String value) {
    _registrationData.firstName = value;
    notifyListeners();
  }

  void updatePasswordVisible() {
    _registrationData.passwordVisible = !_registrationData.passwordVisible;
    notifyListeners();
  }

  void updateLastName(String value) {
    _registrationData.lastName = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _registrationData.email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _registrationData.password = value;
    notifyListeners();
  }

  void updateGender(String value) {
    _registrationData.gender = value;
    notifyListeners();
  }

  Future<void> submitRegistration() async {
    await _registrationData.saveToLocalStorage();
  }

  // Future<String> get
}
