import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key, required this.title});

  final String title;

  @override
  State<Transaksi> createState() => _MyHome();
}

class _MyHome extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History Transaksi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Riwayat Transaksi",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Contoh list riwayat transaksi
          transaksiItem(
            context: context,
            nama: 'Iphone 12',
            tanggal: '10 Agustus 2025',
            jumlah: 1,
            total: 6000000,
            status: 'Selesai',
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_Dd7xYfzM3ZPVrCNkRHePwH2MAYNwxMtJ2w&s",
          ),
          transaksiItem(
            context: context,
            nama: 'Hoodie',
            tanggal: '8 Agustus 2025',
            jumlah: 2,
            total: 1200000,
            status: 'Diproses',
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUdaxapqyqGqUcxI6r4ZCGqTTRKBq1_UY60g&s",
          ),
          transaksiItem(
            context: context,
            nama: 'Apple Watch',
            tanggal: '5 Agustus 2025',
            jumlah: 1,
            total: 2000000,
            status: 'Selesai',
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF1nXLi4ACUjAaBFKE2HJ-Y9ouO_SWfYmbKg&s",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[500],
        onTap: (index) {
          if (index == 0) Navigator.popAndPushNamed(context, '/');
          if (index == 1) Navigator.popAndPushNamed(context, '/transaksi');
          if (index == 2) Navigator.popAndPushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "History", icon: Icon(Icons.history)),
          BottomNavigationBarItem(label: "Me", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

Widget transaksiItem({
  required String nama,
  required String tanggal,
  required int jumlah,
  required int total,
  required String status,
  required String gambar,
  required BuildContext context,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(gambar, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tanggal: $tanggal"),
          Text("Jumlah: $jumlah"),
          Text("Total: Rp ${total.toString()}"),
          Text("Status: $status",
              style: TextStyle(
                  color: status == "Selesai" ? Colors.green : Colors.orange)),
        ],
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // Aksi saat item di-tap, misalnya ke detail transaksi
      },
    ),
  );
}
