import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/device.dart';
import '../index.dart';

class ButtonGroup extends StatefulWidget {
  final List<Map<String, dynamic>> loginOptions;
  final Function(String?)? onChange;
  final double? width;
  final double? borderWidth;
  final double? buttonWidth;
  final double? buttonHeight;
  final double padding;
  final Color? color;
  final double iconSize;
  final Color? buttonBackgroundColor;
  final Color? selectedColor;
  final Color? unSelectedColor;

  const ButtonGroup({
    super.key,
    required this.loginOptions,
    this.onChange,
    this.width,
    this.padding = 12,
    this.color,
    this.iconSize = 20,
    this.buttonBackgroundColor = Colors.transparent,
    this.buttonWidth = 42,
    this.buttonHeight = 42,
    this.borderWidth = 1,
    this.selectedColor,
    this.unSelectedColor = Colors.grey,
  });

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  String? selectedKey;

  Color getBorderColor(bool isSelected) {
    return isSelected
        ? widget.selectedColor ?? Theme.of(context).primaryColor
        : widget.unSelectedColor ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? DeviceUtils.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.loginOptions.map((item) {
          final isSelected = selectedKey == item['key'];
          final borderColor = isSelected
              ? widget.selectedColor ?? Theme.of(context).primaryColor
              : widget.unSelectedColor;
          return Padding(
            padding: EdgeInsets.fromLTRB(widget.padding, 0, widget.padding, 0),
            child: Button(
              icon: FaIcon(
                item['icon'],
                size: widget.iconSize,
                color: borderColor,
              ),
              onPressed: () {
                setState(() {
                  selectedKey = item['key'];
                });
                if (widget.onChange != null) {
                  widget.onChange!(item['key']);
                }
              },
              isBorder: true,
              border: Border.all(
                color: borderColor!,
                width: widget.borderWidth!,
              ),
              borderRadius: 12,
              type: ButtonType.circular,
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              backgroundColor: widget.buttonBackgroundColor,
            ),
          );
        }).toList(),
      ),
    );
  }
}
