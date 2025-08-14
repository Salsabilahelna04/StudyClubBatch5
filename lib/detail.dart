import 'package:flutter/material.dart';

class detailProduk extends StatelessWidget {
  final String nama;
  final String gambar;
  final int harga;
  final String Detail;
  const detailProduk({
    super.key,
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.Detail,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), actions: const []),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      gambar,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Text(nama),
                  ],
                ),
              ),
              Text(harga.toString()),
              Text(Detail),
            ],
          ),
        ),
      ),
    );
  }
}