part of 'services.dart';

class CountryServices {
  static Future<List<Country>> getCountryLeague(String country,
      {http.Client client}) async {
    String url =
        "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=$country&s=Soccer";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    var data = jsonDecode(response.body);
    List countrys = data['countrys'];

    return countrys.map((e) => Country.fromJson(e)).toList();
  }

  static Future<List<Club>> getClub(Country country,
      {http.Client client}) async {
    String url =
        "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=${country.idLeague}";

    client ??= http.Client();

    var response = await client.get(url);
    var data = jsonDecode(response.body);

    List club = data['teams'];

    return club.map((e) => Club.fromJson(e)).toList();
  }
}
