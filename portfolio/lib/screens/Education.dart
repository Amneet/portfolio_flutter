import 'package:flutter/material.dart';
import 'package:portfolio/widgets/education.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/providers/education_provider.dart';

//SIMPLE USE OF RIVERPOD IN THIS FILE
class EducationScreen extends ConsumerStatefulWidget {
  const EducationScreen({super.key});

  @override
  ConsumerState<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends ConsumerState<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    final educationRef = ref.watch(educationProvider);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Education',
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
                for (var i = 0; i < educationRef.length; i++)
                  Education(
                    image: educationRef[i].image,
                    institution: educationRef[i].institution,
                    degree: educationRef[i].degree,
                    year: educationRef[i].year,
                    location: educationRef[i].location,
                    relevantCoursework: educationRef[i].relevantCoursework,
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
