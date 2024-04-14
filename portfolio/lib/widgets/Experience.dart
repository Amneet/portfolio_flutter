import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({
    super.key,
    required this.achievements,
    required this.location,
    required this.position,
    required this.responsibilities,
    required this.year,
    required this.image,
  });

  final String image;
  final String position;
  final String year;
  final String location;
  final List<String> responsibilities;
  final List<String> achievements;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 3, color: Theme.of(context).colorScheme.onSurface),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    position,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '($year | $location)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Image.asset(
                image,
                height: 75,
                // width: 25,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Key Responsibilities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 0.5,
            endIndent: 100,
          ),
          for (var resp in responsibilities)
            Column(children: [
              Text(
                '\u2022 $resp',
              ),
              const SizedBox(
                height: 8,
              )
            ]),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Key Achievements',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 0.5,
            endIndent: 100,
          ),
          for (var ach in achievements) 
            Column(children: [
              Text(
                '\u2022 $ach',
              ),
              const SizedBox(
                height: 8,
              )
            ])
        ],
      ),
    );
  }
}
