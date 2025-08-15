import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _MyHome();
}

class _MyHome extends State<Home> {
  var categoryAwal = "semua";
  final List<Map<String, dynamic>> listproduct = [
    {
      "nama": 'Iphone 12',
      "Harga": 6000000,
      "Gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_Dd7xYfzM3ZPVrCNkRHePwH2MAYNwxMtJ2w&s",
      "Detail": 
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "kategori": "teknologi",
    },
    {
      "nama": 'Hoodie',
      "Harga": 600000,
      "Gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUdaxapqyqGqUcxI6r4ZCGqTTRKBq1_UY60g&s",
      "Detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "kategori": "fashion"
    },
    {
      "nama": 'Apple Watch',
      "Harga": 2000000,
      "Gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF1nXLi4ACUjAaBFKE2HJ-Y9ouO_SWfYmbKg&s",
      "Detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "kategori": "fashion"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var categoryTerpilih =
      categoryAwal == "semua"
        ? listproduct
        : listproduct.where((p) => p["kategori"] == categoryAwal).toList();

    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      backLayer: ListView(
        children: [
          const Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Text("Pilih Kategori"),
          ),
          for (var category in ["semua", "teknologi", "fashion"])
          ListTile(
            title: Text(category),
            leading: Radio<String>(
              value: category,
              groupValue: categoryAwal,
              onChanged: (val) {
                setState(() {
                  categoryAwal = val!;
                });
              },
            ),
          ),
        ],
      ),

      frontLayer: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Rekomendasi",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: 
              categoryTerpilih.map((produk) {
                return listItem(
                  context: context,
                  nama: produk["nama"],
                  Harga: produk["Harga"],
                  Gambar: produk["Gambar"],
                  Detail: produk["Detail"],
                );
              }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[500],
        onTap: (index) {
          if (index == 0) Navigator.popAndPushNamed(context, '/');
          if (index == 1) Navigator.popAndPushNamed(context, '/transaksi');
          if (index == 2) Navigator.popAndPushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "History", icon: Icon(Icons.history)),
          // BottomNavigationBarItem(label: "Order", icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: "Me", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

Widget listItem({
  required String nama,
  required int Harga,
  required String Gambar,
  required String Detail,
  required BuildContext context,
}) {
  return Card( 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              Gambar,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nama, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(
                Harga.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: 
                        (context) => detailProduk(
                          nama: nama,
                          gambar: Gambar,
                          harga: Harga,
                          Detail: Detail,
                          ),
                      )
                    );
                  },
                  child: Text("detail produk"),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}