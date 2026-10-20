import 'package:flutter/material.dart';

const String kNombreCompleto = 'Wilzer Roberto Apaza Tiñini';

const Color kNavy = Color(0xFF2B3A4A);
const Color kTerracota = Color(0xFFC0634A);
const Color kFondo = Color(0xFFF5F6F8);

void main() => runApp(const AyniApp());

class AyniApp extends StatelessWidget {
  const AyniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AyniApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kTerracota,
          primary: kTerracota,
        ),
        scaffoldBackgroundColor: kFondo,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _ocultar = true;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _iniciarSesion() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kNavy,
          content: Text('¡Bienvenido, ${_userCtrl.text.trim()}!'),
        ),
      );
    }
  }

  InputDecoration _decoracion(String label, IconData icono, {Widget? sufijo}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icono, color: kNavy),
      suffixIcon: sufijo,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kTerracota, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 72, 24, 40),
            decoration: const BoxDecoration(
              color: kNavy,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: kTerracota,
                  child: Icon(Icons.handshake_outlined,
                      size: 42, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'AyniApp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Digitalización y Gestión de Pasanaku',
                  style: TextStyle(color: Color(0xFFE9B7A8), fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Inicia sesión',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _userCtrl,
                      decoration: _decoracion('Usuario', Icons.person_outline),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Ingresa tu usuario'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passCtrl,
                      obscureText: _ocultar,
                      decoration: _decoracion(
                        'Contraseña',
                        Icons.lock_outline,
                        sufijo: IconButton(
                          icon: Icon(_ocultar
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () =>
                              setState(() => _ocultar = !_ocultar),
                        ),
                      ),
                      validator: (v) => (v == null || v.length < 4)
                          ? 'Mínimo 4 caracteres'
                          : null,
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 52,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: kTerracota,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _iniciarSesion,
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Divider(),
                    const SizedBox(height: 8),
                    const Text(
                      kNombreCompleto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kNavy,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      'UNIFRANZ · Ingeniería de Sistemas',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
