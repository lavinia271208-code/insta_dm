import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove aquela faixa vermelha de "Debug"
      title: 'Instagram Clone',
      theme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro como padrão
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

  // --- WIDGET PARA CRIAR CADA ITEM DOS STORIES ---
  Widget _buildStoryItem(String label, String imageUrl, {bool isMe = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              // Container que faz a borda colorida (Gradiente do Instagram)
              Container(
                padding: const EdgeInsets.all(3), // Espaço para a borda aparecer
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isMe
                      ? null // O "Seu Story" não tem borda colorida
                      : const LinearGradient(
                    colors: [Colors.yellow, Colors.orange, Colors.pink, Colors.purple],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black, // Espaço preto entre a borda e a foto
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              // Ícone azul de "+" caso seja o story do próprio usuário
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
          // Nome do usuário embaixo da bolinha
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }

  // --- WIDGET PARA CRIAR CADA POST NO FEED ---
  Widget _buildPostItem(String username, String location, String postUrl, String userPic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabeçalho do post (Avatar, Nome e Localização)
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(userPic),
                  ),
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
              const Icon(Icons.more_vert), // Botão de três pontos
            ],
          ),
        ),
        // Imagem Principal do Post
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
        // Barra de Ações (Curtir, Comentar, Enviar e Salvar)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto do app

      // BARRA SUPERIOR (Logo e Ícones)
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add_box_outlined, color: Colors.white),
            Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Serif', // Aproxima o estilo da logo
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.favorite_border, color: Colors.white),
          ],
        ),
      ),

      // CORPO DO APP
      body: SingleChildScrollView(
        child: Column(
          children: [ // <--- A gente abre o children aqui e SÓ aqui.

            // 1. ÁREA DOS STORIES
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem('Seu story', 'https://imagedelivery.net/EafvxYlk8cSUsWEWsetEdQ/c52ae85e-23f3-42bf-96b5-d061a951ff00/w=900', isMe: true),
                  _buildStoryItem('eloise_alvs', 'https://media.istockphoto.com/id/952859712/pt/foto/landscape-of-beautiful-sunset-in-the-desert-sinai-peninsula.jpg?s=612x612&w=0&k=20&c=Gg0ClFN5t7jt4zPalUxS_jUjXY7X7VbohBVVNVb6M5I='),
                  _buildStoryItem('nando.castroo', 'https://img.freepik.com/fotos-gratis/vista-traseira-do-casal-abracado-na-praia_23-2148379871.jpg'),
                  _buildStoryItem('gui.alvss', 'https://www.organnact.com.br/wp-content/uploads/2022/07/bigstock-Frozen-Old-Sad-White-British-S-449433815-1-1024x683.jpg'),
                ],
              ),
            ),

            const Divider(color: Colors.white12, height: 1), // Linha separadora

            // 2. FEED DE POSTS (Aqui você NÃO repete a palavra children)

            // Post 1
            _buildPostItem(
              'mel.travels',
              'Londres',
              'https://img.elo7.com.br/product/zoom/2433EA5/papel-de-parede-londres-palacio-cidade-paisagem-predio-gg420-adesivo-decorativo-cidades.jpg',
              'https://www.sp.senac.br/documents/51838645/51838647/fotografia_.jpg/db47d630-c79e-5654-ab68-d37753fa2249?version=1.0&t=1663166321381',
            ),

            // Post 2
            _buildPostItem(
              'isa_photos',
              'São Paulo',
              'https://m.media-amazon.com/images/I/719CyVQCfYL._AC_UF894,1000_QL80_.jpg',
              'https://images.pexels.com/photos/26181290/pexels-photo-26181290/free-photo-of-por-do-sol-pessoa-camera-maquina.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            ),

          ], // <--- Fecha o único children da Column
        ),
      ),

      // BARRA DE NAVEGAÇÃO INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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