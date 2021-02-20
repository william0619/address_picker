import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:address_picker/address_picker_service.dart';

class AddressPickerSelector extends StatefulWidget {
  @override
  _AddressPickerSelectorState createState() => _AddressPickerSelectorState();
}

class _AddressPickerSelectorState extends State<AddressPickerSelector> {
  AddressPickerModel _values;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {showAddressPicker()},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        constraints: BoxConstraints(minHeight: 48),
        child: Row(
          children: [
            Text('选择地址'),
            SizedBox(width: 16),
            Expanded(child: buildSelectedAddress()),
            Icon(Icons.arrow_drop_down, color: Color(0xFFCCCCCC), size: 18),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedAddress() {
    if (_values == null) return SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_values.province.name),
        Text(_values.city.name),
        Text(_values.area.name),
      ],
    );
  }

  void showAddressPicker() async {
    _values = await AddressPicker.showAddressPicker(context);
    setState(() {});
  }
}
