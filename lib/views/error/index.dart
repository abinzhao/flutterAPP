import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../components/index.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImmersiveHeader(
      child: Scaffold(
        appBar: BackHeader(
          pageTitle: context.tr('page404Title'),
          rightChild: Button(
            icon: const FaIcon(FontAwesomeIcons.house),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
        body: Error(
          errorMessage: context.tr('404Text'),
          imageProvider: const AssetImage('./icons/404.png'),
        ),
      ),
    );
  }
}
