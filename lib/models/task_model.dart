class TaskModel {
  String? id;
  String? uid;
  String? ts;
  String? title;
  String? description;
  bool? markAsDone;

  TaskModel({this.id, this.uid, this.ts, this.title, this.description,
  this.markAsDone = false});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    ts = json['ts'];
    title = json['title'];
    description = json['description'];
    markAsDone = json['markAsDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['ts'] = this.ts;
    data['title'] = this.title;
    data['description'] = this.description;
    data['markAsDone'] = this.markAsDone;
    return data;
  }
}
