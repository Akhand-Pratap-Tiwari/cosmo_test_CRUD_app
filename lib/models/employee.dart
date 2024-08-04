enum ContactMethod { EMAIL, PHONE }

class Employee {
  String? id;
  String name;
  String empId;
  String addLine1;
  String city;
  String country;
  String zipCode;
  ContactMethod contactMethod;
  String contactValue;


  Employee(
    this.id,
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
    return "$addLine1 $city $country - $zipCode";
  }

  Map<String, String> toJson() {
    return {
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
        json['_id'],
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