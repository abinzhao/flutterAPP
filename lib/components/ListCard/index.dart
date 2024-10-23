import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListCard extends StatelessWidget {
  final bool? showAction;
  final IconData? actionIcon;
  final IconData? logoIcon;
  final List<Map<String, dynamic>> listItems;

  const ListCard({
    super.key,
    this.showAction = false,
    this.actionIcon,
    required this.listItems,
    this.logoIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...listItems.map((item) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (logoIcon != null)
                      FaIcon(
                        logoIcon,
                        color: Theme.of(context).primaryColor,
                      ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  width: 0.5),
                            ),
                          ),
                          child: item['child'] ?? const SizedBox.shrink(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (showAction!)
                      FaIcon(
                        actionIcon ?? FontAwesomeIcons.arrowLeft,
                        color: Colors.black26,
                        size: 18,
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
