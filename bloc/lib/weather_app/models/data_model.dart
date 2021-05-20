// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windDegree,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.visKm,
        this.visMiles,
        this.uv,
    });

    String lastUpdated;
    double tempC;
    double tempF;
    int isDay;
    Condition condition;
    final windDegree;
    final humidity;
    final cloud;
    final feelslikeC;
    final feelslikeF;
    final visKm;
    final visMiles;
    final uv;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"].toDouble(),
        tempF: json["temp_f"].toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windDegree: json["wind_degree"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"],
        feelslikeF: json["feelslike_f"],
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
    );

    Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_degree": windDegree,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
    };
}

class Condition {
    Condition({
        this.text,
        this.icon,
        this.code,
    });

    String text;
    String icon;
    int code;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}
