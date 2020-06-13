part of 'pages.dart';

class ClubPage extends StatefulWidget {
  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  String countryValue = "Italy";
  bool isPressed = false;

  List<String> countryName = ["England", "Italy", "Spain", "Indonesia"];

  @override
  Widget build(BuildContext context) {
    List<Country> country;
    return ListView(
      children: <Widget>[
        // note: HEADER
        Container(
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Selamat Datang Fans!",
                style: whiteTextFont.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Salam Olahraga!",
                style: whiteTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        // note: LIST LEAGUE
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "League",
                  style: blackTextFont.copyWith(
                      fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  style: blueTextFont.copyWith(fontSize: 16),
                  iconSize: 16,
                  value: countryValue,
                  onChanged: (text) async {
                    setState(() {
                      countryValue = text;
                    });
                    // TO GET VALUE OF COUNTRY OR REQUEST TO API WHEN HIT THE VALUE IN DROPDOWN
                    await CountryServices.getCountryLeague(countryValue);
                  },
                  items: countryName.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: CountryServices.getCountryLeague(countryValue),
            builder: (_, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                country = snapshot.data;
                return SizedBox(
                  height: 140,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: country.length,
                      itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? defaultMargin : 0,
                              right: (index == country.length - 1)
                                  ? defaultMargin
                                  : 16),
                          child: CountryCard(
                            country[index],
                          ))),
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            })
      ],
    );
  }
}
