// patient_list_screen.dart
import 'package:flutter/material.dart';
import 'patient_details_screen.dart';

class PatientListScreen extends StatefulWidget {
  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách bệnh nhân'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patients[index]['name'] ?? 'N/A'),
            subtitle: Text(patients[index]['dob'] ?? 'N/A'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editPatient(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deletePatient(index);
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PatientDetailsScreen(patient: patients[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPatient();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addPatient() {
    TextEditingController nameController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController idCardController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController admissionDateController = TextEditingController();
    TextEditingController dischargeDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thêm bệnh nhân'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Họ tên:'),
              TextField(controller: nameController),
              SizedBox(height: 8),
              Text('Ngày sinh:'),
              TextField(controller: dobController),
              SizedBox(height: 8),
              Text('Số CCCD/CMND:'),
              TextField(controller: idCardController),
              SizedBox(height: 8),
              Text('Số điện thoại:'),
              TextField(controller: phoneController),
              SizedBox(height: 8),
              Text('Ngày vào viện:'),
              TextField(controller: admissionDateController),
              SizedBox(height: 8),
              Text('Ngày ra viện:'),
              TextField(controller: dischargeDateController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  patients.add({
                    'name': nameController.text,
                    'dob': dobController.text,
                    'idCard': idCardController.text,
                    'phone': phoneController.text,
                    'admissionDate': admissionDateController.text,
                    'dischargeDate': dischargeDateController.text,
                  });
                });
                Navigator.pop(context);
              },
              child: Text('Thêm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Hủy'),
            ),
          ],
        );
      },
    );
  }

  void _editPatient(int index) {
    TextEditingController nameController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController idCardController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController admissionDateController = TextEditingController();
    TextEditingController dischargeDateController = TextEditingController();

    // Set initial values if they exist
    nameController.text = patients[index]['name'] ?? '';
    dobController.text = patients[index]['dob'] ?? '';
    idCardController.text = patients[index]['idCard'] ?? '';
    phoneController.text = patients[index]['phone'] ?? '';
    admissionDateController.text = patients[index]['admissionDate'] ?? '';
    dischargeDateController.text = patients[index]['dischargeDate'] ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sửa thông tin bệnh nhân'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Họ tên:'),
              TextField(controller: nameController),
              SizedBox(height: 8),
              Text('Ngày sinh:'),
              TextField(controller: dobController),
              SizedBox(height: 8),
              Text('Số CCCD/CMND:'),
              TextField(controller: idCardController),
              SizedBox(height: 8),
              Text('Số điện thoại:'),
              TextField(controller: phoneController),
              SizedBox(height: 8),
              Text('Ngày vào viện:'),
              TextField(controller: admissionDateController),
              SizedBox(height: 8),
              Text('Ngày ra viện:'),
              TextField(controller: dischargeDateController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  patients[index]['name'] = nameController.text;
                  patients[index]['dob'] = dobController.text;
                  patients[index]['idCard'] = idCardController.text;
                  patients[index]['phone'] = phoneController.text;
                  patients[index]['admissionDate'] =
                      admissionDateController.text;
                  patients[index]['dischargeDate'] =
                      dischargeDateController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Lưu'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Hủy'),
            ),
          ],
        );
      },
    );
  }

  void _deletePatient(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xoá bệnh nhân'),
          content: Text('Bạn có chắc chắn muốn xoá bệnh nhân này không?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  patients.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Đồng ý'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Hủy'),
            ),
          ],
        );
      },
    );
  }
}

List<Map<String, String>> patients = [
  {
    'name': 'Nguyen Van A',
    'dob': '01/01/1990',
    'idCard': '123456789',
    'phone': '0987654321',
    'admissionDate': '01/01/2022',
    'dischargeDate': '10/01/2022'
  },
  // Add more patients as needed
];
