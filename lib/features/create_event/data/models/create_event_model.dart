class CreateEventModel {
  bool? status;
  String? message;
  Data? data;

  CreateEventModel({this.status, this.message, this.data});

  CreateEventModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? title;
  int? eventCategoryId;
  String? description;
  int? peopleNumber;
  int? venueId;
  String? date;
  String? type;
  int? mobileUserId;
  String? updatedAt;
  String? createdAt;
  int? id;
  List<Timelines>? timelines;

  Data(
      {this.title,
      this.eventCategoryId,
      this.description,
      this.peopleNumber,
      this.venueId,
      this.date,
      this.type,
      this.mobileUserId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.timelines});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    eventCategoryId = json['event_category_id'];
    description = json['description'];
    peopleNumber = json['people_number'];
    venueId = json['venue_id'];
    date = json['date'];
    type = json['type'];
    mobileUserId = json['mobile_user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    if (json['timelines'] != null) {
      timelines = <Timelines>[];
      json['timelines'].forEach((v) {
        timelines!.add(new Timelines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['event_category_id'] = this.eventCategoryId;
    data['description'] = this.description;
    data['people_number'] = this.peopleNumber;
    data['venue_id'] = this.venueId;
    data['date'] = this.date;
    data['type'] = this.type;
    data['mobile_user_id'] = this.mobileUserId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.timelines != null) {
      data['timelines'] = this.timelines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timelines {
  int? id;
  int? eventId;
  String? startTime;
  String? endTime;
  String? description;
  String? createdAt;
  String? updatedAt;

  Timelines(
      {this.id,
      this.eventId,
      this.startTime,
      this.endTime,
      this.description,
      this.createdAt,
      this.updatedAt});

  Timelines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_id'] = this.eventId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TimeLine {
  String? startTime;
  String? endTime;
  String? description;
  TimeLine({this.startTime, this.endTime, this.description});
}
