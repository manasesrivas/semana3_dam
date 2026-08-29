import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Control de Asistencia',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const PantallaAsistencia(),
    );
  }
}

class PantallaAsistencia extends StatefulWidget {
  const PantallaAsistencia({super.key});

  @override
  State<PantallaAsistencia> createState() => _PantallaAsistenciaState();
}

class _PantallaAsistenciaState extends State<PantallaAsistencia> {
  int presentes = 0;
  final int totalEstudiantes = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control de Asistencia')),
      body: Center(
        child: Container(
          width: 340,
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.groups, size: 90),
              const SizedBox(height: 15),
              const Text(
                'Desarrollo de Aplicaciones Moviles',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              const Text(
                'Estudiantes presentes',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                '$presentes',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              // porcentaje de estudiantes

              Text(
                calcularPorcentaje(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
                textAlign: TextAlign.center,
              ),

              Text(
                'de $totalEstudiantes estudiantes',
                style: const TextStyle(fontSize: 16)
              ),
              const SizedBox(height: 10),
              Text(
                'Ausentes: ${totalEstudiantes - presentes}'
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if(presentes > 0){
                          setState(
                            (){
                              presentes--;
                            }
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 45,
                      )
                    ),
                  IconButton(
                    onPressed: (){
                      if(presentes < totalEstudiantes){
                        setState(
                          (){
                            presentes++;
                          }
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      size: 45,
                    )
                  )

                ]
              )
            ],
          ),
        ),
      ),
    );
  }

  String calcularPorcentaje(){
    double porcentaje = (presentes / totalEstudiantes) * 100;
    String msg = '';
    if(porcentaje == 100){ // mostrar 'asistencia completa'
      msg = 'Asistencia completa';
    }
    else if(porcentaje >= 75){ // mostrar 'la asistencia es buena'
      msg = 'La asistencia es buena';
    }
    else if(porcentaje < 75){ // mostrar 'la asistencia es baja'
      msg =  'La asistencia es baja';
    }
    return msg;
  }
  
}
