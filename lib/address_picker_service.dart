import 'package:flutter/material.dart';
import 'package:address_picker/service/address_picker_theme.dart';
import 'package:address_picker/components/address_picker_bottom_sheet.dart';
import 'package:address_picker/model/address_picker_model.dart';

class AddressPicker {
  static Future<AddressPickerModel> showAddressPicker(BuildContext context, {AddressPickerModel initData, AddressPickerTheme theme}) async {
    AddressPickerModel address = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * (2 / 3),
          child: AddressPickerBottomSheet(theme: theme),
        );
      },
    );
    if (address != null) return address;
    return null;
  }
}
