import 'package:flutter/widgets.dart';
import 'package:address_picker/model/address_item_model.dart';

class AddressPickerModel {
  /// 选择省
  final AddressItemModel province;

  /// 选中市
  final AddressItemModel city;

  /// 选择区
  final AddressItemModel area;

  AddressPickerModel({@required this.province, @required this.city, @required this.area})
      : assert(province != null),
        assert(city != null),
        assert(area != null);

  factory AddressPickerModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) return null;

    /// 判断是否全为空
    if (jsonRes['province'] == null || jsonRes['provinceId'] == null) return null;
    if (jsonRes['city'] == null || jsonRes['cityId'] == null) return null;
    if (jsonRes['area'] == null || jsonRes['areaId'] == null) return null;

    /// 赋值
    AddressItemModel province = AddressItemModel(name: jsonRes['province'].toString(), code: jsonRes['provinceId'].toString());
    AddressItemModel city = AddressItemModel(name: jsonRes['city'].toString(), code: jsonRes['cityId'].toString());
    AddressItemModel area = AddressItemModel(name: jsonRes['area'].toString(), code: jsonRes['areaId'].toString());
    return AddressPickerModel(province: province, city: city, area: area);
  }
}
