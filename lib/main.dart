import 'package:flutter/material.dart';
import 'package:flutter_get_x_example/controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test app GetX Flutter',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              builder: (_) => Text(
                'clicks: ${controller.counter}',
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Next Route',
              ),
              onPressed: () => Get.to(Second()),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              heroTag: 'remove',
              child: const Icon(
                Icons.remove,
              ),
              onPressed: controller.decrement),
          FloatingActionButton(
            heroTag: 'add',
            child: const Icon(
              Icons.add,
            ),
            onPressed: controller.increment,
          ),
        ],
      ),
    );
  }
}

class Second extends StatelessWidget {
  final Controller ctrl = Get.find();

  Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${ctrl.counter}'),
      ),
    );
  }
}
