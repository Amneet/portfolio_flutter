import 'package:flutter/material.dart';
import 'package:portfolio/widgets/experience.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/providers/experience_provider.dart';

class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({super.key});

  @override
  ConsumerState<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    final experienceRef = ref.watch(experienceProvider);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Professional Experience',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 5,
            endIndent: 300,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                for (var i = 0; i < experienceRef.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experienceRef[i].organization,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 2.5,
                        ),
                      ),
                      Experience(
                        image: experienceRef[i].image,
                        achievements: experienceRef[i].achievements,
                        location: experienceRef[i].location,
                        position: experienceRef[i].position,
                        responsibilities: experienceRef[i].responsibilities,
                        year: experienceRef[i].year,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
