class HomeSliderModel {
  String? msg;
  List<HomeSliderData>? sliderData;

  HomeSliderModel({this.msg, this.sliderData});

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderData = <HomeSliderData>[];
      json['data'].forEach((v) {
        sliderData!.add(HomeSliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (sliderData != null) {
      data['data'] = sliderData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeSliderData {
  int? id;
  String? title;
  String? shortDes;
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;

  HomeSliderData(
      {this.id,
      this.title,
      this.shortDes,
      this.image,
      this.productId,
      this.createdAt,
      this.updatedAt});

  HomeSliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_des'] = shortDes;
    data['image'] = image;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
