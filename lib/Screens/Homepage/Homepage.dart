import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/PatientController.dart';

class Homepage extends StatelessWidget {
  final PatientController patientController = Get.put(PatientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient List'),
      ),
      body: Obx(() {
        if (patientController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (patientController.patients.isEmpty) {
          return Center(child: Text('Empty List'));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await patientController.fetchPatients();
            },
            child: ListView.builder(
              itemCount: patientController.patients.length,
              itemBuilder: (context, index) {
                final patient = patientController.patients[index];
                return ListTile(
                  title: Text(patient.name),
                  subtitle: Text('Age: ${patient.age}'),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
