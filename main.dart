import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';
import 'dart:ui';

void main() {
  runApp(PastScapeApp());
}

class PastScapeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromARGB(255, 84, 34, 223),
      ),
      home: SplashScreen(),
    );
  }
}

// ---------------- SPLASH ----------------
// ---------------- SPLASH ----------------
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background3.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 App Name + Tagline (slightly up)
          Align(
            alignment: Alignment(0, -0.1), // 🔥 move upward
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // 🔹 App Name
                Text(
                  "PastScape",
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // 🔹 Tagline
                Text(
                  "Step into history, feel the past",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontStyle: FontStyle.italic, 
                    letterSpacing: 1,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- LOGIN ----------------
class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void login(BuildContext context) {
    if (emailController.text == "admin@gmail.com" &&
        passController.text == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Email or Password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background1.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Light Transparent Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 Login Form
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // 🔹 Title
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      // 🔹 Email
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 15),

                      // 🔹 Password
                      TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 20),

                      // 🔹 Login Button
                      ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50),
    backgroundColor: Color.fromARGB(255, 84, 34, 223),
  ),
  onPressed: () => login(context),
  child: Text(
    "LOGIN",
    style: TextStyle(
      fontWeight: FontWeight.w900,   // 🔥 extra bold
      fontSize: 18,                  // 🔥 bigger text
      color: Colors.white,           // 🔥 ensure visibility
      letterSpacing: 1.2,            // 🔥 spaced letters
    ),
  ),
),
                      SizedBox(height: 15),

                      // 🔹 Signup Navigation
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SignupPage()),
                          );
                        },
                        child: Text(
                          "If you don't have account? Signup",
                          style: TextStyle(
                            color: Color.fromARGB(255, 84, 34, 223),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- SIGNUP ----------------
class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background1.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Light Transparent Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 Signup Form
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // 🔹 Title
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      // 🔹 Name
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 15),

                      // 🔹 Email
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 15),

                      // 🔹 Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 25),

                      // 🔹 Sign Up Button
                      ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50),
    backgroundColor: Color.fromARGB(255, 84, 34, 223),
  ),
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  },
  child: Text(
    "SIGN UP",
    style: TextStyle(
      fontWeight: FontWeight.w900,   // 🔥 extra bold
      fontSize: 18,                  // 🔥 bigger text
      color: Colors.white,           // 🔥 ensure visibility
      letterSpacing: 1.2,            // 🔥 spaced letters
    ),
  ),
),
  
                      SizedBox(height: 15),

                      // 🔹 Back to Login
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have account? Login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 84, 34, 223),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ---------------- HOME ----------------
class HomePage extends StatelessWidget {
  final monuments = [
    {"name": "Pattadakalu", "img": "assets/images/pattadakalu.jpeg"},
    {"name": "Bijapur", "img": "assets/images/bijapur.jpg"},
    {"name": "Hampi", "img": "assets/images/hampi.jpg"},
    {"name": "Ihole", "img": "assets/images/ihole.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
  title: Text("PastScape"),
  backgroundColor: Color.fromARGB(255, 84, 34, 223),

  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(
          context: context,
          delegate: MonumentSearch(),
        );
      },
    ),
  ],
),

      body: ListView.builder(
        itemCount: monuments.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(monuments[index]["name"]!),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(monuments[index]["img"]!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  monuments[index]["name"]!,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- SEARCH ----------------
class MonumentSearch extends SearchDelegate {
  final List<String> monuments = [
    "Pattadakalu",
    "Bijapur",
    "Hampi",
    "Ihole"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = monuments
        .where((m) => m.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results
          .map((e) => ListTile(
                title: Text(e),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(e),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}

// ---------------- APP DRAWER ----------------
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          // 🔹 HEADER
          UserAccountsDrawerHeader(
            accountName: Text("Birnitha N"),
            accountEmail: Text("birnitha41@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
          ),

          // 🔹 HOME
          drawerItem(context, Icons.home, "Home", HomePage()),

          // 🔹 PROFILE
          drawerItem(context, Icons.person, "Profile", ProfilePage()),

          // 🔹 PREMIUM
          drawerItem(context, Icons.star, "Premium", PremiumPage()),

          // 🔹 DOWNLOADS
          drawerItem(context, Icons.download, "Downloads", DownloadPage()),

          // 🔹 SETTINGS
          drawerItem(context, Icons.settings, "Settings", SettingsPage()),

          // 🔹 HELP
          drawerItem(context, Icons.help, "Help", HelpPage()),

          Divider(),

          // 🔹 LOGOUT
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}

  // 🔹 DATA FOR EACH MONUMENT
// ---------------- DETAIL ----------------
class DetailPage extends StatelessWidget {
  final String name;
  DetailPage(this.name);

  // 🔹 DATA FOR EACH MONUMENT
  final Map<String, Map<String, String>> monumentData = {
    "Pattadakalu": {
      "img": "assets/images/pattadakalu.jpeg",
      "desc": """Pattadakal, a UNESCO World Heritage Site in Karnataka, India, is renowned for its stunning temples that showcase a harmonious blend of northern and southern Indian architectural styles from the 7th and 8th centuries.

Historical Significance:
Pattadakal, also known as "the stone of coronation," served as a ceremonial capital for the Chalukya dynasty.

Architectural Features:
The site features Hindu temples and a Jain sanctuary with intricate carvings of Ramayana & Mahabharata.

Cultural Importance:
Hosts Pattadakal Dance Festival.

Best Time to Visit:
October to March."""
    },

    "Bijapur": {
      "img": "assets/images/bijapur.jpg",
      "desc": """Bijapur, a historic city in Karnataka, is home to the magnificent Gol Gumbaz, one of the largest domed structures in the world.

Highlights:
✔ Abbey Falls
✔ Raja's Seat
✔ Coffee Estates

Culture:
Home of Kodava community.

Best Time:
October to March."""
    },

    "Hampi": {
      "img": "assets/images/hampi.jpg",
      "desc": """Hampi, a UNESCO World Heritage Site in Karnataka, is renowned for its ancient ruins and historical significance.

Historical Significance:
Hampi was the capital of the Vijayanagara Empire.

Architectural Features:
The site features temples, palaces, and marketplaces with intricate carvings.

Cultural Importance:
Hosts annual Hampi Festival.

Best Time to Visit:
October to March."""
    },

    "Ihole": {
      "img": "assets/images/ihole.jpg",
      "desc": """Ihole is a scenic hill station in Karnataka known for its natural beauty and tranquility.

Highlights:
✔ Waterfalls
✔ Trekking Trails
✔ Tea Gardens

Culture:
Home of Tulu community.

Best Time:
October to March.
    },
  };

Illuminated during Dasara.

Best Time:
Evening visit."""
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = monumentData[name]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromARGB(255, 84, 34, 223),
      ),
      drawer: AppDrawer(),

      // ❌ NO BACKGROUND IMAGE NOW
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            // 🔹 IMAGE CARD
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(data["img"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 10),

            // 🔹 TITLE
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // 🔹 DESCRIPTION
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    data["desc"]!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            // 🔹 BUTTON ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconButton(context, Icons.audiotrack, AudioPage()),
                iconButton(context, Icons.video_collection, VideoPage()),
                iconButton(context, Icons.view_in_ar, ModelPage()),
                iconButton(context, Icons.extension, PuzzlePage()),
              ],
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget iconButton(BuildContext context, IconData icon, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Color.fromARGB(255, 84, 34, 223),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

// ---------------- Audio ----------------
class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((d) {
      setState(() => duration = d);
    });

    player.onPositionChanged.listen((p) {
      setState(() => position = p);
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });
  }

  Future<void> playPause() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(AssetSource('audio/pattadakalu.mp3'));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  // 🔹 forward 10 sec
  void forward() async {
    final newPos = position + Duration(seconds: 10);
    await player.seek(newPos);
  }

  // 🔹 backward 10 sec
  void backward() async {
    final newPos = position - Duration(seconds: 10);
    await player.seek(newPos);
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes);
    final seconds = twoDigits(d.inSeconds % 60);
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Audio Guide")),

      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background2.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 Main UI
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon(Icons.headphones, size: 90),

                    SizedBox(height: 20),

                    Text(
                      "Pattadakalu Audio Guide",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    // 🔹 Slider
                    Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds
                          .toDouble()
                          .clamp(0, duration.inSeconds.toDouble()),
                      onChanged: (value) async {
                        final newPosition =
                            Duration(seconds: value.toInt());
                        await player.seek(newPosition);
                      },
                    ),

                    // 🔹 Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(position)),
                        Text(formatTime(duration)),
                      ],
                    ),

                    SizedBox(height: 20),

                    // 🔹 Controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        IconButton(
                          icon: Icon(Icons.replay_10),
                          iconSize: 40,
                          onPressed: backward,
                        ),

                        IconButton(
                          icon: Icon(
                            isPlaying
                                ? Icons.pause_circle
                                : Icons.play_circle,
                          ),
                          iconSize: 70,
                          onPressed: playPause,
                        ),

                        IconButton(
                          icon: Icon(Icons.forward_10),
                          iconSize: 40,
                          onPressed: forward,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Video ----------------
class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset('assets/video/pattadakalu.mp4')
      ..initialize().then((_) {
        setState(() {});
        controller.setLooping(true);
        controller.play();
      });
  }

  @override
  void dispose() {
    controller.dispose(); // IMPORTANT
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video")),
      drawer: AppDrawer(),

      body: Center(
        child: controller.value.isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                  SizedBox(height: 20),

                  // PLAY / PAUSE BUTTON
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                      });
                    },
                    child: Icon(
                      controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

// ---------------- 3D Model ----------------
class ModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("3D View")),

      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background1.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 Images (COLUMN - NO SCROLL)
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // 🔹 Image 1
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("assets/images/pattadakalu.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // 🔹 Image 2
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("assets/images/pattadakalu1.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Puzzle ----------------
class PuzzlePage extends StatefulWidget {
  @override
  _PuzzlePageState createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  List<int> numbers = [];
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    numbers = List.generate(9, (index) => index);
    numbers.shuffle(Random());
  }

  void onTileTap(int index) {
    setState(() {
      if (selectedIndex == null) {
        selectedIndex = index;
      } else {
        // swap tiles
        int temp = numbers[selectedIndex!];
        numbers[selectedIndex!] = numbers[index];
        numbers[index] = temp;
        selectedIndex = null;

        checkWin();
      }
    });
  }

  void checkWin() {
    bool isSolved = true;
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] != i) {
        isSolved = false;
        break;
      }
    }

    if (isSolved) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("🎉 You Win!"),
          content: Text("Puzzle completed successfully!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  numbers.shuffle(Random());
                });
              },
              child: Text("Play Again"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Puzzle")),
      drawer: AppDrawer(),

      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Arrange numbers in order",
            style: TextStyle(fontSize: 18),
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTileTap(index),
                  child: Card(
                    color: selectedIndex == index
                        ? Colors.red
                        : Colors.deepPurple,
                    child: Center(
                      child: Text(
                        numbers[index].toString(),
                        style:
                            TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- FAVORITES ----------------
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      drawer: AppDrawer(),
      body: Center(child: Text("Saved Monuments")),
    );
  }
}

// ---------------- PROFILE ----------------
// ---------------- PROFILE ----------------
class ProfilePage extends StatelessWidget {
  final String name = "Birnitha N";
  final String email = "birnitha41@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color.fromARGB(255, 84, 34, 223),
      ),

      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background3.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 Profile Content
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // 🔹 Avatar
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),

                    SizedBox(height: 20),

                    // 🔹 Name
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    // 🔹 Email
                    Text(
                      email,
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    SizedBox(height: 30),

                    // 🔹 Membership
                    ListTile(
                      leading: Icon(Icons.star, color: Colors.deepPurple),
                      title: Text("Membership"),
                      subtitle: Text("Free User"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- PREMIUM ----------------
class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Premium")),

      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background2.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // 🔹 Main UI
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // 🔹 Title
                    Text(
                      "Unlock Premium Experience 🚀",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 15),

                    // 🔹 Features
                    Text(
                      "✔ Ad-free experience\n"
                      "✔ Exclusive monument content\n"
                      "✔ Offline access\n"
                      "✔ HD videos & audio\n"
                      "✔ Early access to AR features",
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 25),

                    // 🔹 Plan Card
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.deepPurple),
                      ),

                      child: Column(
                        children: [
                          Text(
                            "Monthly Plan",
                            style: TextStyle(fontSize: 18),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "₹99 / month",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),

                          SizedBox(height: 15),

  ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    minimumSize: Size(double.infinity, 50), // 🔥 full width + height
  ),
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("🎉 Premium Activated (Demo Mode)"),
      ),
    );
  },
  child: Text(
    "Subscribe Now",
    style: TextStyle(
      fontWeight: FontWeight.w900,   // 🔥 extra bold
      fontSize: 18,                  // 🔥 bigger
      color: Colors.white,           // 🔥 high contrast
      letterSpacing: 1.2,            // 🔥 spacing
      shadows: [
        Shadow(
          blurRadius: 3,
          color: Colors.black45,
          offset: Offset(1, 1),
        ),
      ],
    ),
  ),
),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ---------------- DOWNLOADS ----------------
class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Downloads")),
      drawer: AppDrawer(),
      body: Center(child: Text("No downloads found")),
    );
  }
}

