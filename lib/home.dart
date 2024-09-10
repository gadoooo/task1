import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int _index = 0;
  List<Widget> pages = [
    Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/img3.jpeg",
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Listen Anywhere',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Favorite tunes follow, anytime, anywhere. Worry-free offline playback for your journey.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/img2.jpeg",
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Playback',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pristine sound quality for absolute clarity in audio playback.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/img1.jpeg",
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Music for All',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Curated weekly playlists tailored to your music listening history.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // عرض الصفحات مع الصور
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index],
                onPageChanged: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                controller: _pageController,
              ),
            ),
            // الأزرار الدائرية الصغيرة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _index == index ? Colors.green : Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // زر الاستمرار
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_index == pages.length - 1) {
                    _pageController.jumpToPage(0);
                  } else {
                    _pageController.jumpToPage(++_index);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // لون الزر
                  minimumSize: Size(double.infinity, 50), // العرض
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // حواف دائرية
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
