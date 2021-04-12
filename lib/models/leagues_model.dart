// To parse this JSON data, do
//
//     final leaguesModel = leaguesModelFromJson(jsonString);

import 'dart:convert';

LeaguesModel leaguesModelFromJson(String str) => LeaguesModel.fromJson(json.decode(str));

String leaguesModelToJson(LeaguesModel data) => json.encode(data.toJson());

class LeaguesModel {
    LeaguesModel({
        this.leagues,
    });

    List<League> leagues;

    factory LeaguesModel.fromJson(Map<String, dynamic> json) => LeaguesModel(
        leagues: json["leagues"] == null ? null : List<League>.from(json["leagues"].map((x) => League.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "leagues": leagues == null ? null : List<dynamic>.from(leagues.map((x) => x.toJson())),
    };
}

class League {
    League({
        this.idLeague,
        this.strLeague,
        this.strSport,
        this.strLeagueAlternate,
        this.eventsPast
    });

    String idLeague;
    String strLeague;
    String strSport;
    String strLeagueAlternate;
    List<Event> eventsPast;

    factory League.fromJson(Map<String, dynamic> json) => League(
      idLeague: json["idLeague"] == null ? null : json["idLeague"],
      strLeague: json["strLeague"] == null ? null : json["strLeague"],
      strSport: json["strSport"] == null ? null : json["strSport"],
      strLeagueAlternate: json["strLeagueAlternate"] == null ? null : json["strLeagueAlternate"],
      eventsPast: json["events"] == null ? [] : List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idLeague": idLeague == null ? null : idLeague,
        "strLeague": strLeague == null ? null : strLeague,
        "strSport": strSport == null ? null : strSport,
        "strLeagueAlternate": strLeagueAlternate == null ? null : strLeagueAlternate,
        "eventsPast": eventsPast == null ? [] : List<dynamic>.from(eventsPast.map((x) => x.toJson())),
    };
}

class Event {
    Event({
        this.idEvent,
        this.idSoccerXml,
        this.idApIfootball,
        this.strEvent,
        this.strEventAlternate,
        this.strFilename,
        this.strSport,
        this.idLeague,
        this.strLeague,
        this.strSeason,
        this.strDescriptionEn,
        this.strHomeTeam,
        this.strAwayTeam,
        this.intHomeScore,
        this.intRound,
        this.intAwayScore,
        this.intSpectators,
        this.strOfficial,
        this.strHomeGoalDetails,
        this.strHomeRedCards,
        this.strHomeYellowCards,
        this.strHomeLineupGoalkeeper,
        this.strHomeLineupDefense,
        this.strHomeLineupMidfield,
        this.strHomeLineupForward,
        this.strHomeLineupSubstitutes,
        this.strHomeFormation,
        this.strAwayRedCards,
        this.strAwayYellowCards,
        this.strAwayGoalDetails,
        this.strAwayLineupGoalkeeper,
        this.strAwayLineupDefense,
        this.strAwayLineupMidfield,
        this.strAwayLineupForward,
        this.strAwayLineupSubstitutes,
        this.strAwayFormation,
        this.intHomeShots,
        this.intAwayShots,
        this.strTimestamp,
        this.dateEvent,
        this.dateEventLocal,
        this.strTime,
        this.strTimeLocal,
        this.strTvStation,
        this.idHomeTeam,
        this.idAwayTeam,
        this.strResult,
        this.strVenue,
        this.strCountry,
        this.strCity,
        this.strPoster,
        this.strSquare,
        this.strFanart,
        this.strThumb,
        this.strBanner,
        this.strMap,
        this.strTweet1,
        this.strTweet2,
        this.strTweet3,
        this.strVideo,
        this.strStatus,
        this.strPostponed,
        this.strLocked,
    });

    String idEvent;
    dynamic idSoccerXml;
    String idApIfootball;
    String strEvent;
    String strEventAlternate;
    String strFilename;
    String strSport;
    String idLeague;
    String strLeague;
    String strSeason;
    String strDescriptionEn;
    String strHomeTeam;
    String strAwayTeam;
    String intHomeScore;
    String intRound;
    String intAwayScore;
    dynamic intSpectators;
    String strOfficial;
    String strHomeGoalDetails;
    dynamic strHomeRedCards;
    dynamic strHomeYellowCards;
    dynamic strHomeLineupGoalkeeper;
    dynamic strHomeLineupDefense;
    dynamic strHomeLineupMidfield;
    dynamic strHomeLineupForward;
    dynamic strHomeLineupSubstitutes;
    dynamic strHomeFormation;
    dynamic strAwayRedCards;
    dynamic strAwayYellowCards;
    String strAwayGoalDetails;
    dynamic strAwayLineupGoalkeeper;
    dynamic strAwayLineupDefense;
    dynamic strAwayLineupMidfield;
    dynamic strAwayLineupForward;
    dynamic strAwayLineupSubstitutes;
    dynamic strAwayFormation;
    dynamic intHomeShots;
    dynamic intAwayShots;
    DateTime strTimestamp;
    DateTime dateEvent;
    String dateEventLocal;
    String strTime;
    String strTimeLocal;
    dynamic strTvStation;
    String idHomeTeam;
    String idAwayTeam;
    String strResult;
    String strVenue;
    String strCountry;
    String strCity;
    dynamic strPoster;
    dynamic strSquare;
    dynamic strFanart;
    String strThumb;
    dynamic strBanner;
    dynamic strMap;
    String strTweet1;
    String strTweet2;
    String strTweet3;
    String strVideo;
    String strStatus;
    String strPostponed;
    String strLocked;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        idEvent: json["idEvent"] == null ? null : json["idEvent"],
        idSoccerXml: json["idSoccerXML"],
        idApIfootball: json["idAPIfootball"] == null ? null : json["idAPIfootball"],
        strEvent: json["strEvent"] == null ? null : json["strEvent"],
        strEventAlternate: json["strEventAlternate"] == null ? null : json["strEventAlternate"],
        strFilename: json["strFilename"] == null ? null : json["strFilename"],
        strSport: json["strSport"] == null ? null : json["strSport"],
        idLeague: json["idLeague"] == null ? null : json["idLeague"],
        strLeague: json["strLeague"] == null ? null : json["strLeague"],
        strSeason: json["strSeason"] == null ? null : json["strSeason"],
        strDescriptionEn: json["strDescriptionEN"] == null ? null : json["strDescriptionEN"],
        strHomeTeam: json["strHomeTeam"] == null ? null : json["strHomeTeam"],
        strAwayTeam: json["strAwayTeam"] == null ? null : json["strAwayTeam"],
        intHomeScore: json["intHomeScore"] == null ? null : json["intHomeScore"],
        intRound: json["intRound"] == null ? null : json["intRound"],
        intAwayScore: json["intAwayScore"] == null ? null : json["intAwayScore"],
        intSpectators: json["intSpectators"],
        strOfficial: json["strOfficial"] == null ? null : json["strOfficial"],
        strHomeGoalDetails: json["strHomeGoalDetails"] == null ? null : json["strHomeGoalDetails"],
        strHomeRedCards: json["strHomeRedCards"],
        strHomeYellowCards: json["strHomeYellowCards"],
        strHomeLineupGoalkeeper: json["strHomeLineupGoalkeeper"],
        strHomeLineupDefense: json["strHomeLineupDefense"],
        strHomeLineupMidfield: json["strHomeLineupMidfield"],
        strHomeLineupForward: json["strHomeLineupForward"],
        strHomeLineupSubstitutes: json["strHomeLineupSubstitutes"],
        strHomeFormation: json["strHomeFormation"],
        strAwayRedCards: json["strAwayRedCards"],
        strAwayYellowCards: json["strAwayYellowCards"],
        strAwayGoalDetails: json["strAwayGoalDetails"] == null ? null : json["strAwayGoalDetails"],
        strAwayLineupGoalkeeper: json["strAwayLineupGoalkeeper"],
        strAwayLineupDefense: json["strAwayLineupDefense"],
        strAwayLineupMidfield: json["strAwayLineupMidfield"],
        strAwayLineupForward: json["strAwayLineupForward"],
        strAwayLineupSubstitutes: json["strAwayLineupSubstitutes"],
        strAwayFormation: json["strAwayFormation"],
        intHomeShots: json["intHomeShots"],
        intAwayShots: json["intAwayShots"],
        strTimestamp: json["strTimestamp"] == null ? null : DateTime.parse(json["strTimestamp"]),
        dateEvent: json["dateEvent"] == null ? null : DateTime.parse(json["dateEvent"]),
        dateEventLocal: json["dateEventLocal"] == null ? null : json["dateEventLocal"],
        strTime: json["strTime"] == null ? null : json["strTime"],
        strTimeLocal: json["strTimeLocal"] == null ? null : json["strTimeLocal"],
        strTvStation: json["strTVStation"],
        idHomeTeam: json["idHomeTeam"] == null ? null : json["idHomeTeam"],
        idAwayTeam: json["idAwayTeam"] == null ? null : json["idAwayTeam"],
        strResult: json["strResult"] == null ? null : json["strResult"],
        strVenue: json["strVenue"] == null ? null : json["strVenue"],
        strCountry: json["strCountry"] == null ? null : json["strCountry"],
        strCity: json["strCity"] == null ? null : json["strCity"],
        strPoster: json["strPoster"],
        strSquare: json["strSquare"],
        strFanart: json["strFanart"],
        strThumb: json["strThumb"] == null ? null : json["strThumb"],
        strBanner: json["strBanner"],
        strMap: json["strMap"],
        strTweet1: json["strTweet1"] == null ? null : json["strTweet1"],
        strTweet2: json["strTweet2"] == null ? null : json["strTweet2"],
        strTweet3: json["strTweet3"] == null ? null : json["strTweet3"],
        strVideo: json["strVideo"] == null ? null : json["strVideo"],
        strStatus: json["strStatus"] == null ? null : json["strStatus"],
        strPostponed: json["strPostponed"] == null ? null : json["strPostponed"],
        strLocked: json["strLocked"] == null ? null : json["strLocked"],
    );

    Map<String, dynamic> toJson() => {
        "idEvent": idEvent == null ? null : idEvent,
        "idSoccerXML": idSoccerXml,
        "idAPIfootball": idApIfootball == null ? null : idApIfootball,
        "strEvent": strEvent == null ? null : strEvent,
        "strEventAlternate": strEventAlternate == null ? null : strEventAlternate,
        "strFilename": strFilename == null ? null : strFilename,
        "strSport": strSport == null ? null : strSport,
        "idLeague": idLeague == null ? null : idLeague,
        "strLeague": strLeague == null ? null : strLeague,
        "strSeason": strSeason == null ? null : strSeason,
        "strDescriptionEN": strDescriptionEn == null ? null : strDescriptionEn,
        "strHomeTeam": strHomeTeam == null ? null : strHomeTeam,
        "strAwayTeam": strAwayTeam == null ? null : strAwayTeam,
        "intHomeScore": intHomeScore == null ? null : intHomeScore,
        "intRound": intRound == null ? null : intRound,
        "intAwayScore": intAwayScore == null ? null : intAwayScore,
        "intSpectators": intSpectators,
        "strOfficial": strOfficial == null ? null : strOfficial,
        "strHomeGoalDetails": strHomeGoalDetails == null ? null : strHomeGoalDetails,
        "strHomeRedCards": strHomeRedCards,
        "strHomeYellowCards": strHomeYellowCards,
        "strHomeLineupGoalkeeper": strHomeLineupGoalkeeper,
        "strHomeLineupDefense": strHomeLineupDefense,
        "strHomeLineupMidfield": strHomeLineupMidfield,
        "strHomeLineupForward": strHomeLineupForward,
        "strHomeLineupSubstitutes": strHomeLineupSubstitutes,
        "strHomeFormation": strHomeFormation,
        "strAwayRedCards": strAwayRedCards,
        "strAwayYellowCards": strAwayYellowCards,
        "strAwayGoalDetails": strAwayGoalDetails == null ? null : strAwayGoalDetails,
        "strAwayLineupGoalkeeper": strAwayLineupGoalkeeper,
        "strAwayLineupDefense": strAwayLineupDefense,
        "strAwayLineupMidfield": strAwayLineupMidfield,
        "strAwayLineupForward": strAwayLineupForward,
        "strAwayLineupSubstitutes": strAwayLineupSubstitutes,
        "strAwayFormation": strAwayFormation,
        "intHomeShots": intHomeShots,
        "intAwayShots": intAwayShots,
        "strTimestamp": strTimestamp == null ? null : strTimestamp.toIso8601String(),
        "dateEvent": dateEvent == null ? null : "${dateEvent.year.toString().padLeft(4, '0')}-${dateEvent.month.toString().padLeft(2, '0')}-${dateEvent.day.toString().padLeft(2, '0')}",
        "dateEventLocal": dateEventLocal == null ? null : dateEventLocal,
        "strTime": strTime == null ? null : strTime,
        "strTimeLocal": strTimeLocal == null ? null : strTimeLocal,
        "strTVStation": strTvStation,
        "idHomeTeam": idHomeTeam == null ? null : idHomeTeam,
        "idAwayTeam": idAwayTeam == null ? null : idAwayTeam,
        "strResult": strResult == null ? null : strResult,
        "strVenue": strVenue == null ? null : strVenue,
        "strCountry": strCountry == null ? null : strCountry,
        "strCity": strCity == null ? null : strCity,
        "strPoster": strPoster,
        "strSquare": strSquare,
        "strFanart": strFanart,
        "strThumb": strThumb == null ? null : strThumb,
        "strBanner": strBanner,
        "strMap": strMap,
        "strTweet1": strTweet1 == null ? null : strTweet1,
        "strTweet2": strTweet2 == null ? null : strTweet2,
        "strTweet3": strTweet3 == null ? null : strTweet3,
        "strVideo": strVideo == null ? null : strVideo,
        "strStatus": strStatus == null ? null : strStatus,
        "strPostponed": strPostponed == null ? null : strPostponed,
        "strLocked": strLocked == null ? null : strLocked,
    };
}

