import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, //fundo preto
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os itens p/ Esquerda, Centro e Direita
          children: [
            IconButton(
              icon: const Icon(Icons.add.box.outlined, color: Colors.white), //ícone de +
            ),
            const Text( 
              'Instagram',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Billabong',
                fontSize: 28,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.farorite_border, color: Colors.white),
              //aq
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
