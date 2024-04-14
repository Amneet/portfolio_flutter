import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/accordion.dart';
import 'package:portfolio/providers/skills_provider.dart';

class SkillsScreen extends ConsumerStatefulWidget {
  const SkillsScreen({super.key});

  @override
  ConsumerState<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends ConsumerState<SkillsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final skillsData = ref.watch(skillsProvider);
    print(skillsData);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Theme.of(context).colorScheme.onSurface,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 3.0),
              ),
            ),
            tabs: const [
              Tab(
                text: 'Professional Skills',
                icon: Icon(Icons.laptop),
              ),
              Tab(
                text: 'Interpersonal Skills',
                icon: Icon(Icons.person),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      for (var i = 0; i < skillsData.length; i++)
                        if(skillsData[i].professional == true)
                          Accordion(
                            title: skillsData[i].title,
                            body: skillsData[i].body,
                            icon: skillsData[i].icon,
                          ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (var i = 0; i < skillsData.length; i++)
                        if(skillsData[i].professional != true)
                          Accordion(
                            title: skillsData[i].title,
                            body: skillsData[i].body,
                            icon: skillsData[i].icon,
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
