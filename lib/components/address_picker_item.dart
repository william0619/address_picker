import 'package:address_picker/model/address_item_model.dart';
import 'package:address_picker/model/address_picker_theme.dart';
import 'package:flutter/material.dart';

class AddressPickerItem extends StatefulWidget {
  final AddressItemModel item;
  final bool selected;
  final Function(AddressItemModel) onChanged;
  const AddressPickerItem({Key key, @required this.item, this.selected = false, @required this.onChanged}) : super(key: key);
  @override
  _AddressPickerItemState createState() => _AddressPickerItemState();
}

class _AddressPickerItemState extends State<AddressPickerItem> {
  AddressPickerTheme _theme;
  Color get _selectedColor => _theme.selectedColor;
  Color get _color => _selected == true ? _selectedColor : null;
  bool _selected;
  @override
  void initState() {
    _selected = widget.selected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AddressPickerItem oldWidget) {
    if (oldWidget.selected != widget.selected) {
      _selected = widget.selected;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _theme = AddressPickerTheme.of(context);
    return InkWell(
      onTap: () {
        if (_selected != true) {
          widget.onChanged(widget.item);
        }
      },
      child: Container(
        height: 40,
        child: Row(
          children: [
            Visibility(
              visible: _selected,
              child: Container(
                margin: EdgeInsets.only(right: 8),
                child: Icon(Icons.done_sharp, color: _color, size: 18),
              ),
            ),
            Text(
              widget.item.name,
              style: TextStyle(fontSize: 13, color: _color, fontWeight: _selected == true ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
