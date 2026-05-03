import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // FOTO + NÚMEROS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [

              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Column(
                      children: [
                        Text('3',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('340',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Seguidores'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('180',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Seguindo'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // USERNAME + BIO
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'user.instagram',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Bio',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // BOTÃO EDITAR PERFIL
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text('Editar perfil'),
          ),
        ),

        const SizedBox(height: 10),

        const Divider(color: Colors.white12),
      ],
    );
  }

  // ---------------- GRID ----------------
  Widget _buildGrid() {
    return GridView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          'https://picsum.photos/200?random=$index',
          fit: BoxFit.cover,
        );
      },
    );
  }

  // ---------------- BUILD ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,


      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildGrid(),
          ],
        ),
      ),
    );
  }
}