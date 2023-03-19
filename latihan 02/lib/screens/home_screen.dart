import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String description =
      "ketika seseoramng sedang melakukan sesuatu karena dorongan hatinya, bukan karena anjuran seseorang lainnya. Kedua, kata spontan diartikan sebagai wajar, bebas pengaruh dan tanpa pamrih. Sedangkan dalam bahasa gaul yang kerap kali disandingkan dengan kata uhuy, kata spontan tidak memiliki arti khusus";

  int likes = 0, share = 0, comment = 0;
  bool isLike = false, isLove = false;

  setLikes() {
    if (!isLike) {
      isLove = true;
      likes++;
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isLove = false;
        });
      });
    } else {
      likes--;
    }
    isLike = !isLike;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setLikes(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'uhuy',
                    child: Image.asset(
                      "assets/uhuy.jpg",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("HALLOO, SPONTANN!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  const Text("UHUUYYYYY"),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(description, textAlign: TextAlign.justify),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconListile(
                        onPressed: () => setLikes(),
                        icon: isLike
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                              ),
                        total: likes,
                        title: "Like",
                      ),
                    ],
                  )
                ],
              ),
              Visibility(
                visible: isLove,
                child: const Center(
                  child: Icon(Icons.favorite, color: Colors.red, size: 300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconListile extends StatelessWidget {
  Widget icon;
  String? title;
  int? total;
  void Function()? onPressed;

  IconListile(
      {super.key,
      required this.icon,
      this.title,
      this.total,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: icon,
          ),
          Text("$total $title"),
        ],
      ),
    );
  }
}
