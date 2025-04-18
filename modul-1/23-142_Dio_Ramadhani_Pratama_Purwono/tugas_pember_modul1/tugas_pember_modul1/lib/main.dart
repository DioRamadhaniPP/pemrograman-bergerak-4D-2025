import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Paket untuk menggunakan font dari Google Fonts

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Warna latar belakang
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // Efek bouncing saat scroll
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header bagian atas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, User',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Avatar pengguna dengan border hijau
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 3),
                      ),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(
                          'assets/images/GambarUser.jpeg',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Section untuk "Hot Places"
                sectionHeader(title: "Hot Places"),
                SizedBox(height: 12),

                // List horizontal untuk hot place cards
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      hotPlaceCard(
                        context,
                        "National Park Yosemite",
                        "California",
                        'assets/images/GambarPemandangan.jpeg',
                      ),
                      hotPlaceCard(
                        context,
                        "National Park Yosemite",
                        "California",
                        'assets/images/GambarPemandangan.jpeg',
                      ),
                      hotPlaceCard(
                        context,
                        "National Park Yosemite",
                        "California",
                        'assets/images/GambarPemandangan.jpeg',
                      ),
                      hotPlaceCard(
                        context,
                        "National Park Yosemite",
                        "California",
                        'assets/images/GambarPemandangan.jpeg',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Section untuk "Best Hotels"
                sectionHeader(title: "Best Hotels"),
                SizedBox(height: 12),

                // List vertikal untuk hotel cards
                Column(
                  children: List.generate(
                    8,
                    (index) => hotelCard(
                      context,
                      "National Park Yosemite",
                      'assets/images/GambarPemandangan.jpeg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk judul section
  Widget sectionHeader({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('See All', style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  // Widget untuk card tempat wisata (Hot Place)
  Widget hotPlaceCard(
    BuildContext context,
    String name,
    String location,
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke DetailPage saat card ditekan
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(title: name, imagePath: imagePath),
          ),
        );
      },
      child: Container(
        width: 320,
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.room, size: 14, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk card hotel
  Widget hotelCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail saat hotel card diklik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(title: title, imagePath: imagePath),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit.Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman detail yang akan ditampilkan saat user mengklik salah satu card
class DetailPage extends StatelessWidget {
  final String title;
  final String imagePath;

  const DetailPage({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Text(
              "Yosemite National Park adalah salah satu taman nasional paling ikonik di Amerika Serikat, terkenal dengan lembah granitnya yang spektakuler, air terjun yang menjulang tinggi, dan hutan pinus yang rimbun. Taman ini menjadi tujuan utama bagi para pecinta alam, pendaki, fotografer, dan pelancong yang ingin merasakan kedamaian alam liar California. Di musim semi, air terjun mengalir dengan deras, menciptakan pemandangan yang memukau, sementara musim gugur membawa warna-warni daun yang mempesona. Selain itu, pengunjung juga dapat menikmati berbagai jalur hiking, camping, dan melihat satwa liar seperti rusa dan beruang hitam. Dengan keindahan yang luar biasa dan ketenangan yang ditawarkannya, Yosemite adalah tempat yang wajib dikunjungi setidaknya sekali seumur hidup.",
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
