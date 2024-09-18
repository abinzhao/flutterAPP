import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AdaptiveHeader(
          isBackHeader: true,
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'the is Login page',
                style: TextStyle(fontSize: 14),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text(
                  '回到首页',
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
