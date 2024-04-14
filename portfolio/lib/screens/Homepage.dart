import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/widgets/Contact.dart';
import 'package:portfolio/widgets/aboutMe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/providers/profile_image_provider.dart';

class HomepageScreen extends ConsumerStatefulWidget {
  const HomepageScreen({super.key});

  @override
  ConsumerState<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends ConsumerState<HomepageScreen> {
  // File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
      maxWidth: 600,
    ); //ImageSource.gallery can be used if you want to select a picture from gallery

    if (pickedImage == null) {
      return;
    }

    ref
        .watch(profileImageProvider.notifier)
        .changeProfilePicture(FileImage(File(pickedImage.path)));
    // setState(() {
    // });
  }

  @override
  Widget build(BuildContext context) {
    final profileImage = ref.watch(profileImageProvider);
    void aboutMeSection() {
      showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (ctx) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              height: double.infinity,
              width: double.infinity,
              child: const AboutMe(),
            );
          });
    }

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                // height: 231.6, //my image's size
                child: const Image(
                  image: AssetImage(
                    'assets/images/banner.jpg',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        Row(
                          children: [
                            Text(
                              'Amneet Singh',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '(He/Him)',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Software Developer',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Web Developer at the University of Ottawa\'s Faculty of Medicine | Ex-Webmaster at Professional Development Club, uOttawa | Former SDET at MakeMyTrip India',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                          ),
                          onPressed: aboutMeSection,
                          child: Text(
                            'About me',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.onSurface,
                          thickness: 0.5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Expanded(
                          child: Contact(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 25,
            top: 166.6, // (background container size) - (circle height / 2)
            child: Container(
              height: 130.0,
              width: 130.0,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundImage: profileImage,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.camera,
                          color: Theme.of(context).colorScheme.surface,
                          size: 15,
                        ),
                        onPressed: _takePicture,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
