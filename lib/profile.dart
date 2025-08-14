import 'package:flutter/material.dart';



class Profile extends StatelessWidget {
  const Profile({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Berhasil", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Data berhasil diubah"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK", style: TextStyle(color: Color(0xFFB30838))),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F0), // Off-white premium look
      appBar: AppBar(
        title: const Text(
          "Study Club",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFB30838), // Emirates red
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              // Avatar
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFD4AF37), width: 3), // gold border
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('Assets/image/gambar.jpg'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Salsabila",
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFFB30838),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Card Info
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFFD4AF37), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.phone, color: Color(0xFFB30838)),
                      title: Text("Phone"),
                      subtitle: Text("082283689456"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info_outline, color: Color(0xFFB30838)),
                      title: Text("About"),
                      subtitle: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37), // Gold button
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                onPressed: () => _showDialog(context),
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}