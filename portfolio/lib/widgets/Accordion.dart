import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dynamic_fa_icons/dynamic_fa_icons.dart';

class Accordion extends StatelessWidget {
  const Accordion({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  final String icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: ExpansionTile(
              shape: const Border(), //setting border to null
              title: Text(title),
              leading: FaIcon(
                DynamicFaIcons.getIconFromName(icon),
              ),
              children: [
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(body),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
