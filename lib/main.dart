import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grade Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade50,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const GradeCalculatorScreen(),
    );
  }
}

class GradeCalculatorScreen extends StatefulWidget {
  const GradeCalculatorScreen({super.key});

  @override
  State<GradeCalculatorScreen> createState() => _GradeCalculatorScreenState();
}

class _GradeCalculatorScreenState extends State<GradeCalculatorScreen> {
  final _studentNameController = TextEditingController();
  final List<TextEditingController> _gradeControllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  final List<String> _subjects = [
    'Mathematics',
    'English',
    'Science',
    'Filipino',
    'Computer',
  ];

  String? _errorMessage;
  String? _studentName;
  double? _average;
  bool? _passed;

  void _calculateAverage() {
    final studentName = _studentNameController.text.trim();
    if (studentName.isEmpty) {
      _setError('Student name cannot be empty.');
      return;
    }

    final grades = <double>[];
    for (final controller in _gradeControllers) {
      final rawValue = controller.text.trim();
      if (rawValue.isEmpty) {
        _setError('All five grades are required.');
        return;
      }

      final grade = double.tryParse(rawValue);
      if (grade == null || grade < 0 || grade > 100) {
        _setError('Grades must be numeric and between 0 and 100.');
        return;
      }
      grades.add(grade);
    }

    final average = grades.reduce((a, b) => a + b) / grades.length;

    setState(() {
      _errorMessage = null;
      _studentName = studentName;
      _average = average;
      _passed = average >= 75;
    });
  }

  void _resetForm() {
    _studentNameController.clear();
    for (final controller in _gradeControllers) {
      controller.clear();
    }

    setState(() {
      _errorMessage = null;
      _studentName = null;
      _average = null;
      _passed = null;
    });
  }

  void _setError(String message) {
    setState(() {
      _errorMessage = message;
      _studentName = null;
      _average = null;
      _passed = null;
    });
  }

  @override
  void dispose() {
    _studentNameController.dispose();
    for (final controller in _gradeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultColor = (_passed ?? false) ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Grade Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            const Icon(Icons.school_rounded, size: 72, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'Student Grade Calculator',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _studentNameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                hintText: 'Enter student name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(_subjects.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: _gradeControllers[index],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: _subjects[index],
                    hintText: 'Enter grade',
                    prefixIcon: const Icon(Icons.assignment_rounded),
                    border: const OutlineInputBorder(),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _calculateAverage,
              icon: const Icon(Icons.calculate),
              label: const Text('Calculate Average'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _resetForm,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.blue,
              ),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
            if (_studentName != null &&
                _average != null &&
                _passed != null) ...[
              const SizedBox(height: 20),
              Card(
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Result',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Student Name: $_studentName'),
                      const SizedBox(height: 8),
                      Text('General Average: ${_average!.toStringAsFixed(2)}'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('Status: '),
                          Text(
                            _passed! ? 'PASSED' : 'FAILED',
                            style: TextStyle(
                              color: resultColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
