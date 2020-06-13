part of 'widgets.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final Function onTap;

  CountryCard(this.country, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: 100,
        height: 140,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: country.badgeLeague,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                placeholder: (context, url) => SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                ),
                errorWidget: (context, url, erro) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                country.nameLeague,
                style: blackTextFont.copyWith(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
