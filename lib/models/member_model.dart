// To parse this JSON data, do
//
//     final members = membersFromJson(jsonString);

import 'dart:convert';

List<Members> membersFromJson(String str) =>
    List<Members>.from(json.decode(str).map((x) => Members.fromJson(x)));

String membersToJson(List<Members> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Members {
  Members({
    // required this.id,
    // required this.s,
    required this.name,
    //  required this.dob,
  required  this.shepherd,
    required this.picture,
    required this.contact,
    //  required this.whatsapp,
    // required  this.work,
    // required  this.maritalStatus,
    required this.digitalAdd,
    required this.homeAddress,
    //  required this.email,
    //  required this.facebook,
    //  required this.language,
    // required  this.tribe,
    required this.auxilliary,
    // required  this.baptised,
     required this.birthday,
  });

  // String id;
  // String s;
  String name;
  // DateTime dob;
 String shepherd;
  String picture;
  String contact;
  // String whatsapp;
  // String work;
  // String maritalStatus;
  String digitalAdd;
  String homeAddress;
  // String email;
  // String facebook;
  // String language;
  // String tribe;
  String auxilliary;
  // String baptised;
   String birthday;
  

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        // id: json["_id"],
        // s: json["S/№"],
        name: json["NAME"],
        // dob: DateTime.parse(json["DOB"]),
        shepherd: json["SHEPHERD"],
        picture: json["PICTURE"],
        contact: json["CONTACT"],
        // whatsapp: json["WHATSAPP"],
        // work: json["WORK"],
        // maritalStatus: json["MARITAL STATUS"],
        digitalAdd: json["DIGITAL _ADD"],
        homeAddress: json["HOME ADDRESS"],
        // email: json["EMAIL"],
        // facebook: json["FACEBOOK"],
        // language: json["LANGUAGE"],
        // tribe: json["TRIBE"],
        auxilliary: json["AUXILLIARY"],
        // baptised: json["BAPTISED"],
          birthday: json["BIRTHDAY"],
      );

  Map<String, dynamic> toJson() => {
        // "_id": id,
        // "S/№": s,
        "NAME": name,
        // "DOB": dob.toIso8601String(),
        "SHEPHERD": shepherd,
        "PICTURE": picture,
        "CONTACT": contact,
        // "WHATSAPP": whatsapp,
        // "WORK": work,
        // "MARITAL STATUS": maritalStatus,
        "DIGITAL _ADD": digitalAdd,
        "HOME ADDRESS": homeAddress,
        // "EMAIL": email,
        // "FACEBOOK": facebook,
        // "LANGUAGE": language,
        // "TRIBE": tribe,
        "AUXILLIARY": auxilliary,
        // "BAPTISED": baptised,
           "BIRTHDAY": birthday,
      };
}
