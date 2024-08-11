import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тор барагы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridPage(),
    );
  }
}

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Арткы фон сүрөтү
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.png'), // Фон сүрөтүңүздүн жолу
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 60.0,
                color: Colors.transparent,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: 64,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.transparent,
                      child:
                          Image.asset('assets/seaweed.png', fit: BoxFit.cover),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('100',
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    SizedBox(width: 8),
                    Image.asset('assets/coin.png',
                        width: 24, height: 24), // Монета сүрөтүңүздүн жолу
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white),
              onPressed: () {
                // Маалымат баскычын баскандагы иш-аракеттер
              },
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                // Жабуу баскычын баскандагы иш-аракеттер
              },
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('0', style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(width: 8),
                Image.asset('assets/coin.png',
                    width: 24, height: 24), // Монета сүрөтүңүздүн жолу
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Оюн',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Дүкөн',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Барактоолор',
          ),
        ],
      ),
    );
  }
}
