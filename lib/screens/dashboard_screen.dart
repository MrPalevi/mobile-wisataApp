import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisata_app/helper/session_manager.dart';
import 'package:wisata_app/screens/lodging_screen.dart';
import 'package:wisata_app/screens/main_screen.dart';
import 'package:wisata_app/screens/news_screen.dart';
import 'package:wisata_app/screens/ticket_screen.dart';
import 'package:wisata_app/utils/contants.dart';
import 'package:wisata_app/widgets/button_nav_bar.dart';
import 'package:wisata_app/widgets/category_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<void> checkLoginStatus(BuildContext context) async {
    await SessionManager().checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    checkLoginStatus(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const ButtonNavBar(selectedMenu: MenuState.home),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: bgLightColor,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/bg-dashboard.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      width: 52,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  const Text("Good Morning \nHappy People",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: textLightColor,
                      )),
                  SizedBox(height: size.height * .03),
                  const SearchBar(),
                  SizedBox(height: size.height * .03),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Vacation",
                          imgSrc: "assets/icons/vacation.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MainScreen();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "News",
                          imgSrc: "assets/icons/news.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return newsScreen();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Ticket",
                          imgSrc: "assets/icons/ticket.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ticketScreen();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Lodging",
                          imgSrc: "assets/icons/lodging.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return lodgingScreen();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
