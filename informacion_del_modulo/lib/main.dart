import 'package:flutter/material.dart';

void main() {
  runApp(const AppMain());
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi modulo')),
      body: Center(
        child: Container(
          width: 340,
          decoration: BoxDecoration(
            color: Colors.lime,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                'Desarrollo de Aplicaciones Moviles',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text('Duracion: 80 horas'),
              SizedBox(height: 10),
              Text('Modalidad: "Semipresenial"'),
              SizedBox(height: 10),
              Text('Tecnologia principal:'),
              SizedBox(height: 5,),
              Text('Flutter',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school),
                  SizedBox(width: 30),
                  Text('Tecnico en Desarrollo de software'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
