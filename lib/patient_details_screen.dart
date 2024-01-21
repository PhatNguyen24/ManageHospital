// patient_details_screen.dart
import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatelessWidget {
  final Map<String, String> patient;

  const PatientDetailsScreen({required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết bệnh nhân'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Họ tên: ${patient['name']}'),
          Text('Ngày sinh: ${patient['dob']}'),
          Text('Số CCCD/CMND: ${patient['idCard']}'),
          Text('Số điện thoại: ${patient['phone']}'),
          Text('Ngày vào viện: ${patient['admissionDate']}'),
          Text('Ngày ra viện: ${patient['dischargeDate']}'),
        ],
      ),
    );
  }
}
