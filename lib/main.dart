import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kalkulator Flutter",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const KalkulatorScreen(),
    );
  }
}

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});
  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  final TextEditingController _bilangan1Controller = TextEditingController();
  final TextEditingController _bilangan2Controller = TextEditingController();
  String _hasil = '';

  void _hitung(int operasi) {
    double? a = double.tryParse(_bilangan1Controller.text);
    double? b = double.tryParse(_bilangan2Controller.text);

    if (a == null || b == null) {
      setState(() {
        _hasil = "Input tidak valid";
      });
      return;
    }
    double hasil = 0;
    switch (operasi) {
      case 1:
        hasil = penjumlahan(a, b);
        break;
      case 2:
        hasil = pengurangan(a, b);
        break;
      case 3:
        hasil = perkalian(a, b);
        break;
      case 4:
        hasil = pembagian(a, b);
        break;
      case 5:
        hasil = modulus(a, b);
        break;
      default:
        setState(() {
          _hasil = "Pilihan tidak valid";
        });
        return;
    }
    setState(() {
      _hasil = "Hasilnya : $hasil";
    });
  }

  double penjumlahan(double a, double b) {
    return a + b;
  }

  double pengurangan(double a, double b) {
    return a - b;
  }

  double perkalian(double a, double b) {
    return a * b;
  }

  double pembagian(double a, double b) {
    if (b == 0) {
      setState(() {
        _hasil = "Pembagi tidak boleh 0";
      });
      return double.nan;
    }
    return a / b;
  }

  double modulus(double a, double b) {
    if (b == 0) {
      setState(() {
        _hasil = "Modulus dengan 0 tidak boleh !";
      });
      return double.nan;
    }
    return a % b;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Flutter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //text input bilangan ke1
            TextField(
              controller: _bilangan1Controller,
              decoration: const InputDecoration(
                labelText: 'Bilangan Pertama',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            //text input bilangan ke-2
            TextField(
              controller: _bilangan2Controller,
              decoration: const InputDecoration(
                labelText: 'Bilangan kedua',
                border: OutlineInputBorder(),
              ),  
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Tombol operasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: ()=>_hitung(1), 
                  child: const Text("+"),
                ),
                ElevatedButton(
                onPressed: ()=>_hitung(2),
                child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: ()=>_hitung(3),
                  child: const Text('x'),
                  ),
                ElevatedButton(
                  onPressed: ()=>_hitung(4),
                  child: const Text('/'),
                  ),
                  ElevatedButton(
                  onPressed: ()=>_hitung(5),
                  child: const Text('%'),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Menampilkan hasil
            Text(
              _hasil,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )

          ],
        ),
      ),
    );
  }
}
