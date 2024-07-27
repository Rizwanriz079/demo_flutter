import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  String token = '';

  void setToken(String newToken) {
    token = newToken;
    update();
  }
}