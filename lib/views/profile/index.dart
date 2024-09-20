import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const Text(
              'Hello World,ProfileScreen',
              style: TextStyle(fontSize: 14),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text(
                '跳转到登录',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context.go('/loginddddd');
              },
              child: const Text(
                '跳转到未知页面',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
