import 'package:flutter/material.dart';

void main() {
  runApp(ShootingScoreApp());
}

class ShootingScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skyteresultater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScoreEntryScreen(),
    );
  }
}

class ScoreEntryScreen extends StatefulWidget {
  @override
  _ScoreEntryScreenState createState() => _ScoreEntryScreenState();
}

class _ScoreEntryScreenState extends State<ScoreEntryScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController clubController = TextEditingController();
  final List<List<TextEditingController>> scoreControllers =
      List.generate(10, (_) => List.generate(4, (_) => TextEditingController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrer skyteresultater')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Navn'),
            ),
            TextField(
              controller: clubController,
              decoration: InputDecoration(labelText: 'Skytterlag'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Serie ${index + 1}'),
                      Row(
                        children: List.generate(4, (shotIndex) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                controller: scoreControllers[index][shotIndex],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(hintText: '0-10'),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Simpel bekreftelse for testing
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Resultater lagret (testmodus)')),
                );
              },
              child: Text('Lagre (Testmodus)'),
            ),
          ],
        ),
      ),
    );
  }
}
