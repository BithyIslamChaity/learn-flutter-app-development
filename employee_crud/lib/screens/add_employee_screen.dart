import 'package:flutter/cupertino.dart';
import 'package:employee_crud/models/employee.dart';
import 'package:employee_crud/services/database_service.dart';
import 'package:flutter/material.dart';

class Addemployeescreen extends StatefulWidget {
  const Addemployeescreen({super.key});

  @override
  State<Addemployeescreen> createState() => _AddemployeescreenState();
}

class _AddemployeescreenState extends State<Addemployeescreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _designationController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();

  @override
  void dispose(){
    _nameController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  void _saveEmployee() async {
    if (_formKey.currentState!.validate()) {
      final employee = Employee(
          name: _nameController.text,
          designation: _designationController.text,
      );

      await _databaseService.insertEmployee(employee);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Employee added successfully')),
      );
      _nameController.clear();
      _designationController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value){
              if (value ==null || value.isEmpty){
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _designationController,
            decoration: const InputDecoration(labelText: 'Designation'),
            validator: (value){
              if (value ==null || value.isEmpty){
                return 'Please enter a designation';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: _saveEmployee,
              child: const Text('Add Employee'),
          ),
        ],
      ),),
    );

  }
}
