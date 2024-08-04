import 'package:cosmo_test_app/univ_design_params.dart';
import 'package:flutter/material.dart';

import '../../api_calling_funcs/create_employee.dart';
import '../../models/employee.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: EmployeeCreationForm()),
    );
  }
}

class EmployeeCreationForm extends StatefulWidget {
  const EmployeeCreationForm({super.key});

  @override
  EmployeeCreationFormState createState() {
    return EmployeeCreationFormState();
  }
}

class EmployeeCreationFormState extends State<EmployeeCreationForm> {
  final _formKey = GlobalKey<FormState>();
  // String? _id;
  String? name;
  String? empId;
  String? addLine1;
  String? city;
  String? country;
  String? zipCode;
  ContactMethod contactMethod = ContactMethod.PHONE;
  String dropDownValue = "PHONE";
  String? contactValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              // initialValue: ,
              decoration: InputDecoration(label: Text("Name")),
              validator: (iName) {
                if (iName == null || iName.trim().isEmpty) {
                  return 'Please enter valid name';
                }
                name = iName;
                return null;
              },
            ),
            // Spacer(),
            Divider(color: Colors.transparent),
            TextFormField(
              decoration: InputDecoration(label: Text("Emplyee Id")),
              validator: (iEmpId) {
                if (iEmpId == null || iEmpId.trim().isEmpty) {
                  return 'Please enter valid id';
                }
                empId = iEmpId;
                return null;
              },
            ),
            Divider(color: Colors.transparent),
            TextFormField(
              decoration: InputDecoration(label: Text("Address Line 1")),
              validator: (iAddLine1) {
                if (iAddLine1 == null || iAddLine1.trim().isEmpty) {
                  return 'Please enter valid address';
                }
                addLine1 = iAddLine1;
                return null;
              },
            ),
            Divider(color: Colors.transparent),
            TextFormField(
              decoration: InputDecoration(label: Text("City")),
              validator: (iCity) {
                if (iCity == null || iCity.trim().isEmpty) {
                  return 'Please enter valid city';
                }
                city = iCity;
                return null;
              },
            ),
            Divider(color: Colors.transparent),
            TextFormField(
              decoration: InputDecoration(label: Text("Country")),
              validator: (iCountry) {
                if (iCountry == null || iCountry.trim().isEmpty) {
                  return 'Please enter valid country';
                }
                country = iCountry;
                return null;
              },
            ),
            Divider(color: Colors.transparent),
            TextFormField(
              decoration: InputDecoration(label: Text("Zip Code")),
              validator: (iZipCode) {
                if (iZipCode == null || iZipCode.trim().isEmpty) {
                  return 'Please enter valid zip code';
                }
                zipCode = iZipCode;
                return null;
              },
            ),
            Divider(color: Colors.transparent),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: DropdownMenu(
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                          borderRadius: defaultBorderRadius,
                        ),
                      ),
                      initialSelection: "PHONE",
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: "EMAIL", label: "Email"),
                        DropdownMenuEntry(value: "PHONE", label: "Phone"),
                      ],
                      onSelected: (value) {
                        dropDownValue = value!;
                        contactMethod = (value == "EMAIL")
                            ? ContactMethod.EMAIL
                            : ContactMethod.PHONE;
                      },
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(label: Text("Contact Info")),
                      validator: (iContactValue) {
                        if (iContactValue == null || iContactValue.isEmpty) {
                          return 'Please enter valid PHONE/EMAIL';
                        }
                        contactValue = iContactValue;
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.transparent),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    createEmployee(
                      Employee(
                        null,
                        name: name!,
                        empId: empId!,
                        addLine1: addLine1!,
                        city: city!,
                        country: country!,
                        zipCode: zipCode!,
                        contactMethod: contactMethod,
                        contactValue: contactValue!,
                      ),
                    ).then(
                      (value) => Navigator.pop(context),
                    );
                  }
                },
                // child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
