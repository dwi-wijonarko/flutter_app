import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_page.dart';
import 'package:flutter_application_1/pages/gallery_page.dart';
import 'package:flutter_application_1/pages/setting_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/widgets/custom_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tambahkan baris ini
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.blueAccent,
          )),
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSnackBar() {
    // Show a SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('Hello from snackbar!'),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: Text(widget.title), actions: [
        // Icon Search
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Untuk sementara bisa menampilkan snackbar bahwa fitur search belum tersedia
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Search feature coming soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
        // Icon Settings
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
            );
          },
        ),
        PopupMenuButton<String>(
          onSelected: (String value) {
            switch (value) {
              case 'Profile':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                break;
              case 'Gallery':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
                break;
              case 'About':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Profile', // Menetapkan nilai untuk item menu
              child: Text('Profile'),
            ),
            PopupMenuItem<String>(
              value: 'Gallery', // Menetapkan nilai untuk item menu
              child: Text('Gallery'),
            ),
            PopupMenuItem<String>(
              value: 'About', // Menetapkan nilai untuk item menu
              child: Text('About'),
            ),
          ],
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome:',
            ),
            Text(
              'Mobile Programming',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSnackBar,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
