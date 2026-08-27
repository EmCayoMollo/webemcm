import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navbar superior
      appBar: const CustomNavbar(),
      // Menú lateral para pantallas móviles
      endDrawer: const CustomMobileDrawer(),
      // Cuerpo principal desplegable
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. SECCIÓN INICIO (HERO)
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 500),
              color: Colors.blue.shade50,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bienvenido a Nuestra Web Estática',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Solución limpia y adaptable utilizando Flutter Web.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {}, // Sin acción de momento
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Ver Servicios'),
                  ),
                ],
              ),
            ),

            // 2. SECCIÓN SERVICIOS
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 500),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              child: Column(
                children: [
                  const Text(
                    'Nuestros Servicios',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(Icons.web, 'Diseño Web'),
                      _buildFeatureCard(Icons.speed, 'Alto Rendimiento'),
                      _buildFeatureCard(Icons.devices, 'Adaptable a Móvil'),
                    ],
                  ),
                ],
              ),
            ),

            // 3. SECCIÓN PIE DE PÁGINA
            Container(
              width: double.infinity,
              color: Colors.grey.shade900,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  const Text(
                    'Contacto: info@misitioweb.com',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Ubicación: La Paz, Bolivia',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 12),
                  const Text(
                    '© 2026 Mi Sitio Web. Todos los derechos reservados.',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tarjetas informativas reutilizables
  Widget _buildFeatureCard(IconData icon, String title) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 44, color: Colors.blue),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// NAVBAR ADAPTABLE
// -----------------------------------------------------------------------------
class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'MI SITIO WEB',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                if (!isMobile)
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Inicio')),
                      TextButton(onPressed: () {}, child: const Text('Servicios')),
                      TextButton(onPressed: () {}, child: const Text('Contacto')),
                    ],
                  ),
              ],
            ),
          ),
          actions: isMobile
              ? [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.black87),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ]
              : null,
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// DRAWER MÓVIL
// -----------------------------------------------------------------------------
class CustomMobileDrawer extends StatelessWidget {
  const CustomMobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade800),
            child: const Center(
              child: Text(
                'Menú de Navegación',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Servicios'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('Contacto'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}