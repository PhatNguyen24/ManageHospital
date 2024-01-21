// doctor_details_screen.dart
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, String> doctor;

  const DoctorDetailsScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết bác sĩ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Họ tên: ${doctor['name']}'),
          Text('Chuyên ngành: ${doctor['specialization']}'),
        ],
      ),
    );
  }
}
