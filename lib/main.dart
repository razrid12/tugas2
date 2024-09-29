import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanProfile()),
                );
              },
              child: Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanPenjumlahanPengurangan()),
                );
              },
              child: Text('Penjumlahan & Pengurangan'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanGanjilGenap()),
                );
              },
              child: Text('Ganjil/Genap'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama: Razif Ridwansyah'),
            Text('NIM: 124220041'),
            Text('Tempat dan Tanggal Lahir: 20 Juni 2004'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanPenjumlahanPengurangan extends StatefulWidget {
  @override
  _HalamanPenjumlahanPenguranganState createState() => _HalamanPenjumlahanPenguranganState();
}

class _HalamanPenjumlahanPenguranganState extends State<HalamanPenjumlahanPengurangan> {
  final TextEditingController _angkaPertamaController = TextEditingController();
  final TextEditingController _angkaKeduaController = TextEditingController();
  String _hasil = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjumlahan & Pengurangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _angkaPertamaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka pertama',
              ),
            ),
            TextField(
              controller: _angkaKeduaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka kedua',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int? angkaPertama = int.tryParse(_angkaPertamaController.text);
                    int? angkaKedua = int.tryParse(_angkaKeduaController.text);
                    if (angkaPertama != null && angkaKedua != null) {
                      setState(() {
                        _hasil = 'Hasil Penjumlahan: ${angkaPertama + angkaKedua}';
                      });
                    } else {
                      setState(() {
                        _hasil = 'Input tidak valid';
                      });
                    }
                  },
                  child: Text('Tambah'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    int? angkaPertama = int.tryParse(_angkaPertamaController.text);
                    int? angkaKedua = int.tryParse(_angkaKeduaController.text);
                    if (angkaPertama != null && angkaKedua != null) {
                      setState(() {
                        _hasil = 'Hasil Pengurangan: ${angkaPertama - angkaKedua}';
                      });
                    } else {
                      setState(() {
                        _hasil = 'Input tidak valid';
                      });
                    }
                  },
                  child: Text('Kurangi'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_hasil),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanGanjilGenap extends StatefulWidget {
  @override
  _HalamanGanjilGenapState createState() => _HalamanGanjilGenapState();
}

class _HalamanGanjilGenapState extends State<HalamanGanjilGenap> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganjil atau Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int? angka = int.tryParse(_controller.text);
                if (angka != null) {
                  setState(() {
                    if (angka % 2 == 0) {
                      _hasil = 'Genap';
                    } else {
                      _hasil = 'Ganjil';
                    }
                  });
                } else {
                  setState(() {
                    _hasil = 'Input bukan angka yang valid';
                  });
                }
              },
              child: Text('Cek'),
            ),
            SizedBox(height: 20),
            Text(_hasil),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanUtama()),
                );
              },
              child: Text('Kembali ke Menu Utama'),
            ),
          ],
        ),
      ),
    );
  }
}
