import 'package:flutter/material.dart';
import 'widgets/logo_profesional.dart';

void main() {
  runApp(const TarjetaProfesionalApp());
}

class TarjetaProfesionalApp extends StatelessWidget {
  const TarjetaProfesionalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjeta Profesional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F5FA),
      ),
      home: const TarjetaProfesionalScreen(),
    );
  }
}

/// Pantalla principal: una tarjeta profesional construida enteramente
/// con StatelessWidget, combinando Row y Column para organizar la
/// información.
class TarjetaProfesionalScreen extends StatelessWidget {
  const TarjetaProfesionalScreen({super.key});

  // --- Datos del desarrollador ---
  static const String nombreCompleto = 'Mases Rivas';
  static const String rol = 'Desarrollador de Software';
  static const String descripcion =
      'Desarrollador enfocado en aplicaciones móviles multiplataforma '
      'y sistemas embebidos. Me interesa construir productos con '
      'interfaces claras y código mantenible.';
  static const String correo = 'manases.rivas25@itca.edu.sv';
  static const String referencia = 'github.com/manasesrivas';

  static const List<_Tecnologia> tecnologias = [
    _Tecnologia(icono: Icons.flutter_dash, texto: 'Flutter'),
    _Tecnologia(icono: Icons.memory, texto: 'Embebidos'),
    _Tecnologia(icono: Icons.storage, texto: 'SQL'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil profesional'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- Sección 1: identidad ----------
                _SeccionContainer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoProfesional(size: 76, iniciales: 'MR'),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 20,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    nombreCompleto,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              rol,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ---------- Sección 2: descripción ----------
                _SeccionContainer(
                  child: Text(
                    descripcion,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 16),

                // ---------- Sección 3: tecnologías ----------
                _SeccionContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tecnologías',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: tecnologias
                            .map(
                              (t) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(t.icono, color: theme.colorScheme.primary),
                                      const SizedBox(height: 6),
                                      Text(
                                        t.texto,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ---------- Sección 4: contacto ----------
                _SeccionContainer(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contacto',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.email_outlined, size: 18, color: theme.colorScheme.primary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              correo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.link, size: 18, color: theme.colorScheme.primary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              referencia,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Contenedor reutilizable para separar visualmente cada sección
/// de la tarjeta, con padding y bordes redondeados consistentes.
class _SeccionContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const _SeccionContainer({required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFF7F7FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class _Tecnologia {
  final IconData icono;
  final String texto;
  const _Tecnologia({required this.icono, required this.texto});
}
