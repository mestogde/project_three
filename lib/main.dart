import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Вот здесь добавлен параметр для скрытия баннера отладки
      title: 'project_three',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentSwitcher(),
    );
  }
}

class ContentSwitcher extends StatefulWidget {
  ContentSwitcher({super.key});

  @override
  _ContentSwitcherState createState() => _ContentSwitcherState();
}

class _ContentSwitcherState extends State<ContentSwitcher> {
  int _currentIndex = 0;
  String displayedText = '';



  void _changeContent(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> contentList = [
      Container(
        color: const Color(0xFFE9D7F2),
        child: const Center(
            child: Text('индиго',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, fontStyle: FontStyle.italic,
                  fontSize: 50
              )
            )
        ),
      ),

      Container(
        color: Colors.white,
        child: Center(
            child: Image.network(
                'https://images.unsplash.com/photo-1563181583-d854d08f42b3?q=80&w=2546&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              scale: 3.0,
            )
        ),
      ),

      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Сине-фиолетовый (Indigo Blue)',
                style: TextStyle(color: Color.fromRGBO(75, 0, 130, 1), fontSize: 30)
              ),
              subtitle: Text('Оттенок сочетает в себе глубокие синие и фиолетовые тона, создавая насыщенный и элегантный цвет'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Электрический индиго (Electric Indigo)',
                style: TextStyle(color: Color.fromRGBO(102, 0, 255, 1), fontSize: 30)
              ),
              subtitle: Text('Этот оттенок индиго более яркий и насыщенный, чем традиционный индиго, с яркими сине-фиолетовыми оттенками'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                  'Индиго-кобальт (Indigo Cobalt)',
                style: TextStyle(color: Color.fromRGBO(75, 0, 130, 1), fontSize: 30)
              ),
              subtitle: Text('Этот оттенок индиго имеет более темные и глубокие синие тона с намеком на фиолетовую окраску'),
            ),
          ],
        ),
      ),

      Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Какой цвет мы изучаем?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    displayedText = 'Индиго';
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  'нажать',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                displayedText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'немного о цвете',
          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: contentList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeContent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wordpress),
            label: 'слово',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'визуал',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'оттенки',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'внимание',
            backgroundColor: Colors.black87,
          ),
        ],
        selectedItemColor: Colors.indigo,
      ),
    );
  }
}
