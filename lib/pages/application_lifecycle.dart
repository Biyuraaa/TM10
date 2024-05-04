import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ApplicationLifecycle extends StatefulWidget {
  const ApplicationLifecycle({super.key});

  @override
  State<ApplicationLifecycle> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ApplicationLifecycle>
    with WidgetsBindingObserver {
  final logger = Logger();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.i("object: $state");
    switch (state) {
      case AppLifecycleState.resumed:
        logger.i("resumed");
        break;
      case AppLifecycleState.inactive:
        logger.i("inactive");
        break;
      case AppLifecycleState.paused:
        logger.i("paused");
        break;
      case AppLifecycleState.detached:
        logger.i("detached");
        break;
      default:
        logger.i("Unhandled state: $state");
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Application Lifecycle',
        ),
      ),
    );
  }
}
