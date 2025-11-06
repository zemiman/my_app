import 'package:flutter/material.dart';
import 'package:my_app/pages/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
  void setupWorldTime() async {
    WorldTime worldTimeInstance = WorldTime(
      location: 'Berlin',
      flag: 'germany.png',
      url: 'europe/Berlin',
    );
    await worldTimeInstance.getTime();
    print(worldTimeInstance.time);
    setState(() {
      time = worldTimeInstance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(50), child: Text(time)),
    );
  }
}
