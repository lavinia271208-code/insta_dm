import 'package:flutter/material.dart';
import 'perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
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

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  // ---------------- STORIES ----------------
  Widget _buildStoryItem(String label, String imageUrl, {bool isMe = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isMe
                      ? null
                      : const LinearGradient(
                    colors: [Colors.yellow, Colors.orange, Colors.pink, Colors.purple],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              if (isMe)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }

  // ---------------- POST ----------------
  Widget _buildPostItem(String username, String location, String postUrl, String userPic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 18, backgroundImage: NetworkImage(userPic)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(postUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border, size: 28),
                  SizedBox(width: 16),
                  Icon(Icons.chat_bubble_outline, size: 26),
                  SizedBox(width: 16),
                  Icon(Icons.send_outlined, size: 26),
                ],
              ),
              Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- HOME ----------------
  Widget _buildHome() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStoryItem('Seu story', 'https://picsum.photos/200', isMe: true),
                _buildStoryItem('eloise', 'https://picsum.photos/201'),
                _buildStoryItem('nando', 'https://picsum.photos/202'),
              ],
            ),
          ),

          const Divider(color: Colors.white12),

          _buildPostItem(
            'mel',
            'Londres',
            'https://picsum.photos/500',
            'https://picsum.photos/50',
          ),

          _buildPostItem(
            'isa',
            'São Paulo',
            'https://picsum.photos/501',
            'https://picsum.photos/51',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final List _pages = [
      _buildHome(),
      const Center(child: Text("Reels")),
      const Center(child: Text("Adicionar")),
      const Center(child: Text("Buscar")),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add_box_outlined),
            Text('Instagram', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Icon(Icons.favorite_border),
          ],
        ),
      ),

      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 13,
              backgroundImage: NetworkImage('https://picsum.photos/id/64/200'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}