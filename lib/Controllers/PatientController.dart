import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models.dart';

class PatientController extends GetxController {
  RxList<Patient> patients = <Patient>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchPatients() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(''));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        patients.assignAll(data.map((patientJson) => Patient.fromJson(patientJson)).toList());
      } else {
        // Handle error
        print('Failed to fetch patients: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
      print('Error fetching patients: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
