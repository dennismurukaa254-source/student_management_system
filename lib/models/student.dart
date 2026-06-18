class Student {
  final int? id;
  final String name;
  final String admissionNumber;
  final String course;
  final String email;

  Student({
    this.id,
    required this.name,
    required this.admissionNumber,
    required this.course,
    required this.email,
  });

  // Convert Student object to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'admissionNumber': admissionNumber,
      'course': course,
      'email': email,
    };
  }

  // Create Student object from Map (database row)
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      admissionNumber: map['admissionNumber'],
      course: map['course'],
      email: map['email'],
    );
  }

  // Create a copy of Student with updated fields
  Student copyWith({
    int? id,
    String? name,
    String? admissionNumber,
    String? course,
    String? email,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      course: course ?? this.course,
      email: email ?? this.email,
    );
  }
}
