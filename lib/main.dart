import 'package:flutter/material.dart';
import 'patient_list_screen.dart';
import 'doctor_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management',
      home: HospitalManagement(),
    );
  }
}

class HospitalManagement extends StatefulWidget {
  @override
  _HospitalManagementState createState() => _HospitalManagementState();
}

class _HospitalManagementState extends State<HospitalManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý bệnh viện'),
      ),
      body: Column(
        children: [
          Text(
            'Màn hình chính - Quản lý bệnh viện',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientListScreen(),
                ),
              );
            },
            child: Text('Bệnh nhân'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorListScreen(),
                ),
              );
            },
            child: Text('Bác sĩ'),
          ),
        ],
      ),
    );
  }
}
