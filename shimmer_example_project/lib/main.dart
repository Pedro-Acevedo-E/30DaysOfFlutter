import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      routes: <String, WidgetBuilder>{
        'loading': (_) => const LoadingListPage(),
        'slide': (_) => SlideToUnlockPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Loading List'),
              onTap: () => Navigator.of(context).pushNamed('loading'),
            ),
            ListTile(
              title: const Text('Slide To Unlock'),
              onTap: () => Navigator.of(context).pushNamed('slide'),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: const SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Text("Shimmer", style: TextStyle(fontSize: 50),),
          )),
    );
  }
}

class SlideToUnlockPage extends StatelessWidget {
  final List<String> days = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  SlideToUnlockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final int hour = time.hour;
    final int minute = time.minute;
    final int day = time.weekday;
    final int month = time.month;
    final int dayInMonth = time.day;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide To Unlock'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            'https://e1.pxfuel.com/desktop-wallpaper/194/135/desktop-wallpaper-fire-backgrounds-for-background-api.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48.0,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10 ? '0$minute' : '$minute'}',
                    style: const TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                  const SizedBox(height: 300),
                  Stack(children: [
                    Image.network(
                      'https://www.pngaaa.com/api-download/2121306',
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                    Shimmer(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.purple.withOpacity(0.2), Colors.purple.withOpacity(0.7), Colors.purple.withOpacity(0.2)],
                        ),
                        child: Image.network(
                          'https://www.pngaaa.com/api-download/2121306',
                          height: 150.0,
                          fit: BoxFit.cover,
                        )
                    ),
                  ],),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 32.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 100,
                color: Colors.red,
                child: Center(
                  child: Opacity(
                    opacity: 0.8,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black12,
                      highlightColor: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Slide to unlock',
                            style: TextStyle(
                              fontSize: 28.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}