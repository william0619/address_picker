import 'package:address_picker/components/address_picker_bottom_sheet.dart';
import 'package:address_picker/model/address_item_model.dart';
import 'package:flutter/material.dart';

class AddressPicker {
  static Future<AddressPickerModel> showAddressPicker(BuildContext context, {AddressPickerModel initData}) async {
    AddressPickerModel address = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * (2 / 3),
          child: AddressPickerBottomSheet(),
        );
      },
    );
    if (address != null) return address;
    return null;
  }
}

class AddressPickerModel {
  /// 选择省
  final AddressItemModel province;

  /// 选中市
  final AddressItemModel city;

  /// 选择区
  final AddressItemModel area;

  AddressPickerModel({@required this.province, @required this.city, @required this.area});
}
