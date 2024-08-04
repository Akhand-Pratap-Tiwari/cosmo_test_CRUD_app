import 'package:cosmo_test_app/univ_design_params.dart';
import 'package:flutter/material.dart';

import '../../api_calling_funcs/create_employee.dart';
import '../../models/employee.dart';
import 'submit_button.dart';

class CreateEmployeeScreen extends StatelessWidget {
  const CreateEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDefaultAppBar(title: "Add Employee"),
      body: const SingleChildScrollView(child: EmployeeCreationForm()),
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
              decoration: const InputDecoration(label: Text("Name")),
              validator: (inputName) {
                if (inputName == null || inputName.trim().isEmpty) {
                  return 'Please enter valid name';
                }
                name = inputName;
                return null;
              },
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              decoration: const InputDecoration(label: Text("Emplyee Id")),
              validator: (inputEmpId) {
                if (inputEmpId == null || inputEmpId.trim().isEmpty) {
                  return 'Please enter valid id';
                }
                empId = inputEmpId;
                return null;
              },
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              decoration: const InputDecoration(label: Text("Address Line 1")),
              validator: (inputAddLine1) {
                if (inputAddLine1 == null || inputAddLine1.trim().isEmpty) {
                  return 'Please enter valid address';
                }
                addLine1 = inputAddLine1;
                return null;
              },
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              decoration: const InputDecoration(label: Text("City")),
              validator: (inputCity) {
                if (inputCity == null || inputCity.trim().isEmpty) {
                  return 'Please enter valid city';
                }
                city = inputCity;
                return null;
              },
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              decoration: const InputDecoration(label: Text("Country")),
              validator: (inputCountry) {
                if (inputCountry == null || inputCountry.trim().isEmpty) {
                  return 'Please enter valid country';
                }
                country = inputCountry;
                return null;
              },
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              decoration: const InputDecoration(label: Text("Zip Code")),
              validator: (inputZipCode) {
                if (inputZipCode == null || inputZipCode.trim().isEmpty) {
                  return 'Please enter valid zip code';
                }
                zipCode = inputZipCode;
                return null;
              },
            ),
            const Divider(color: Colors.transparent),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: DropdownMenu(
                      initialSelection: "PHONE",
                      dropdownMenuEntries: const [
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
                      decoration:
                          const InputDecoration(label: Text("Contact Info")),
                      validator: (inputContactValue) {
                        if (inputContactValue == null || inputContactValue.isEmpty) {
                          return 'Please enter valid PHONE/EMAIL';
                        }
                        contactValue = inputContactValue;
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent),
            Center(
              child: SubmitButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {  //If current inputs are valid
                    ScaffoldMessenger.of(context).showSnackBar( //then show data being processed
                      const SnackBar(content: Text('Processing Data')),
                    );
                    showDialog( //Show loading screen (Later removed See at *)
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    createEmployee( //Call API function and pass the fiels
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
                    ).then(            // * Remove the loading screen After creation
                      (value) => Navigator.pop(context),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
