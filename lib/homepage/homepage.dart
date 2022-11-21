import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoTextController = useTextEditingController();
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            children: [
              const Title(),
              TextField(
                controller: todoTextController,
                decoration: const InputDecoration(
                  labelText: 'What to do?',
                ),
                onSubmitted: (value) {},
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'todos',
          style: TextStyle(
            fontSize: 86,
            fontWeight: FontWeight.w100,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.done,
            size: 86,
          ),
        ),
      ],
    );
  }
}
