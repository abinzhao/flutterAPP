import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../components/index.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImmersiveHeader(
      child: Scaffold(
        appBar: const AdaptiveHeader(
          isBackHeader: true,
        ),
        body: Error(
          errorMessage: context.tr('404Text'),
          imageProvider: const AssetImage('./icons/404.png'),
        ),
      ),
    );
  }
}
