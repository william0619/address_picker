import 'package:flutter/widgets.dart';
import 'package:address_picker/model/address_item_model.dart';

class AddressPickerModel {
  /// 选择省
  final AddressItemModel province;

  /// 选中市
  final AddressItemModel city;

  /// 选择区
  final AddressItemModel area;

  AddressPickerModel({@required this.province, @required this.city, @required this.area});
}
