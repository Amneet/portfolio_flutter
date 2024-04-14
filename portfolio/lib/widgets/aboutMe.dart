import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Professional Summary',
              style: TextStyle(
                fontSize: 20,
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
            const Text(
              'A programming enthusiast with 3+ years of hands-on technical experience in design, development, and implementation of mobile and web applications using Flutter, React Native, ReactJS, NodeJS, Dart and Object Oriented JavaScript. Fast learner, self-motivated and dedicated engineer with an interest in analyzing, improving, and writing code. Passionate about building world class software applications. Professionally qualified individual with proven team-management and leadership skills.',
              style: TextStyle(fontSize: 15, height: 1.65),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Languages',
              style: TextStyle(
                fontSize: 20,
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        style: BorderStyle.solid,
                      )),
                  child: const Text('English'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        style: BorderStyle.solid,
                      )),
                  child: const Text('Hindi'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        style: BorderStyle.solid,
                      )),
                  child: const Text('Punjabi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
