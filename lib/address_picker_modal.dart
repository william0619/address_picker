import 'package:address_picker/components/address_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddressPicker {
  static void showAddressPicker(BuildContext context) async {
    var a = await showModalBottomSheet(
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
  }
}
