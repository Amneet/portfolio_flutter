import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri emailUrl = Uri.parse(
        'mailto:amXXXXXXXXXXX98@gmail.com'); //iOS simulators dont have default email and phone apps and hence this would not work for iOS simulators
    final Uri linkedInUrl =
        Uri.parse('https://www.linkedin.com/in/amneetsingh17/');
    final Uri telLink = Uri.parse('tel:+1-34X-XXX-XX45');

    final Uri locationUrl =
        Uri.parse('https://maps.app.goo.gl/u1WPApMWaJhrb6sS9');

    Future<void> sendEmail() async {
      if (!await launchUrl(emailUrl)) {
        throw Exception(
            'Something unexpected happened! Please try again later.');
      }
    }

    Future<void> openLinkedIn() async {
      if (!await launchUrl(linkedInUrl)) {
        throw Exception(
            'Something unexpected happened! Please try again later.');
      }
    }

    Future<void> tel() async {
      if (!await launchUrl(telLink)) {
        throw Exception(
            'Something unexpected happened! Please try again later.');
      }
    }

    Future<void> openLocation() async {
      if (!await launchUrl(locationUrl)) {
        throw Exception(
            'Something unexpected happened! Please try again later.');
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  InkWell(
                    onTap: sendEmail,
                    child: Text(
                      'amXXXXXXXXXXX98@gmail.com',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: tel,
                    child: Text(
                      '+1-(34X)-XXX-XX45',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.blue,
                  ),
                  InkWell(
                    onTap: openLinkedIn,
                    child: Text(
                      'AmneetSingh17',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.pin_drop,
                    color: Colors.green,
                  ),
                  InkWell(
                    onTap: openLocation,
                    child: Text(
                      'Ottawa, Ontario, Canada',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
