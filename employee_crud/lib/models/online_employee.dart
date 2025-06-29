class OnlineEmployee {
  final int? id;
  final String name;
  final String email;
  final String designation;
  final int age;
  final String address;
  final String dob;
  final double salary;
  final String? image;

  OnlineEmployee({
    this.id,
    required this.name,
    required this.email,
    required this.designation,
    required this.age,
    required this.address,
    required this.dob,
    required this.salary,
    this.image,
  });

  factory OnlineEmployee.fromJson(Map<String, dynamic> json) {
    return OnlineEmployee(
      id: json['id'] as int?,
      name: json['name']as String? ?? '',
      email: json['email'] as String? ?? '',
      designation: json['designation'] as String? ?? '',
      age: json['age'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      salary: (json['salary'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'designation': designation,
      'age': age,
      'address': address,
      'dob': dob,
      'salary': salary,
      'image': image,
    };
  }
}
