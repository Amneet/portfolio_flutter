import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
    required this.location,
    required this.degree,
    required this.relevantCoursework,
    required this.year,
    required this.image,
    required this.institution,
  });

  final String image;
  final String degree;
  final String institution;
  final String year;
  final String location;
  final List<String> relevantCoursework;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          // height: ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    institution,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    image,
                    height: 75,
                    // width: 25,
                  ),
                ],
              ),
              Text(
                degree,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                '($year | $location)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Relevant Coursework',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface,
                thickness: 0.5,
                endIndent: 100,
              ),
              for (var rel in relevantCoursework)
                Column(
                  children: [
                    Text(
                      '\u2022 $rel',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
