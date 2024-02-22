import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDown<T> extends StatelessWidget {
  final List<T> items;
  final List<T>? itemValues;
  final T? value;
  final String? title;
  final String hint;
  final String Function(T)? labelBuilder;
  final void Function(T?)? onChanged;
  final bool readOnly;
  const CustomDropDown(
      {required this.items,
      required this.value,
      this.itemValues,
      required this.hint,
      this.onChanged,
      this.labelBuilder,
      this.title,
      this.readOnly = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return title == null ? _buildDropdown() : _buildDropdownWithTitle(context);
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildDropdownWithTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(height: 10),
        _buildDropdown(),
      ],
    );
  }

  Widget _buildDropdown() {
    return Opacity(
      opacity: readOnly ? .7 : 1.0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12.0)),
        child: IgnorePointer(
          ignoring: readOnly,
          child: DropdownButton(
              padding: EdgeInsets.only(left: 1.w),
              hint: Text(hint),
              borderRadius: BorderRadius.circular(12.0),
              items: List.generate(items.length, (index) {
                return _dropdownItem(
                    items[index], (itemValues?[index] ?? items[index]));
              }),
              onChanged: onChanged,
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: value),
        ),
      ),
    );
  }

  DropdownMenuItem<T> _dropdownItem(T e, T v) {
    return DropdownMenuItem<T>(
      value: v,
      child: Text(
        labelBuilder?.call(e) ?? e.toString(),
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700),
      ),
    );
  }
}
