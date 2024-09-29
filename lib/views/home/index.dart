import 'package:code_app/utils/device.dart';
import 'package:flutter/material.dart';

import '../../components/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            // unlabeledTabIndicatorColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        Container(
          height: DeviceUtils.getScreenSize(context).height,
          width: DeviceUtils.getScreenSize(context).width,
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('Content of Tab 1')),
              Center(child: Text('Content of Tab 2')),
              Center(child: Text('Content of Tab 3')),
            ],
          ),
        ),
      ],
    );
  }
}
