import 'package:address_picker/components/address_picker_item.dart';
import 'package:address_picker/enum/address_enum.dart';
import 'package:address_picker/model/address_item_model.dart';
import 'package:address_picker/service/address_notification.dart';
import 'package:address_picker/service/address_provider.dart';
import 'package:flutter/material.dart';

class AddressTab extends StatefulWidget {
  final List<AddressItemModel> data;
  final AddressTypeEnum type;
  const AddressTab({Key key, @required this.data, @required this.type}) : super(key: key);
  @override
  _AddressTabState createState() => _AddressTabState();
}

class _AddressTabState extends State<AddressTab> with AutomaticKeepAliveClientMixin {
  AddressProvider _addressProvider;
  ScrollController _scrollController = ScrollController();

  /// 地址数据
  List<AddressItemModel> get _data => widget.data;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _addressProvider = AddressProvider.of(context);
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        AddressItemModel item = _data[index];
        bool selected = _addressProvider.isSelected(widget.type, item);
        return AddressPickerItem(item: item, selected: selected, onChanged: _onChange);
      },
      itemCount: _data.length,
    );
  }

  void _onChange(AddressItemModel item) {
    AddressNotification(type: widget.type, value: item).dispatch(context);
  }

  @override
  bool get wantKeepAlive => true;
}
