class ServiceProvidersModel {
  bool? status;
  List<ServiceProviderDetails>? data;

  ServiceProvidersModel({this.status, this.data});

  ServiceProvidersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ServiceProviderDetails>[];
      json['data'].forEach((v) {
        data!.add(new ServiceProviderDetails.fromJson(v));
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

class ServiceProviderDetails {
  int? id;
  String? name;
  List<String>? images;
  List<String>? videos;
  int? serviceCategoryId;
  int? wage;
  String? createdAt;
  String? updatedAt;
  ServiceCategory? serviceCategory;

  ServiceProviderDetails(
      {this.id,
      this.name,
      this.images,
      this.videos,
      this.serviceCategoryId,
      this.wage,
      this.createdAt,
      this.updatedAt,
      this.serviceCategory});

  ServiceProviderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'].cast<String>();
    videos = json['videos'].cast<String>();
    serviceCategoryId = json['service_category_id'];
    wage = json['wage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceCategory = json['service_category'] != null
        ? new ServiceCategory.fromJson(json['service_category'])
        : null;
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
    if (this.serviceCategory != null) {
      data['service_category'] = this.serviceCategory!.toJson();
    }
    return data;
  }
}

class ServiceCategory {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  ServiceCategory(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt});

  ServiceCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
