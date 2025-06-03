class AttributesModel {
  bool? success;
  String? error;
  Category? category;
  List<Fields>? fields;

  AttributesModel({
    this.success,
    this.error,
    this.category,
    this.fields,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) {
    return AttributesModel(
      success: json['success'],
      error: json['error'],
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : null,
      fields: json['fields'] != null
          ? (json['fields'] as List)
          .map((v) => Fields.fromJson(v))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['error'] = error;
    if (category != null) data['category'] = category!.toJson();
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
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

class Fields {
  int? fieldId;
  String? fieldName;
  String? fieldType;
  bool? isRequired;
  List<String>? options;

  Fields({
    this.fieldId,
    this.fieldName,
    this.fieldType,
    this.isRequired,
    this.options,
  });

  factory Fields.fromJson(Map<String, dynamic> json) {
    return Fields(
      fieldId: json['field_id'],
      fieldName: json['field_name'],
      fieldType: json['field_type'],
      isRequired: json['is_required'],
      options: (json['options'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'field_id': fieldId,
      'field_name': fieldName,
      'field_type': fieldType,
      'is_required': isRequired,
      'options': options,
    };
  }
}
