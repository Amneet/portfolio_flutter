import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/providers/profile_image_provider.dart';
import 'package:portfolio/screens/education.dart';
import 'package:portfolio/screens/experience.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:portfolio/screens/skills.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileImage = ref.watch(profileImageProvider);
    Widget activePage = const HomepageScreen();
    var activePageTitle = 'Amneet Singh';

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Skills';
      activePage = const SkillsScreen();
    } else if (_selectedPageIndex == 2) {
      activePageTitle = 'Experience';
      activePage = const ExperienceScreen();
    } else if (_selectedPageIndex == 3) {
      activePageTitle = 'Education';
      activePage = const EducationScreen();
    } else {
      activePage = const HomepageScreen();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(
          activePageTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            SizedBox(
              height: 275,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer),
                  accountName: Text(
                    "Amneet Singh",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  accountEmail: Text(
                    "amXXXXXXXXXXX98@gmail.com",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  currentAccountPictureSize: const Size.square(75),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: profileImage,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                _selectPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Skills'),
              onTap: () {
                _selectPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Experience'),
              onTap: () {
                _selectPage(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.graduationCap),
              title: const Text('Education'),
              onTap: () {
                _selectPage(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: activePage,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.boy), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.laptop), label: 'Skills'),
            BottomNavigationBarItem(
                icon: Icon(Icons.work), label: 'Experience'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.graduationCap), label: 'Education'),
          ],
        ),
      ),
    );
  }
}
