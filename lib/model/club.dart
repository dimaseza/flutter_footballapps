part of 'models.dart';

class Club extends Equatable {
  final String idTeam;
  final String nameTeam;
  final String badgeTeam;

  Club(
      {@required this.idTeam,
      @required this.nameTeam,
      @required this.badgeTeam});

  factory Club.fromJson(Map<String, dynamic> json) => Club(
      idTeam: json['idTeam'],
      nameTeam: json['strTeam'],
      badgeTeam: json['strTeamBadge']);

  @override
  List<Object> get props => [idTeam, nameTeam, badgeTeam];
}
