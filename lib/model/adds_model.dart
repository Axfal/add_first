class AddsModel {
  int? categoryId;
  String? categoryName;
  List<Ads>? ads;

  AddsModel({this.categoryId, this.categoryName, this.ads});

  AddsModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(new Ads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    if (this.ads != null) {
      data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ads {
  int? adId;
  int? userId;
  int? categoryId;
  String? categoryName;
  String? title;
  String? price;
  String? location;
  String? image;
  String? createdAt;

  Ads(
      {this.adId,
        this.userId,
        this.categoryId,
        this.categoryName,
        this.title,
        this.price,
        this.location,
        this.image,
        this.createdAt});

  Ads.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    title = json['title'];
    price = json['price'];
    location = json['location'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_id'] = this.adId;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['title'] = this.title;
    data['price'] = this.price;
    data['location'] = this.location;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
