// doctor_list_screen.dart
import 'package:flutter/material.dart';
import 'doctor_details_screen.dart';

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách bác sĩ'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doctors[index]['name'] ?? 'N/A'),
            subtitle: Text(doctors[index]['specialization'] ?? 'N/A'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editDoctor(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteDoctor(index);
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DoctorDetailsScreen(doctor: doctors[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addDoctor();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addDoctor() {
    TextEditingController nameController = TextEditingController();
    TextEditingController specializationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thêm bác sĩ'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Họ tên:'),
              TextField(controller: nameController),
              SizedBox(height: 8),
              Text('Chuyên ngành:'),
              TextField(controller: specializationController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  doctors.add({
                    'name': nameController.text,
                    'specialization': specializationController.text,
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

  void _editDoctor(int index) {
    TextEditingController nameController = TextEditingController();
    TextEditingController specializationController = TextEditingController();

    // Set initial values if they exist
    nameController.text = doctors[index]['name'] ?? '';
    specializationController.text = doctors[index]['specialization'] ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sửa thông tin bác sĩ'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Họ tên:'),
              TextField(controller: nameController),
              SizedBox(height: 8),
              Text('Chuyên ngành:'),
              TextField(controller: specializationController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  doctors[index]['name'] = nameController.text;
                  doctors[index]['specialization'] =
                      specializationController.text;
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

  void _deleteDoctor(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xoá bác sĩ'),
          content: Text('Bạn có chắc chắn muốn xoá bác sĩ này không?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  doctors.removeAt(index);
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

List<Map<String, String>> doctors = [
  {'name': 'Dr. B', 'specialization': 'Cardiology'},
  // Add more doctors as needed
];
