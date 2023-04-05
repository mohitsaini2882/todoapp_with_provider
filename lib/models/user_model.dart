class UserModel {
  String? uid;
  String? email;
  String? name;
  String? profilePicture;
  String? createDate;

  UserModel(
      {this.uid, this.email, this.name, this.profilePicture, this.createDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['createDate'] = this.createDate;
    return data;
  }
}
