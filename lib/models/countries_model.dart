// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

CountriesModel countriesModelFromJson(String str) => CountriesModel.fromJson(json.decode(str));

String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());

class CountriesModel {
    CountriesModel({
        this.countries,
    });

    List<Country> countries;

    factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        countries: json["countries"] == null ? null : List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "countries": countries == null ? null : List<dynamic>.from(countries.map((x) => x.toJson())),
    };
}

class Country {
    Country({
        this.nameEn,
        this.teams,
    });

    String nameEn;
    List<Team> teams;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        nameEn: json["name_en"] == null ? null : json["name_en"],
        teams: json["teams"] == null ? [] : List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name_en": nameEn == null ? null : nameEn,
        "teams": teams == null ? [] : List<dynamic>.from(teams.map((x) => x.toJson())),
    };
}

class Team {
    Team({
        this.idTeam,
        this.idSoccerXml,
        this.idApIfootball,
        this.intLoved,
        this.strTeam,
        this.strTeamShort,
        this.strAlternate,
        this.intFormedYear,
        this.strSport,
        this.strLeague,
        this.idLeague,
        this.strLeague2,
        this.idLeague2,
        this.strLeague3,
        this.idLeague3,
        this.strLeague4,
        this.idLeague4,
        this.strLeague5,
        this.idLeague5,
        this.strLeague6,
        this.idLeague6,
        this.strLeague7,
        this.idLeague7,
        this.strDivision,
        this.strManager,
        this.strStadium,
        this.strKeywords,
        this.strRss,
        this.strStadiumThumb,
        this.strStadiumDescription,
        this.strStadiumLocation,
        this.intStadiumCapacity,
        this.strWebsite,
        this.strFacebook,
        this.strTwitter,
        this.strInstagram,
        this.strDescriptionEn,
        this.strDescriptionDe,
        this.strDescriptionFr,
        this.strDescriptionCn,
        this.strDescriptionIt,
        this.strDescriptionJp,
        this.strDescriptionRu,
        this.strDescriptionEs,
        this.strDescriptionPt,
        this.strDescriptionSe,
        this.strDescriptionNl,
        this.strDescriptionHu,
        this.strDescriptionNo,
        this.strDescriptionIl,
        this.strDescriptionPl,
        this.strGender,
        this.strCountry,
        this.strTeamBadge,
        this.strTeamJersey,
        this.strTeamLogo,
        this.strTeamFanart1,
        this.strTeamFanart2,
        this.strTeamFanart3,
        this.strTeamFanart4,
        this.strTeamBanner,
        this.strYoutube,
        this.strLocked,
    });

