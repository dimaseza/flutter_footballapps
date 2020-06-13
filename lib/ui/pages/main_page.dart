part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isNotRank;

  MainPage({this.bottomNavBarIndex = 0, this.isNotRank = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: mainColor,
        ),
        SafeArea(
            child: Container(
          color: Color(0xFFF6F7F9),
        )),
        PageView(
          controller: pageController,
          children: <Widget>[ClubPage(), Container()],
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
        ),
        createCustomBottomNavBar(),
      ],
    ));
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.all(24),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: BottomNavigationBar(
            selectedItemColor: mainColor,
            unselectedItemColor: Color(0xFFE5E5E5),
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: bottomNavBarIndex,
            onTap: (index) {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                  title: Text("Home",
                      style: GoogleFonts.montserrat(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 0)
                          ? "assets/icon_home_active.png"
                          : "assets/icon_home.png"))),
              BottomNavigationBarItem(
                  title: Text("Table Rank",
                      style: GoogleFonts.montserrat(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 1)
                          ? "assets/icon_rank_active.png"
                          : "assets/icon_rank.png")))
            ],
          ),
        ),
      );
}
