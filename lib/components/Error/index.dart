import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Error extends StatelessWidget {
  final String errorMessage;
  final ImageProvider<Object>? imageProvider;
  final BoxFit? fit;
  final double? imageWidth;
  final double? imageHeight;

  const Error({
    super.key,
    required this.errorMessage,
    this.imageProvider = const AssetImage('./images/404.png'),
    this.fit = BoxFit.contain,
    this.imageWidth = 200,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider as ImageProvider<Object>,
                    fit: BoxFit.contain,
                  ),
                ),
                width: imageWidth,
                height: imageHeight,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Oops! Something went wrong.',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(errorMessage),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}
