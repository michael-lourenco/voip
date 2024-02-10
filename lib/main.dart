import 'package:flutter/material.dart';

void main() {
  runApp(PxtCallApp());
}

class PxtCallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PxtCall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PxtCall'), // Defina o título aqui
      ),
      body: Center(
        child: _selectedIndex == 2
            ? SettingsPage()
            : _selectedIndex == 0
                ? CallsPage()
                : _selectedIndex == 1
                    ? ContactsPage()
                    : Text(
                'Bem-vindo ao PxtCall',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Chamadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contatos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chamadas'),
      ),
      body: ListView.builder(
        itemCount: 10, // Número de chamadas fictício
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // Ícone do contato ou iniciais do nome do contato
              child: Text('C$index'), // Usando C$index como exemplo
            ),
            title: Text('Contato $index'),
            subtitle: Text('00:00'), // Duração da chamada
            trailing: Icon(Icons.call), // Ícone de chamada perdida, recebida ou efetuada
            onTap: () {
              // Adicione a lógica para abrir detalhes da chamada
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione a lógica para realizar uma nova chamada
        },
        child: Icon(Icons.add_call),
      ),
    );
  }
}


class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [
    Contact(name: 'João', phoneNumber: '123456789'),
    Contact(name: 'Maria', phoneNumber: '987654321'),
    Contact(name: 'Carlos', phoneNumber: '456789123'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index].name),
            subtitle: Text(_contacts[index].phoneNumber),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione a lógica para adicionar um novo contato
          // por exemplo, exibir um diálogo ou navegar para outra tela
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notificações'),
            trailing: Switch(
              value: true, // Aqui você pode controlar o estado do switch com uma variável
              onChanged: (value) {
                // Adicione a lógica para controlar as notificações
              },
            ),
          ),
          ListTile(
            title: Text('Idioma'),
            trailing: Icon(Icons.language),
            onTap: () {
              // Adicione a lógica para selecionar o idioma
            },
          ),
          ListTile(
            title: Text('Tema'),
            trailing: Icon(Icons.palette),
            onTap: () {
              // Adicione a lógica para selecionar o tema
            },
          ),
          ListTile(
            title: Text('Sobre'),
            trailing: Icon(Icons.info),
            onTap: () {
              // Adicione a lógica para exibir informações sobre o aplicativo
            },
          ),
        ],
      ),
    );
  }
}
