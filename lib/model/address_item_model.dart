import 'dart:convert' show json;

import 'package:address_picker/enum/address_enum.dart';

T _asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class AddressItemModel {
  AddressItemModel({this.name, this.alpha, this.code});

  factory AddressItemModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : AddressItemModel(
          name: _asT<String>(jsonRes['name']),
          alpha: _asT<String>(jsonRes['alpha']),
          code: _asT<String>(jsonRes['code']),
        );

  String name;
  String alpha;
  String code;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'alpha': alpha,
        'code': code,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
