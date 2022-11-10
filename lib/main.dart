import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseStorage.instance.useStorageEmulator('localhost',9199);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      home: const MyHomePage(title: 'Flutter Firebase Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();

  final String title;

}

class _MyHomePageState extends State<MyHomePage> {
  void _UploadBytes() async {
      // Make your changes here
      List<int> list = 'xxx'.codeUnits;
      Uint8List bytes = Uint8List.fromList(list);
      final storageRef = FirebaseStorage.instance.ref();
      await storageRef.child("test").putData(bytes, SettableMetadata(contentType: 'image/png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ElevatedButton(
        onPressed: _UploadBytes,
        child: const Text('test firebase storage'),
      ), 
    );
  }
}
