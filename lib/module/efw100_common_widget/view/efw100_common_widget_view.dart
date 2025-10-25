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

  // Exercise methods - siswa akan mengisi ini
  Widget? exercise1() {
    // Buat sebuah Container dengan lebar 100, tinggi 100, dan warna merah
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }

  Widget? exercise2() {
    // Buat sebuah Text dengan isi "Hello Flutter" dan ukuran font 24
    return Text(
      "Hello Flutter",
      style: TextStyle(fontSize: 24),
    );
  }

  Widget? exercise3() {
    // Buat sebuah Icon dengan Icons.home dan warna biru
    return Icon(
      Icons.home,
      color: Colors.blue,
    );
  }

  Widget? exercise4() {
    // Buat sebuah Image.asset dengan path "assets/images/image1.jpg"
    return Image.asset(
      "assets/images/image1.jpg",
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  Widget? exercise5() {
    // Buat sebuah CircleAvatar dengan radius 30 dan warna hijau
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.green,
    );
  }

  Widget? exercise6() {
    // Buat sebuah Card dengan padding 16 dan child Text "Card Content"
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Card Content"),
      ),
    );
  }

  Widget? exercise7() {
    // Buat sebuah ListTile dengan title "List Tile" dan subtitle "Subtitle"
    return ListTile(
      title: Text("List Tile"),
      subtitle: Text("Subtitle"),
    );
  }

  Widget? exercise8() {
    // Buat sebuah ElevatedButton dengan text "Click Me"
    return ElevatedButton(
      onPressed: () {},
      child: Text("Click Me"),
    );
  }

  Widget? exercise9() {
    // Buat sebuah FloatingActionButton dengan icon Icons.add
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

  Widget? exercise10() {
    // Buat sebuah AppBar dengan title "My App"
    return AppBar(
      title: Text("My App"),
    );
  }

  Widget? exercise11() {
    // Buat sebuah Scaffold dengan AppBar dan body Text "Hello World"
    return Scaffold(
      appBar: AppBar(title: Text("App")),
      body: Text("Hello World"),
    );
  }

  Widget? exercise12() {
    // Buat sebuah SizedBox dengan lebar 200 dan tinggi 100
    return SizedBox(
      width: 200,
      height: 100,
      child: Container(color: Colors.grey[300]),
    );
  }

  Widget? exercise13() {
    // Buat sebuah Padding dengan padding EdgeInsets.all(16) dan child Text "Padded Text"
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text("Padded Text"),
    );
  }

  Widget? exercise14() {
    // Buat sebuah Center dengan child Text "Centered Text"
    return Center(
      child: Text("Centered Text"),
    );
  }

  Widget? exercise15() {
    // Buat sebuah Align dengan alignment Alignment.centerRight dan child Text "Right Aligned"
    return Align(
      alignment: Alignment.centerRight,
      child: Text("Right Aligned"),
    );
  }

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
