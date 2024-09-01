class MyEventsModel {
  bool? status;
  List<Data>? data;

  MyEventsModel({this.status, this.data});

  MyEventsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? title;
  int? eventCategoryId;
  int? venueId;
  int? mobileUserId;
  String? description;
  int? peopleNumber;
  String? type;
  String? date;
  String? createdAt;
  String? updatedAt;
  EventCategory? eventCategory;
  Venue? venue;
  List<ServiceProviders>? serviceProviders;
  List<Timelines>? timelines;

  Data(
      {this.id,
      this.title,
      this.eventCategoryId,
      this.venueId,
      this.mobileUserId,
      this.description,
      this.peopleNumber,
      this.type,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.eventCategory,
      this.venue,
      this.serviceProviders,
      this.timelines});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    eventCategoryId = json['event_category_id'];
    venueId = json['venue_id'];
    mobileUserId = json['mobile_user_id'];
    description = json['description'];
    peopleNumber = json['people_number'];
    type = json['type'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    eventCategory = json['event_category'] != null
        ? new EventCategory.fromJson(json['event_category'])
        : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    if (json['service_providers'] != null) {
      serviceProviders = <ServiceProviders>[];
      json['service_providers'].forEach((v) {
        serviceProviders!.add(new ServiceProviders.fromJson(v));
      });
    }
    if (json['timelines'] != null) {
      timelines = <Timelines>[];
      json['timelines'].forEach((v) {
        timelines!.add(new Timelines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['event_category_id'] = this.eventCategoryId;
    data['venue_id'] = this.venueId;
    data['mobile_user_id'] = this.mobileUserId;
    data['description'] = this.description;
    data['people_number'] = this.peopleNumber;
    data['type'] = this.type;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.eventCategory != null) {
      data['event_category'] = this.eventCategory!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.serviceProviders != null) {
      data['service_providers'] =
          this.serviceProviders!.map((v) => v.toJson()).toList();
    }
    if (this.timelines != null) {
      data['timelines'] = this.timelines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventCategory {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  EventCategory({this.id, this.name, this.createdAt, this.updatedAt});

  EventCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? location;
  List<String>? images;
  int? capacity;
  int? price;
  String? description;
  String? createdAt;
  String? updatedAt;

  Venue(
      {this.id,
      this.name,
      this.location,
      this.images,
      this.capacity,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    images = json['images'].cast<String>();
    capacity = json['capacity'];
    price = json['price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['images'] = this.images;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ServiceProviders {
  int? id;
  String? name;
  List<String>? images;
  List<String>? videos;
  int? serviceCategoryId;
  int? wage;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  ServiceProviders(
      {this.id,
      this.name,
      this.images,
      this.videos,
      this.serviceCategoryId,
      this.wage,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  ServiceProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'].cast<String>();
    videos = json['videos'].cast<String>();
    serviceCategoryId = json['service_category_id'];
    wage = json['wage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['images'] = this.images;
    data['videos'] = this.videos;
    data['service_category_id'] = this.serviceCategoryId;
    data['wage'] = this.wage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? eventId;
  int? serviceProviderId;

  Pivot({this.eventId, this.serviceProviderId});

  Pivot.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    serviceProviderId = json['service_provider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['service_provider_id'] = this.serviceProviderId;
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