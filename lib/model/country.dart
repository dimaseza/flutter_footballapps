part of 'models.dart';

class Country extends Equatable {
  final String idLeague;
  final String nameLeague;
  final String badgeLeague;

  Country(
      {@required this.idLeague,
      @required this.nameLeague,
      @required this.badgeLeague});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      idLeague: json['idLeague'],
      nameLeague: json['strLeague'],
      badgeLeague: json['strBadge']);

  @override
  List<Object> get props => [idLeague, nameLeague];
}