    String idTeam;
    dynamic idSoccerXml;
    String idApIfootball;
    dynamic intLoved;
    String strTeam;
    dynamic strTeamShort;
    String strAlternate;
    String intFormedYear;
    String strSport;
    String strLeague;
    String idLeague;
    String strLeague2;
    dynamic idLeague2;
    String strLeague3;
    dynamic idLeague3;
    String strLeague4;
    dynamic idLeague4;
    String strLeague5;
    dynamic idLeague5;
    String strLeague6;
    dynamic idLeague6;
    String strLeague7;
    dynamic idLeague7;
    dynamic strDivision;
    String strManager;
    String strStadium;
    String strKeywords;
    String strRss;
    dynamic strStadiumThumb;
    dynamic strStadiumDescription;
    String strStadiumLocation;
    String intStadiumCapacity;
    String strWebsite;
    String strFacebook;
    String strTwitter;
    String strInstagram;
    String strDescriptionEn;
    dynamic strDescriptionDe;
    dynamic strDescriptionFr;
    dynamic strDescriptionCn;
    dynamic strDescriptionIt;
    dynamic strDescriptionJp;
    dynamic strDescriptionRu;
    dynamic strDescriptionEs;
    dynamic strDescriptionPt;
    dynamic strDescriptionSe;
    dynamic strDescriptionNl;
    dynamic strDescriptionHu;
    dynamic strDescriptionNo;
    dynamic strDescriptionIl;
    dynamic strDescriptionPl;
    String strGender;
    String strCountry;
    String strTeamBadge;
    dynamic strTeamJersey;
    dynamic strTeamLogo;
    dynamic strTeamFanart1;
    dynamic strTeamFanart2;
    dynamic strTeamFanart3;
    dynamic strTeamFanart4;
    dynamic strTeamBanner;
    String strYoutube;
    String strLocked;

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        idTeam: json["idTeam"] == null ? null : json["idTeam"],
        idSoccerXml: json["idSoccerXML"],
        idApIfootball: json["idAPIfootball"] == null ? null : json["idAPIfootball"],
        intLoved: json["intLoved"],
        strTeam: json["strTeam"] == null ? null : json["strTeam"],
        strTeamShort: json["strTeamShort"],
        strAlternate: json["strAlternate"] == null ? null : json["strAlternate"],
        intFormedYear: json["intFormedYear"] == null ? null : json["intFormedYear"],
        strSport: json["strSport"] == null ? null : json["strSport"],
        strLeague: json["strLeague"] == null ? null : json["strLeague"],
        idLeague: json["idLeague"] == null ? null : json["idLeague"],
        strLeague2: json["strLeague2"] == null ? null : json["strLeague2"],
        idLeague2: json["idLeague2"],
        strLeague3: json["strLeague3"] == null ? null : json["strLeague3"],
        idLeague3: json["idLeague3"],
        strLeague4: json["strLeague4"] == null ? null : json["strLeague4"],
        idLeague4: json["idLeague4"],
        strLeague5: json["strLeague5"] == null ? null : json["strLeague5"],
        idLeague5: json["idLeague5"],
        strLeague6: json["strLeague6"] == null ? null : json["strLeague6"],
        idLeague6: json["idLeague6"],
        strLeague7: json["strLeague7"] == null ? null : json["strLeague7"],
        idLeague7: json["idLeague7"],
        strDivision: json["strDivision"],
        strManager: json["strManager"] == null ? null : json["strManager"],
        strStadium: json["strStadium"] == null ? null : json["strStadium"],
        strKeywords: json["strKeywords"] == null ? null : json["strKeywords"],
        strRss: json["strRSS"] == null ? null : json["strRSS"],
        strStadiumThumb: json["strStadiumThumb"],
        strStadiumDescription: json["strStadiumDescription"],
        strStadiumLocation: json["strStadiumLocation"] == null ? null : json["strStadiumLocation"],
        intStadiumCapacity: json["intStadiumCapacity"] == null ? null : json["intStadiumCapacity"],
        strWebsite: json["strWebsite"] == null ? null : json["strWebsite"],
        strFacebook: json["strFacebook"] == null ? null : json["strFacebook"],
        strTwitter: json["strTwitter"] == null ? null : json["strTwitter"],
        strInstagram: json["strInstagram"] == null ? null : json["strInstagram"],
        strDescriptionEn: json["strDescriptionEN"] == null ? null : json["strDescriptionEN"],
        strDescriptionDe: json["strDescriptionDE"],
        strDescriptionFr: json["strDescriptionFR"],
        strDescriptionCn: json["strDescriptionCN"],
        strDescriptionIt: json["strDescriptionIT"],
        strDescriptionJp: json["strDescriptionJP"],
        strDescriptionRu: json["strDescriptionRU"],
        strDescriptionEs: json["strDescriptionES"],
        strDescriptionPt: json["strDescriptionPT"],
        strDescriptionSe: json["strDescriptionSE"],
        strDescriptionNl: json["strDescriptionNL"],
        strDescriptionHu: json["strDescriptionHU"],
        strDescriptionNo: json["strDescriptionNO"],
        strDescriptionIl: json["strDescriptionIL"],
        strDescriptionPl: json["strDescriptionPL"],
        strGender: json["strGender"] == null ? null : json["strGender"],
        strCountry: json["strCountry"] == null ? null : json["strCountry"],
        strTeamBadge: json["strTeamBadge"] == null ? null : json["strTeamBadge"],
        strTeamJersey: json["strTeamJersey"],
        strTeamLogo: json["strTeamLogo"],
        strTeamFanart1: json["strTeamFanart1"],
        strTeamFanart2: json["strTeamFanart2"],
        strTeamFanart3: json["strTeamFanart3"],
        strTeamFanart4: json["strTeamFanart4"],
        strTeamBanner: json["strTeamBanner"],
        strYoutube: json["strYoutube"] == null ? null : json["strYoutube"],
        strLocked: json["strLocked"] == null ? null : json["strLocked"],
    );

    Map<String, dynamic> toJson() => {
        "idTeam": idTeam == null ? null : idTeam,
        "idSoccerXML": idSoccerXml,
        "idAPIfootball": idApIfootball == null ? null : idApIfootball,
        "intLoved": intLoved,
        "strTeam": strTeam == null ? null : strTeam,
        "strTeamShort": strTeamShort,
        "strAlternate": strAlternate == null ? null : strAlternate,
        "intFormedYear": intFormedYear == null ? null : intFormedYear,
        "strSport": strSport == null ? null : strSport,
        "strLeague": strLeague == null ? null : strLeague,
        "idLeague": idLeague == null ? null : idLeague,
        "strLeague2": strLeague2 == null ? null : strLeague2,
        "idLeague2": idLeague2,
        "strLeague3": strLeague3 == null ? null : strLeague3,
        "idLeague3": idLeague3,
        "strLeague4": strLeague4 == null ? null : strLeague4,
        "idLeague4": idLeague4,
        "strLeague5": strLeague5 == null ? null : strLeague5,
        "idLeague5": idLeague5,
        "strLeague6": strLeague6 == null ? null : strLeague6,
        "idLeague6": idLeague6,
        "strLeague7": strLeague7 == null ? null : strLeague7,
        "idLeague7": idLeague7,
        "strDivision": strDivision,
        "strManager": strManager == null ? null : strManager,
        "strStadium": strStadium == null ? null : strStadium,
        "strKeywords": strKeywords == null ? null : strKeywords,
        "strRSS": strRss == null ? null : strRss,
        "strStadiumThumb": strStadiumThumb,
        "strStadiumDescription": strStadiumDescription,
        "strStadiumLocation": strStadiumLocation == null ? null : strStadiumLocation,
        "intStadiumCapacity": intStadiumCapacity == null ? null : intStadiumCapacity,
        "strWebsite": strWebsite == null ? null : strWebsite,
        "strFacebook": strFacebook == null ? null : strFacebook,
        "strTwitter": strTwitter == null ? null : strTwitter,
        "strInstagram": strInstagram == null ? null : strInstagram,
        "strDescriptionEN": strDescriptionEn == null ? null : strDescriptionEn,
        "strDescriptionDE": strDescriptionDe,
        "strDescriptionFR": strDescriptionFr,
        "strDescriptionCN": strDescriptionCn,
        "strDescriptionIT": strDescriptionIt,
        "strDescriptionJP": strDescriptionJp,
        "strDescriptionRU": strDescriptionRu,
        "strDescriptionES": strDescriptionEs,
        "strDescriptionPT": strDescriptionPt,
        "strDescriptionSE": strDescriptionSe,
        "strDescriptionNL": strDescriptionNl,
        "strDescriptionHU": strDescriptionHu,
        "strDescriptionNO": strDescriptionNo,
        "strDescriptionIL": strDescriptionIl,
        "strDescriptionPL": strDescriptionPl,
        "strGender": strGender == null ? null : strGender,
        "strCountry": strCountry == null ? null : strCountry,
        "strTeamBadge": strTeamBadge == null ? null : strTeamBadge,
        "strTeamJersey": strTeamJersey,
        "strTeamLogo": strTeamLogo,
        "strTeamFanart1": strTeamFanart1,
        "strTeamFanart2": strTeamFanart2,
        "strTeamFanart3": strTeamFanart3,
        "strTeamFanart4": strTeamFanart4,
        "strTeamBanner": strTeamBanner,
        "strYoutube": strYoutube == null ? null : strYoutube,
        "strLocked": strLocked == null ? null : strLocked,
    };
}
