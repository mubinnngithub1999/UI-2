import 'package:flutter/material.dart';
import 'dart:ui';
import 'fruits.dart';
import 'info.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _selectedPage = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
    super.initState();
  }

  void _onChanged(int pageNum) {
    setState(
      () {
        _selectedPage = pageNum;
        if (pageController.hasClients) {
          pageController.animateToPage(pageNum,
              duration: const Duration(milliseconds: 700),
              curve: Curves.decelerate);
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Ashna',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Expanded(child: Container()),
                    const Icon(Icons.search)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.dehaze_outlined,
                          size: 28,
                        ),
                      ),
                      TabBar(
                        title: 'Fruits',
                        pageNum: 0,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          setState(() {
                            _onChanged(0);
                          });
                        },
                      ),
                      TabBar(
                        title: 'Vegtables',
                        selectedPage: _selectedPage,
                        pageNum: 1,
                        onPressed: () {
                          setState(() {
                            _onChanged(1);
                          });
                        },
                      ),
                      TabBar(
                        title: 'Foods',
                        selectedPage: _selectedPage,
                        pageNum: 2,
                        onPressed: () {
                          setState(() {
                            _onChanged(2);
                          });
                        },
                      ),
                      TabBar(
                        title: 'Desserts',
                        selectedPage: _selectedPage,
                        pageNum: 3,
                        onPressed: () {
                          setState(() {
                            _onChanged(3);
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _selectedPage = value;
                });
              },
              controller: pageController,
              children: [
                SizedBox(
                  child: ListView.builder(
                    itemCount: fruits.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, index) => Cards(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => FruitScreen(
                              title: fruits[index].title,
                              price: fruits[index].price,
                              imgURL: fruits[index].imgURL,
                              bgColor: fruits[index].cardColor,
                            ),
                          ),
                        );
                      },
                      cardColor: fruits[index].cardColor,
                      bgColor: fruits[index].bgColor,
                      imgUrl: fruits[index].imgURL,
                      fruitTitle: fruits[index].title,
                      price: fruits[index].price,
                    ),
                    // Cards(
                    //   bgColor: Color(0xffFFD981),
                    //   cardColor: Color(0xff43A99B),
                    //   imgUrl: 'images/ava.png',
                    //   fruitTitle: 'AVOCADO',
                    //   price: 15.7,
                    // ),
                    // Cards(
                    //   bgColor: Color(0xff43A99B),
                    //   cardColor: Color(0xfffea7b6),
                    //   imgUrl: 'images/pea.png',
                    //   fruitTitle: 'PEACH',
                    //   price: 15.7,
                    // ),
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                    itemCount: vegtables.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, index) => Cards(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => FruitScreen(
                              title: vegtables[index].title,
                              price: vegtables[index].price,
                              imgURL: vegtables[index].imgURL,
                              bgColor: vegtables[index].cardColor,
                            ),
                          ),
                        );
                      },
                      cardColor: vegtables[index].cardColor,
                      bgColor: vegtables[index].bgColor,
                      imgUrl: vegtables[index].imgURL,
                      fruitTitle: vegtables[index].title,
                      price: vegtables[index].price,
                    ),
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                    itemCount: vegtables.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, index) => Cards(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => FruitScreen(
                              title: foods[index].title,
                              price: foods[index].price,
                              imgURL: foods[index].imgURL,
                              bgColor: foods[index].cardColor,
                            ),
                          ),
                        );
                      },
                      cardColor: foods[index].cardColor,
                      bgColor: foods[index].bgColor,
                      imgUrl: foods[index].imgURL,
                      fruitTitle: foods[index].title,
                      price: foods[index].price,
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Expanded(
                      child: Center(
                        child: Text('Desserts'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final Color bgColor;
  final Color cardColor;
  final String imgUrl;
  final String fruitTitle;
  final double price;
  final VoidCallback onTap;

  const Cards(
      {Key? key,
      required this.bgColor,
      required this.cardColor,
      required this.imgUrl,
      required this.fruitTitle,
      required this.price,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 0;
    fruitTitle == 'cucumber' ? height = 130 : height = 100;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 3.75,
        color: bgColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fruitTitle,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text('\$$price',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                      ]),
                  Image.asset(
                    imgUrl,
                    height: 130,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  final String title;
  final int selectedPage;
  final int pageNum;
  final VoidCallback onPressed;

  const TabBar({
    Key? key,
    required this.title,
    required this.selectedPage,
    required this.pageNum,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'cal',
                  letterSpacing: 2,
                  color:
                      selectedPage == pageNum ? Colors.black : Colors.black54,
                  fontWeight: selectedPage == pageNum ? FontWeight.w700 : null),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              height: 9,
              width: 6,
              decoration: BoxDecoration(
                color:
                    selectedPage == pageNum ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
