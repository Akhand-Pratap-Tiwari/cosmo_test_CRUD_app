enum ContactMethod { EMAIL, PHONE }

class Employee {
  String? _id;
  String name;
  String empId;
  String addLine1;
  String city;
  String country;
  String zipCode;
  ContactMethod contactMethod;
  String contactValue;


  Employee(
    this._id,
    {
    required this.name,
    required this.empId,
    required this.addLine1,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.contactMethod,
    required this.contactValue,
  });

  String getAddress() {
    return addLine1 + city + country + zipCode;
  }

  Map<String, String> toJson() {
    return {
      // if(_id != null) '_id': 
      'name': name,
      'empId': empId,
      'addLine1': addLine1,
      'city': city,
      'country': country,
      'zipCode': zipCode,
      'contactMethod': contactMethod == ContactMethod.EMAIL ? 'EMAIL' : 'PHONE',
      'contactValue': contactValue
    };
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        json['id'],
        name: json['name'],
        empId: json['empId'],
        addLine1: json['addLine1'],
        city: json['city'],
        country: json['country'],
        zipCode: json['zipCode'],
        contactMethod: json['contactMethod'] == 'EMAIL'
            ? ContactMethod.EMAIL
            : ContactMethod.PHONE,
        contactValue: json['contactValue']);
  }
}

// Employee jsonToEmployee(Map<String, String> empDetails) {
//   return Employee(
//       name: empDetails['name']!,
//       empId: empDetails['empId']!,
//       addLine1: empDetails['addLine1']!,
//       city: empDetails['city']!,
//       country: empDetails['country']!,
//       zipCode: empDetails['zipCode']!,
//       contactMethod: empDetails['contactMethod']! == 'EMAIL'
//           ? ContactMethod.EMAIL
//           : ContactMethod.PHONE,
//       contactValue: empDetails['contactValue']!);
// }