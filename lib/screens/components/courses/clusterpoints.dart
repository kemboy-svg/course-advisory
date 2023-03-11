 import 'package:flutter/material.dart';
 import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Cluster());
}

  
class Cluster extends StatefulWidget {
  @override
  _Cluster createState() => _Cluster();
  const Cluster({Key? key}) : super(key: key);
  
}
        
class _Cluster extends State<Cluster> {
  List<int> numbers = List.filled(8, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input your points scored in each subject'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWithNumericalField('English', numbers[0], (val) {
              setState(() {
                numbers[0] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('Kiswahili', numbers[1], (val) {
              setState(() {
                numbers[1] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('Mathematics', numbers[2], (val) {
              setState(() {
                numbers[2] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('Biology', numbers[3], (val) {
              setState(() {
                numbers[3] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('Chemistry', numbers[4], (val) {
              setState(() {
                numbers[4] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('Physics', numbers[5], (val) {
              setState(() {
                numbers[5] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('History', numbers[6], (val) {
              setState(() {
                numbers[6] = int.tryParse(val) ?? 0;
              });
            }),
            TextWithNumericalField('Geography', numbers[7], (val) {
              setState(() {
                numbers[7] = int.tryParse(val) ?? 0;
              });
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Handle submit button pressed
              
            },
            child: const Text('Submit'),
          ),
        ),
      ),
    );
  }
}

class TextWithNumericalField extends StatelessWidget {
  final String label;
  final int value;
  final Function(String) onChanged;

  TextWithNumericalField(this.label, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter a number',
            ),
            textAlign: TextAlign.center,
            controller: TextEditingController(text: value.toString()),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
