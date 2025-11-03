import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efw100CommonWidgetView extends StatefulWidget {
  const Efw100CommonWidgetView({Key? key}) : super(key: key);

  @override
  State<Efw100CommonWidgetView> createState() => _Efw100CommonWidgetViewState();
}

class _Efw100CommonWidgetViewState extends State<Efw100CommonWidgetView> {
  @override
  void initState() {
    super.initState();
    // Daftarkan instance ini ke Efw100ProgressService
    Efw100ProgressService.instance.setEfw100View(this);
  }

  // Exercise methods - siswa akan mengisi ini di file efw100_exercises.dart
  Widget? exercise1() => Efw100Exercises.exercise1();
  Widget? exercise2() => Efw100Exercises.exercise2();
  Widget? exercise3() => Efw100Exercises.exercise3();
  Widget? exercise4() => Efw100Exercises.exercise4();
  Widget? exercise5() => Efw100Exercises.exercise5();
  Widget? exercise6() => Efw100Exercises.exercise6();
  Widget? exercise7() => Efw100Exercises.exercise7();
  Widget? exercise8() => Efw100Exercises.exercise8();
  Widget? exercise9() => Efw100Exercises.exercise9();
  Widget? exercise10() => Efw100Exercises.exercise10();
  Widget? exercise11() => Efw100Exercises.exercise11();
  Widget? exercise12() => Efw100Exercises.exercise12();
  Widget? exercise13() => Efw100Exercises.exercise13();
  Widget? exercise14() => Efw100Exercises.exercise14();
  Widget? exercise15() => Efw100Exercises.exercise15();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text("EFW100 - Common Widget"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.bug_report),
            onPressed: () {
              // Test preview system
              Widget? testWidget = exercise1();
              print('Test widget: $testWidget');
              if (testWidget != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Preview: Exercise 1'),
                    content: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Efw100Validator.validateExercise(1, testWidget)
                              ? Colors.green
                              : Colors.red,
                          width: 2,
                        ),
                      ),
                      child: Center(child: testWidget),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              }
            },
            tooltip: 'Test Preview System',
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Show debug info
              Widget? testWidget = exercise1();
              bool isValid = Efw100Validator.validateExercise(1, testWidget);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Debug Info'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Widget: ${testWidget?.runtimeType}'),
                      Text('Is Valid: $isValid'),
                      Text('Widget: $testWidget'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), //card kuning
          child: Column(
            children: [
              // Debug Info Card
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.yellow[300],
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('Debug Info',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Builder(
                          builder: (context) {
                            Widget? testWidget = exercise1();
                            bool isValid =
                                Efw100Validator.validateExercise(1, testWidget);
                            return Column(
                              children: [
                                Text(
                                    'Exercise 1 Widget: ${testWidget?.runtimeType}'),
                                Text('Is Valid: $isValid'),
                                Text('Has Widget: ${testWidget != null}'),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Exercise Progress Card
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Exercise Progress',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        '✅ Exercise 1: Container merah - SELESAI',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '✅ Exercise 2: Text "Hello Flutter" - SELESAI',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '⏳ Exercise 3-15: Belum selesai',
                        style: TextStyle(color: Colors.orange[700]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Test Preview Button
              ElevatedButton(
                onPressed: () {
                  Widget? testWidget = exercise1();
                  if (testWidget != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Row(
                          children: [
                            Text('Preview: Test Exercise 1'),
                            const SizedBox(width: 8),
                            Icon(
                              Efw100Validator.validateExercise(1, testWidget)
                                  ? Icons.check_circle
                                  : Icons.error,
                              color: Efw100Validator.validateExercise(
                                      1, testWidget)
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        ),
                        content: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Efw100Validator.validateExercise(
                                      1, testWidget)
                                  ? Colors.green
                                  : Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: testWidget),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Test Preview System'),
              ),

              SizedBox(height: 16),
              _buildExerciseCard(rowLabelEfw100(exercise1, 1)),
              _buildExerciseCard(rowLabelEfw100(exercise2, 2)),
              _buildExerciseCard(rowLabelEfw100(exercise3, 3)),
              _buildExerciseCard(rowLabelEfw100(exercise4, 4)),
              _buildExerciseCard(rowLabelEfw100(exercise5, 5)),
              _buildExerciseCard(rowLabelEfw100(exercise6, 6)),
              _buildExerciseCard(rowLabelEfw100(exercise7, 7)),
              _buildExerciseCard(rowLabelEfw100(exercise8, 8)),
              _buildExerciseCard(rowLabelEfw100(exercise9, 9)),
              _buildExerciseCard(rowLabelEfw100(exercise10, 10)),
              _buildExerciseCard(rowLabelEfw100(exercise11, 11)),
              _buildExerciseCard(rowLabelEfw100(exercise12, 12)),
              _buildExerciseCard(rowLabelEfw100(exercise13, 13)),
              _buildExerciseCard(rowLabelEfw100(exercise14, 14)),
              _buildExerciseCard(rowLabelEfw100(exercise15, 15)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: child,
      ),
    );
  }
}
