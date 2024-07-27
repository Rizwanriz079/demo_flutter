import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientRegistrationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController executiveController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountAmountController = TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  final List<String> selectedMaleTreatments = [];
  final List<String> selectedFemaleTreatments = [];
  final List<String> selectedTreatments = [];

  final List<String> locations = ['Location A', 'Location B', 'Location C'];
  String selectedLocation = 'Location A';

  Future<void> registerPatient() async {
    final Map<String, dynamic> formData = {
      'name': nameController.text,
      'excecutive': executiveController.text,
      'payment': paymentController.text,
      'phone': phoneController.text,
      'address': addressController.text,
      'total_amount': totalAmountController.text,
      'discount_amount': discountAmountController.text,
      'advance_amount': advanceAmountController.text,
      'balance_amount': balanceAmountController.text,
      'date_nd_time': dateTimeController.text,
      'id': '',
      'male': selectedMaleTreatments.join(','),
      'female': selectedFemaleTreatments.join(','),
      'branch': selectedLocation,
      'treatments': selectedTreatments.join(','),
    };

    final response = await http.post(
      Uri.parse(''),
      body: formData,
    );

    if (response.statusCode == 200) {
      // Patient registered successfully, now generate PDF
      // Call function to generate PDF passing formData
      generatePdf(formData);
    } else {
      // Handle error
      print('Failed to register patient: ${response.statusCode}');
    }
  }

  void generatePdf(Map<String, dynamic> formData) {
    // Implement PDF generation using formData
    // You can use libraries like pdf or pdf_flutter for generating PDFs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Registration')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: executiveController, decoration: InputDecoration(labelText: 'Executive')),
            TextField(controller: paymentController, decoration: InputDecoration(labelText: 'Payment')),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Phone')),
            TextField(controller: addressController, decoration: InputDecoration(labelText: 'Address')),
            TextField(controller: totalAmountController, decoration: InputDecoration(labelText: 'Total Amount')),
            TextField(controller: discountAmountController, decoration: InputDecoration(labelText: 'Discount Amount')),
            TextField(controller: advanceAmountController, decoration: InputDecoration(labelText: 'Advance Amount')),
            TextField(controller: balanceAmountController, decoration: InputDecoration(labelText: 'Balance Amount')),
            TextField(controller: dateTimeController, decoration: InputDecoration(labelText: 'Date & Time')),
            DropdownButtonFormField(
              value: selectedLocation,
              items: locations.map((location) => DropdownMenuItem(value: location, child: Text(location))).toList(),
              onChanged: (value) => selectedLocation = value.toString(),
              decoration: InputDecoration(labelText: 'Location'),
            ),
            // You can add dropdowns or checkboxes for selecting treatments here
            ElevatedButton(
              onPressed: registerPatient,
              child: Text('Register Patient'),
            ),
          ],
        ),
      ),
    );
  }
}
