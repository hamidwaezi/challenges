import 'package:flutter/material.dart';
import 'package:flutter_starfield/painter.dart';

import 'star.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Star Field',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StarField());
  }
}

class StarField extends StatelessWidget {
  const StarField({super.key});
  final size = 500.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text('Flutter StarFiled', style: theme.headlineLarge),
              const SizedBox(
                height: 20,
              ),
              Text(
                'I attempt to program a "star field" or "warp speed" visualization in Processing.',
                style: theme.bodyMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: StreamBuilder<List<Star>>(
                    stream: updater(List<Star>.generate(
                        100, (i) => Star.make(10, size / 2))),
                    builder: (context, snapshot) {
                      return ClipRRect(
                        child: CustomPaint(
                          size: Size(size, size),
                          foregroundPainter: MyPainter(
                            stars: snapshot.data!,
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<Star>> updater(List<Star> stars) async* {
    while (true) {
      for (int i = 0; i < stars.length; i++) {
        final s = stars[i];
        stars[i] = s.update(15, size / 2);
      }
      await Future.delayed(const Duration(milliseconds: 10));
      yield stars;
    }
  }
}
