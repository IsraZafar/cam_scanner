<<<<<<< HEAD
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // State to hold whether dark theme is enabled or not
  bool _isDarkMode = false;
=======
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
>>>>>>> 3cbf2b0 (first commit)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Dark Light Screen',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        onThemeToggle: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
=======
      title: 'CAMSCANNER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CAMSCANNER'),
      debugShowCheckedModeBanner: false,
>>>>>>> 3cbf2b0 (first commit)
    );
  }
}

<<<<<<< HEAD
class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  HomeScreen({required this.isDarkMode, required this.onThemeToggle});
=======
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _scannedImage;

  Future<void> _startScan() async {
    // Check and request camera permission
    final cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          final File imageFile = File(image.path);
          if (await imageFile.exists()) {
            setState(() {
              _scannedImage = imageFile;
            });
          } else {
            print("Image file does not exist");
          }
        } else {
          print("No image selected.");
        }
      } catch (e) {
        print("Error picking image: $e");
      }
    } else {
      print("Camera permission denied");
      // Optionally: Show an alert to the user to grant permissions
    }
  }
>>>>>>> 3cbf2b0 (first commit)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('Dark Light Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onThemeToggle,
          child: Text(
              isDarkMode ? 'Switch to Light Theme' : 'Switch to Dark Theme'),
        ),
      ),
=======
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_scannedImage != null)
              Image.file(
                _scannedImage!,
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              )
            else
              Text(
                "You have not scanned a document yet.",
                style: Theme.of(context).textTheme.titleLarge,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startScan,
        tooltip: 'Scan Document',
        child: const Icon(Icons.camera),
      ),
>>>>>>> 3cbf2b0 (first commit)
    );
  }
}
