import 'package:address_picker/components/address_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddressPickerSelector extends StatefulWidget {
  @override
  _AddressPickerSelectorState createState() => _AddressPickerSelectorState();
}

class _AddressPickerSelectorState extends State<AddressPickerSelector> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {showAddressPicker()},
      child: Container(
        constraints: BoxConstraints(minHeight: 48),
        child: Row(
          children: [
            Text('选择地址'),
            buildSelectedAddress(),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedAddress() {
    return Expanded(
      child: Column(
        children: [],
      ),
    );
  }

  void showAddressPicker() {
    showModalBottomSheet(
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
    ).then((value) => null);
  }
}
