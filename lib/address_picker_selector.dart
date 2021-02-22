import 'package:address_picker/model/address_picker_theme.dart';
import 'package:flutter/material.dart';
import 'package:address_picker/model/address_picker_model.dart';
import 'package:address_picker/address_picker_service.dart';

class AddressPickerSelector extends StatefulWidget {
  final AddressPickerModel initData;
  final AddressPickerTheme theme;

  const AddressPickerSelector({Key key, this.initData, this.theme}) : super(key: key);
  @override
  _AddressPickerSelectorState createState() => _AddressPickerSelectorState();
}

class _AddressPickerSelectorState extends State<AddressPickerSelector> {
  AddressPickerModel _values;

  @override
  void initState() {
    _values = widget.initData;
    super.initState();
  }

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
    _values = await AddressPicker.showAddressPicker(context, theme: widget.theme, initData: widget.initData);
    setState(() {});
  }
}
