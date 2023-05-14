class ParentModel {
  String? AltPhoneNumber;
  String? Email;
  String? JobTitle;
  bool? LateStatus;
  // String? LateStatus;
  String? Name;
  String? NationalID;
  String? Nationality;
  String? Password;
  String? PhoneNumber;
  String? RelativeRelation;
  List<String>? Search;
  String? State;
  String? UserName;

  ParentModel({
    this.AltPhoneNumber,
    this.Email,
    this.JobTitle,
    this.LateStatus,
    this.Name,
    this.NationalID,
    this.Nationality,
    this.Password,
    this.PhoneNumber,
    this.RelativeRelation,
    this.Search,
    this.State,
    this.UserName,
  });

  Map<String, dynamic> toJson() {
    return {
      "AltPhoneNumber": this.AltPhoneNumber,
      "Email": this.Email,
      "JobTitle": this.JobTitle,
      "LateStatus": this.LateStatus,
      "Name": this.Name,
      "NationalID": this.NationalID,
      "Nationality": this.Nationality,
      "Password": this.Password,
      "PhoneNumber": this.PhoneNumber,
      "RelativeRelation": this.RelativeRelation,
      "Search": this.Search,
      "State": this.State,
      "UserName": this.UserName,
    };
  }

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      AltPhoneNumber: json["AltPhoneNumber"] ?? "",
      Email: json["Email"] ?? "",
      JobTitle: json["JobTitle"] ?? "",
      LateStatus: json["LateStatus"] ?? "",
      Name: json["Name"] ?? "",
      NationalID: json["NationalID"] ?? "",
      Nationality: json["Nationality"] ?? "",
      Password: json["Password"] ?? "",
      PhoneNumber: json["PhoneNumber"] ?? "",
      RelativeRelation: json["RelativeRelation"] ?? "",
      Search: json["Search"].cast<String>(),
      State: json["State"] ?? "",
      UserName: json["UserName"] ?? "",
    );
  }
}