// ---------------- LANGUAGE ----------------
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String lang = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Language")),
      drawer: AppDrawer(),

      body: Column(
        children: [
          RadioListTile(
            title: Text("English"),
            value: "English",
            groupValue: lang,
            onChanged: (value) {
              setState(() => lang = value.toString());
            },
          ),
          RadioListTile(
            title: Text("Kannada"),
            value: "Kannada",
            groupValue: lang,
            onChanged: (value) {
              setState(() => lang = value.toString());
            },
          ),
        ],
      ),
    );
  }
}

// ---------------- SETTINGS ----------------
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;
  double volume = 0.5;

  String language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Settings")),

      body: ListView(
        children: [

          SwitchListTile(
            title: Text("Notifications"),
            value: notifications,
            onChanged: (val) {
              setState(() => notifications = val);
            },
          ),

          SwitchListTile(
            title: Text("Dark Mode"),
            value: darkMode,
            onChanged: (val) {
              setState(() => darkMode = val);
            },
          ),

          ListTile(
            title: Text("Volume"),
            subtitle: Slider(
              value: volume,
              onChanged: (val) {
                setState(() => volume = val);
              },
            ),
          ),

          Divider(),

          ListTile(title: Text("Language")),

          RadioListTile(
            title: Text("English"),
            value: "English",
            groupValue: language,
            onChanged: (val) {
              setState(() => language = val.toString());
            },
          ),

          RadioListTile(
            title: Text("Kannada"),
            value: "Kannada",
            groupValue: language,
            onChanged: (val) {
              setState(() => language = val.toString());
            },
          ),
        ],
      ),
    );
  }
}

// ---------------- HELP ----------------
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Help")),

      body: ListView(
        children: [

          ListTile(
            title: Text("How to use the app?"),
            subtitle: Text("Select a monument and explore audio, video, and 3D."),
          ),

          ListTile(
            title: Text("Audio not playing?"),
            subtitle: Text("Check volume and internet."),
          ),

          ListTile(
            title: Text("Video not loading?"),
            subtitle: Text("Ensure correct file path."),
          ),

          ListTile(
            title: Text("Login issue?"),
            subtitle: Text("Try re-entering email and password."),
          ),
        ],
      ),
    );
  }
}