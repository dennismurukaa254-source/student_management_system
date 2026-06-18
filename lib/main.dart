import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database/database_helper.dart';
import 'models/student.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH SCREEN =================

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.school,
              size: 120,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              "Student Management App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text("Get Started"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ================= LOGIN PAGE =================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth * 0.85,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: usernameController,
                  decoration:
                  const InputDecoration(
                    labelText: "Username",
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:
                  const InputDecoration(
                    labelText: "Password",
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text(
                      "Login",
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const HomePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= HOME PAGE =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget dashboardCard(
      String title,
      String value,
      Color color) {
    return Card(
      color: color,
      child: SizedBox(
        width: 110,
        height: 100,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight:
                FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
            const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Welcome to Student Management App",
                  textAlign:
                  TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment:
                  WrapAlignment.center,
                  children: [
                    dashboardCard(
                      "Students",
                      "120",
                      Colors.blue,
                    ),
                    dashboardCard(
                      "Courses",
                      "15",
                      Colors.orange,
                    ),
                    dashboardCard(
                      "Departments",
                      "5",
                      Colors.green,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    child: const Text(
                        "Register Student"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const StudentRegistrationPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    child: const Text(
                        "View Records"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const StudentListPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    child:
                    const Text("Logout"),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= REGISTRATION PAGE =================

class StudentRegistrationPage
    extends StatefulWidget {
  const StudentRegistrationPage(
      {super.key});

  @override
  State<StudentRegistrationPage>
  createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState
    extends State<
        StudentRegistrationPage> {
  final nameController =
  TextEditingController();

  final admissionController =
  TextEditingController();

  final courseController =
  TextEditingController();

  final emailController =
  TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<void> saveStudent() async {
    if (nameController.text.isEmpty ||
        admissionController.text.isEmpty ||
        courseController.text.isEmpty ||
        emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final student = Student(
      name: nameController.text,
      admissionNumber: admissionController.text,
      course: courseController.text,
      email: emailController.text,
    );

    try {
      await _dbHelper.createStudent(student);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Student Saved Successfully"),
          backgroundColor: Colors.green,
        ),
      );
      
      // Clear all controllers after saving
      nameController.clear();
      admissionController.clear();
      courseController.clear();
      emailController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Student Registration"),
        backgroundColor:
        Colors.orange,
      ),
      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller:
              nameController,
              decoration:
              const InputDecoration(
                labelText:
                "Student Name",
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              admissionController,
              decoration:
              const InputDecoration(
                labelText:
                "Admission Number",
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              courseController,
              decoration:
              const InputDecoration(
                labelText: "Course",
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              emailController,
              decoration:
              const InputDecoration(
                labelText:
                "Email Address",
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                await saveStudent();
              },
              child: const Text(
                  "Save Student"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const StudentListPage(),
                  ),
                );
              },
              child: const Text(
                  "View All Students"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= VIEW STUDENT PAGE =================

class ViewStudentPage
    extends StatefulWidget {
  const ViewStudentPage(
      {super.key});

  @override
  State<ViewStudentPage>
  createState() =>
      _ViewStudentPageState();
}

class _ViewStudentPageState
    extends State<ViewStudentPage> {
  String studentName = "";
  String admissionNumber = "";
  String course = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadStudent();
  }

  Future<void> loadStudent() async {
    final prefs =
    await SharedPreferences
        .getInstance();

    setState(() {
      studentName =
          prefs.getString(
              "studentName") ??
              "";

      admissionNumber =
          prefs.getString(
              "admissionNumber") ??
              "";

      course =
          prefs.getString("course") ??
              "";

      email =
          prefs.getString("email") ??
              "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Saved Student Record"),
        backgroundColor:
        Colors.purple,
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              "Student Name: $studentName",
              style: const TextStyle(
                  fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              "Admission Number: $admissionNumber",
              style: const TextStyle(
                  fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              "Course: $course",
              style: const TextStyle(
                  fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              "Email: $email",
              style: const TextStyle(
                  fontSize: 20),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
              const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= STUDENT LIST PAGE =================

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Student> _students = [];
  List<Student> _filteredStudents = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    setState(() => _isLoading = true);
    final students = await _dbHelper.readAllStudents();
    setState(() {
      _students = students;
      _filteredStudents = students;
      _isLoading = false;
    });
  }

  void _filterStudents(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredStudents = _students;
      } else {
        _filteredStudents = _students.where((student) {
          return student.name.toLowerCase().contains(query.toLowerCase()) ||
              student.admissionNumber.toLowerCase().contains(query.toLowerCase()) ||
              student.course.toLowerCase().contains(query.toLowerCase()) ||
              student.email.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  Future<void> _deleteStudent(int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this student?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _dbHelper.deleteStudent(id);
      _loadStudents();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student deleted successfully')),
      );
    }
  }

  void _editStudent(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditStudentPage(student: student),
      ),
    ).then((_) => _loadStudents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Records"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadStudents,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search students...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: _filterStudents,
            ),
          ),
          // Student List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredStudents.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.inbox, size: 80, color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text(
                              _searchController.text.isEmpty
                                  ? 'No students found'
                                  : 'No matching students',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredStudents.length,
                        itemBuilder: (context, index) {
                          final student = _filteredStudents[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            elevation: 2,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.purple,
                                child: Text(
                                  student.name[0].toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                student.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Adm: ${student.admissionNumber}'),
                                  Text('Course: ${student.course}'),
                                  Text('Email: ${student.email}'),
                                ],
                              ),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => _editStudent(student),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _deleteStudent(student.id!),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentRegistrationPage(),
            ),
          ).then((_) => _loadStudents());
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ================= EDIT STUDENT PAGE =================

class EditStudentPage extends StatefulWidget {
  final Student student;

  const EditStudentPage({super.key, required this.student});

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _admissionController;
  late TextEditingController _courseController;
  late TextEditingController _emailController;
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _admissionController = TextEditingController(text: widget.student.admissionNumber);
    _courseController = TextEditingController(text: widget.student.course);
    _emailController = TextEditingController(text: widget.student.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _admissionController.dispose();
    _courseController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _updateStudent() async {
    if (_formKey.currentState!.validate()) {
      final updatedStudent = Student(
        id: widget.student.id,
        name: _nameController.text,
        admissionNumber: _admissionController.text,
        course: _courseController.text,
        email: _emailController.text,
      );

      try {
        await _dbHelper.updateStudent(updatedStudent);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Student updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _admissionController,
                decoration: const InputDecoration(
                  labelText: 'Admission Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter admission number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _courseController,
                decoration: const InputDecoration(
                  labelText: 'Course',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter course';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _updateStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Update Student',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}