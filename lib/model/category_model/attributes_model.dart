class AttributesModel {
  bool? success;
  String? message; // for error response
  Category? category;
  List<Attribute>? attributes;

  AttributesModel({
    this.success,
    this.message,
    this.category,
    this.attributes,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) {
    return AttributesModel(
      success: json['success'],
      message: json['message'],
      category: json['category'] != null && json['category'] is Map<String, dynamic>
          ? Category.fromJson(json['category'])
          : null,
      attributes: json['attributes'] != null && json['attributes'] is List
          ? (json['attributes'] as List)
          .map((v) => Attribute.fromJson(v))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (message != null) data['message'] = message;
    if (category != null) data['category'] = category!.toJson();
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? icon;

  Category({this.id, this.name, this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }
}

class Attribute {
  int? id;
  String? fieldName;
  String? fieldType;
  bool? isRequired;
  List<String>? options;

  Attribute({
    this.id,
    this.fieldName,
    this.fieldType,
    this.isRequired,
    this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      fieldName: json['field_name'],
      fieldType: json['field_type'],
      isRequired: json['is_required'],
      options: (json['options'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'field_name': fieldName,
      'field_type': fieldType,
      'is_required': isRequired,
      'options': options,
    };
  }
}
