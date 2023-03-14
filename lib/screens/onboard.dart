import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'courses.dart';
import 'components/courses/clusterpoints.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const OnBoard());
}

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What are your Interests?',
      
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.delegate.supportedLocales,
      home: const CompleteForm(),
    );
  }
}

class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  State<CompleteForm> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends State<CompleteForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _interestsHasError = false;

  var genderOptions = ['Medicine', 'Engineering', 'Teaching'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    CollectionReference programs = FirebaseFirestore.instance.collection('programs');
    return Scaffold(
      appBar: AppBar(title: const Text('Please select your interest')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('programs').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FormBuilder(
                    key: _formKey,
                    // enabled: false,
                    onChanged: () {
                      _formKey.currentState!.save();
                      debugPrint(_formKey.currentState!.value.toString());
                    },
                    autovalidateMode: AutovalidateMode.disabled,
                    initialValue: const {
                      'best_language': 'English',
                      'points': '12',
                      'interests': 'Medicine',
                      'languages_filter': ['English']
                    },
                    skipDisabled: true,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        FormBuilderFilterChip<String>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              labelText: 'select Subjects you did'),
                          name: 'languages_filter',
                          selectedColor: Colors.red,
                          options: const [
                            FormBuilderChipOption(
                              value: 'English',
                              avatar: CircleAvatar(child: Text('E')),
                            ),
                            FormBuilderChipOption(
                              value: 'Swahili',
                              avatar: CircleAvatar(child: Text('S')),
                            ),
                            FormBuilderChipOption(
                              value: 'Mathematics',
                              avatar: CircleAvatar(child: Text('M')),
                            ),
                            FormBuilderChipOption(
                              value: 'Biology',
                              avatar: CircleAvatar(child: Text('B')),
                            ),
                            FormBuilderChipOption(
                              value: 'Physics',
                              avatar: CircleAvatar(child: Text('P')),
                            ),
                            FormBuilderChipOption(
                              value: 'Chemistry',
                              avatar: CircleAvatar(child: Text('C')),
                            ),
                            FormBuilderChipOption(
                              value: 'History',
                              avatar: CircleAvatar(child: Text('H')),
                            ),
                            FormBuilderChipOption(
                              value: 'Geography',
                              avatar: CircleAvatar(child: Text('G')),
                            ),
                            FormBuilderChipOption(
                              value: 'Agriculture',
                              avatar: CircleAvatar(child: Text('A')),
                            ),
                            FormBuilderChipOption(
                              value: 'Home Science',
                              avatar: CircleAvatar(child: Text('H')),
                            ),
                            FormBuilderChipOption(
                              value: 'Art&Design',
                              avatar: CircleAvatar(child: Text('A')),
                            ),
                            FormBuilderChipOption(
                              value: 'French',
                              avatar: CircleAvatar(child: Text('F')),
                            ),
                            FormBuilderChipOption(
                              value: 'Business Studies',
                              avatar: CircleAvatar(child: Text('B')),
                            ),
                          ],
                          onChanged: _onChanged,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.minLength(8),
                            FormBuilderValidators.maxLength(8),
                          ]),
                        ),
                        FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.always,
                          name: 'points',
                          decoration: InputDecoration(
                            labelText: 'Points',
                            suffixIcon: _ageHasError
                                ? const Icon(Icons.error, color: Colors.red)
                                : const Icon(Icons.check, color: Colors.green),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _ageHasError = !(_formKey.currentState?.fields['points']
                                      ?.validate() ??
                                  false);
                            });
                          },
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.max(12),
                          ]),
                          // initialValue: '12',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        FormBuilderDropdown<String>(
                          // automated: true,
                          name: 'interests',
                          decoration: InputDecoration(
                            labelText: 'Interests',
                            suffix: _interestsHasError
                                ? const Icon(Icons.error)
                                : const Icon(Icons.check),
                            hintText: 'Select interest',
                          ),
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required()]),

                          items: genderOptions
                              .map((interests) => DropdownMenuItem (
                                    alignment: AlignmentDirectional.center,
                                    value: interests,
                                    child: Text(interests),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _interestsHasError = !(_formKey
                                      .currentState?.fields['interests']
                                      ?.validate() ??
                                  false);
                            });
                          },
                          valueTransformer: (val) => val?.toString(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.saveAndValidate() ?? false) {
                              debugPrint(_formKey.currentState?.value.toString());
                            } else {
                              debugPrint(_formKey.currentState?.value.toString());
                              debugPrint('validation failed');
                            }
                             _navigateToNextScreen(context);    
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _formKey.currentState?.reset();
                          },
                          // color: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyApp()));
  }
}