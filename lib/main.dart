import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_page.dart';
import 'package:flutter_application_1/pages/gallery_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inixindo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum MenuEnum {
  beranda,
  jadwalPerkuliahan,
  jadwalSkripsi,
  evaluasiDosen,
  evaluasiProdi,
}

class _MyHomePageState extends State<MyHomePage> {
  var _submenuEvaluasi = false;
  var _submenuJadwal = false;
  var _selectedMenu = MenuEnum.beranda;

  tampilkanSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Menu ini belum diimplementasi'),
        backgroundColor: Colors.blue[200],
        action: SnackBarAction(
          label: 'OK',
          backgroundColor: Colors.white,
          onPressed: () {
            tampilkanModalBottomSheet();
          },
        ),
      ),
    );
  }

  tampilkanAlert() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Pesan'),
            content: Text(
                'Selamat datang di aplikasi Fasilkom App. Gunakan aplikasi ini untuk mendukung produktivitas anda!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  tampilkanModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 200,
            child: Column(
              children: [
                Text(
                  'Pilih salah satu opsi!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      TextButton(
                        onPressed: () {
                          Future.delayed(Duration(milliseconds: 400), () {
                            Navigator.of(context).pop();
                            Future.delayed(Duration(milliseconds: 300), () {
                              tampilkanAlert();
                            });
                          });
                        },
                        child: Text('Opsi 1'),
                      ),
                      TextButton(onPressed: () {}, child: Text('Opsi 2')),
                      TextButton(onPressed: () {}, child: Text('Opsi 3')),
                      TextButton(onPressed: () {}, child: Text('Opsi 4')),
                      TextButton(onPressed: () {}, child: Text('Opsi 5')),
                      TextButton(onPressed: () {}, child: Text('Opsi 6')),
                      TextButton(onPressed: () {}, child: Text('Opsi 7')),
                      TextButton(onPressed: () {}, child: Text('Opsi 8')),
                      TextButton(onPressed: () {}, child: Text('Opsi 9')),
                      TextButton(onPressed: () {}, child: Text('Opsi 10')),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tampilkanSnackBar();
        },
        tooltip: 'Increment',
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      drawer: Builder(builder: (ctx) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: buildDrawer(),
        );
      }),
    );
  }

  Widget buildBody() {
    if (_selectedMenu == MenuEnum.jadwalPerkuliahan) {
      return buildBodyJadwalPerkuliahan();
    }
    return buildBodyBeranda();
  }

  Widget buildBodyJadwalPerkuliahan() {
    var listMataKuliah = [
      'Algoritma dan Pemrograman',
      'Sistem Basis Data',
      'UI/UX',
      'Sistem Informasi Geografis',
    ];
    return ListView(
      children: [
        ...(listMataKuliah.map((mk) {
          return ListTile(
            title: Text(mk),
            leading: Icon(Icons.book_online),
            onTap: () {},
          );
        }).toList()),
      ],
    );
  }

  Widget buildBodyBeranda() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Selamat datang di Fasilkom App'),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var titleText = "FASILKOM APP";
    if (_selectedMenu == MenuEnum.evaluasiDosen) {
      titleText = "Evaluasi Dosen";
    } else if (_selectedMenu == MenuEnum.evaluasiProdi) {
      titleText = "Evaluasi Program Studi";
    } else if (_selectedMenu == MenuEnum.jadwalPerkuliahan) {
      titleText = "Jadwal Perkuliahan";
    } else if (_selectedMenu == MenuEnum.jadwalSkripsi) {
      titleText = "Jadwal Sidang Skripsi";
    }
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(titleText),
      actions: [
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
        // Menu PopUp yang sudah ada
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
              value: 'Profile',
              child: Text('Profile'),
            ),
            PopupMenuItem<String>(
              value: 'Gallery',
              child: Text('Gallery'),
            ),
            PopupMenuItem<String>(
              value: 'About',
              child: Text('About'),
            ),
          ],
        ),
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.blue.shade900,
                ],
              ),
            ),
            accountName: Text(
              'Dwi Wijonarko',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              'dwi.wijonarko@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            // trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                _selectedMenu = MenuEnum.beranda;
              });
            },
          ),
          ExpansionTile(
            title: Text('Jadwal'),
            leading: Icon(Icons.calendar_month),
            trailing: _submenuJadwal == false
                ? Icon(Icons.keyboard_arrow_right)
                : Icon(Icons.keyboard_arrow_down),
            onExpansionChanged: (v) {
              setState(() {
                _submenuJadwal = v;
              });
            },
            children: [
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Jadwal Perkuliahan'),
                // trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedMenu = MenuEnum.jadwalPerkuliahan;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Jadwal Skripsi'),
                // trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedMenu = MenuEnum.jadwalSkripsi;
                  });
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Evaluasi Kinerja'),
            leading: Icon(Icons.area_chart),
            trailing: _submenuEvaluasi == false
                ? Icon(Icons.chevron_right)
                : Icon(Icons.keyboard_arrow_down),
            onExpansionChanged: (v) {
              setState(() {
                _submenuEvaluasi = v;
              });
            },
            children: [
              ListTile(
                leading: Icon(Icons.person_4),
                title: Text('Evaluasi Dosen'),
                // trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedMenu = MenuEnum.evaluasiDosen;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.apartment),
                title: Text('Evaluasi Program Studi'),
                // trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedMenu = MenuEnum.evaluasiProdi;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
