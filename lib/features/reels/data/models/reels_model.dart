class ReelsModel {
  bool? status;
  List<ReelData>? data;

  ReelsModel({this.status, this.data});

  ReelsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ReelData>[];
      json['data'].forEach((v) {
        data!.add(new ReelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReelData {
  int? id;
  String? title;
  String? video;
  String? createdAt;
  String? updatedAt;

  ReelData({this.id, this.title, this.video, this.createdAt, this.updatedAt});

  ReelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}