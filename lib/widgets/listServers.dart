// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/data/class_server_info.dart';
import 'package:rust_controll/data/sharedPref.dart';
import 'package:rust_controll/widgets/serverCard.dart';

class ListServers extends StatefulWidget {
  const ListServers({Key? key}) : super(key: key);

  @override
  _ListServersState createState() => _ListServersState();
}

class _ListServersState extends State<ListServers> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Servers List",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: CustomCarouselFB2(),
          )
        ],
      ),
    );
  }
}

class CustomCarouselFB2 extends StatefulWidget {
  const CustomCarouselFB2({Key? key}) : super(key: key);

  @override
  _CustomCarouselFB2State createState() => _CustomCarouselFB2State();
}

class _CustomCarouselFB2State extends State<CustomCarouselFB2> {
  loadSharedPrefsAllServers() async {
    SharedPref sharedPref = SharedPref();
    Server serverload = Server();
    try {
      return await sharedPref.readAllServers();
    } catch (Excepetion) {
      print(Excepetion);
      return {};
    }
  }

  List<Widget> cards = [];

  final double carouselItemMargin = 16;

  late PageController _pageController;
  int _position = 0;

  // создание массива карточек серверов
  loadServers() async {
    var obg = await loadSharedPrefsAllServers();
    print(obg);
    setState(() {
      cards = [
        for (var i in obg.keys)
          CardFb1(
            text: obg['$i']['server name'],
            serverID: obg['$i']['server id'],
            imageUrl:
                "https://pbs.twimg.com/profile_images/798188546968481792/-kMkEAbB.jpg",
            statusOnline: true,
          )
      ];
    });
  }

  @override
  void initState() {
    super.initState();

    print("object");
    loadServers();
    _pageController = PageController(initialPage: 0, viewportFraction: .7);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: cards.length,
        onPageChanged: (int position) {
          setState(() {
            _position = position;
          });
        },
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        });
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Container(
          margin: EdgeInsets.all(carouselItemMargin),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: widget,
          ),
        );
      },
      child: Container(
        child: cards[position],
      ),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  final String serverID;
  final String imageUrl;
  final bool statusOnline;

  const CardFb1(
      {required this.text,
      required this.serverID,
      required this.imageUrl,
      required this.statusOnline,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServerCard(serverIndex: serverID),
          ),
        );
      },
      child: Container(
        width: 250,
        height: 330,
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.cyan, Colors.white]),
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 90, fit: BoxFit.cover),
            const SizedBox(
              height: 15,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const Spacer(),
            Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(10, 20),
                      blurRadius: 10,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.05)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  statusOnline == true
                      ? const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 8,
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 8,
                        ),
                  const SizedBox(width: 15),
                  Text(
                    statusOnline == true ? "Онлайн" : "Оффлайн",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
