import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(
        fontFamily: 'Roboto', // set default font
        primarySwatch: Colors.teal, // set main color
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal, // set AppBar color
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            // The first horizontal scrolling ListView displays remote pictures
            Container(
              height: 200, // set height
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                  SizedBox(width: 8),
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                  SizedBox(width: 8),
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // add vertical spacing

            // ListTile widget, using different font variants
            ListTile(
              leading: Icon(Icons.star, color: Colors.teal),
              title: Text('Roboto Regular', style: TextStyle(fontFamily: 'Roboto')),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.pink),
              title: Text('Roboto Bold', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.thumb_up, color: Colors.blue),
              title: Text('Roboto Italic', style: TextStyle(fontFamily: 'Roboto', fontStyle: FontStyle.italic)),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: Text('A'),
              ),
              title: Text('Device Default Font'), // use the default font
            ),
            SizedBox(height: 16), // add vertical spacing

            // The second horizontal scrolling ListView displays local images
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.asset('images/image1.jpg', fit: BoxFit.cover),
                  SizedBox(width: 8),
                  Image.asset('images/image2.jpg', fit: BoxFit.cover),
                  SizedBox(width: 8),
                  Image.asset('images/image3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
