class StudentModel {
  String? AdminID;
  String? BloodType;
  String? Class;
  String? Name;
  // String? LateStatus;

  String? NationalID;
  String? Nationality;
  String? ParentId;
  List<String>? Search;
  String? UserName;

  StudentModel({
    this.AdminID,
    this.BloodType,
    this.Class,
    this.Name,
    this.NationalID,
    this.Nationality,
    this.ParentId,
    this.Search,
    this.UserName,
  });

  Map<String, dynamic> toJson() {
    return {
      "AdminID": this.AdminID,
      "BloodType": this.BloodType,
      "Class": this.Class,
      "Name": this.Name,
      "NationalID": this.NationalID,
      "Nationality": this.Nationality,
      "ParentId": this.ParentId,
      "Search": this.Search,
      "UserName": this.UserName,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      AdminID: json["AdminID"] ?? "",
      BloodType: json["BloodType"] ?? "",
      Class: json["Class"] ?? "",
      Name: json["Name"] ?? "",
      NationalID: json["NationalID"] ?? "",
      Nationality: json["Nationality"] ?? "",
      ParentId: json["ParentId"] ?? "",
      UserName: json["UserName"] ?? "",
      Search: json["Search"].cast<String>(),
    );
  }
}
