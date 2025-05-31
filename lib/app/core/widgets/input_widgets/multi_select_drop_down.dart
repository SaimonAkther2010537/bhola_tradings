// // ignore_for_file: file_names
//
// import 'package:flutter/material.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';
//
// import '../../constant/constant.dart';
// import '../../theme/app_color_config.dart';
// import '../../theme/text_config.dart';
//
//
// class MultiSelectDropDownInputField<T extends Object> extends StatefulWidget {
//   final MultiSelectController<T> controller;
//   final String fieldTitle;
//   final String hintText;
//   final bool needValidation;
//   final String errorMessage;
//   final BorderRadius? borderRadius;
//   final TextInputAction? textInputAction;
//   final String? suffixText;
//   final Color? backgroundColor;
//   final bool? needTitle;
//   final bool? setInitialValue;
//   final TextStyle? titleStyle;
//   final bool? needSearch;
//   final bool? viewOnly;
//   final T? initialValue;
//   final List<T>? items;
//   final List<DropdownItem<T>>? itemBuilder;
//   final Function(List<T>)? onValueChange;
//   final Key? itemKey;
//   final Widget? prefixWidget;
//   final IconData? prefixIcon;
//
//   const MultiSelectDropDownInputField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.needValidation,
//     required this.errorMessage,
//     this.textInputAction,
//     this.suffixText,
//     this.backgroundColor,
//     required this.fieldTitle,
//     this.needTitle,
//     this.items,
//     this.setInitialValue,
//     this.itemKey,
//     this.onValueChange,
//     this.itemBuilder,
//     this.needSearch,
//     this.viewOnly,
//     this.titleStyle,
//     this.initialValue,
//     this.borderRadius,
//     this.prefixWidget,
//     this.prefixIcon,
//   });
//
//   @override
//   State<MultiSelectDropDownInputField<T>> createState() =>
//       _MultiSelectDropDownInputFieldState<T>();
// }
//
// class _MultiSelectDropDownInputFieldState<T extends Object>
//     extends State<MultiSelectDropDownInputField<T>> {
//   List<DropdownItem<T>> activeItemList = [];
//   bool isMenuOpen = false;
//
//   @override
//   void initState() {
//     if (widget.items != null || widget.itemBuilder != null) {
//       try {
//         if (widget.items != null && widget.itemBuilder == null) {
//           activeItemList = widget.items!
//               .map((e) => DropdownItem<T>(
//                     value: e,
//                     label: e.toString(),
//                   ))
//               .toList();
//         } else if ((widget.items == null && widget.itemBuilder != null)) {
//           activeItemList = widget.itemBuilder!;
//         } else {
//           activeItemList = [];
//         }
//       } catch (error) {
//         throw Exception("Please check if selection item list has been provided or not");
//       }
//     }
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MultiDropdown<T>(
//           controller: widget.controller,
//           enabled: true,
//           searchEnabled: true,
//           chipDecoration: ChipDecoration(
//             backgroundColor: AppColor.secondaryBlack,
//             labelStyle: AppText().bodyMedium.copyWith(color: AppColor.white),
//             deleteIcon: Icon(Icons.close, size: 14, color: AppColor.white,),
//             wrap: true,
//             runSpacing: 2,
//             spacing: 10,
//           ),
//           items: widget.items != null
//               ? activeItemList = widget.items!
//                   .map(
//                     (e) => DropdownItem<T>(
//                       label: e.toString(),
//                       value: e,
//                       selected:widget.controller.selectedItems.isNotEmpty?  widget.controller.selectedItems.map((e) => e.value,).contains(e): false
//                     ),
//                   ).toList()
//               : widget.itemBuilder != null || widget.itemBuilder!.isEmpty
//                   ? widget.itemBuilder!
//                   : <DropdownItem<T>>[],
//           fieldDecoration: FieldDecoration(
//             hintText: widget.hintText,
//             hintStyle: AppText().bodyLarge.copyWith(color: AppColor.primaryBlack),
//             backgroundColor: widget.backgroundColor ?? AppColor.white,
//             prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
//             suffixIcon: null,
//             border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide:   BorderSide(width: borderSideWidth, color: AppColor.extraBgColor)),
//             focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide:   BorderSide(width: borderSideWidth, color: AppColor.extraBgColor)),
//             disabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide:   BorderSide(width: borderSideWidth, color: AppColor.extraBgColor)),
//             errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide:   BorderSide(width: borderSideWidth, color: AppColor.extraBgColor)),
//           ),
//
//           dropdownItemDecoration: DropdownItemDecoration(
//             selectedIcon: Icon(Icons.check_box, color: AppColor.primaryGreen),
//             disabledIcon: const Icon(Icons.lock, color: AppColor.primaryGreen),
//           ),
//
//           // onSelectionChange: (selectedItems) {
//           //   debugPrint("OnSelectionChange: $selectedItems");
//           //   print(widget.controller.selectedItems);
//           // },
//
//           validator: (value) {
//             if (!widget.needValidation) return null;
//             if (value == null || value.toString().isEmpty || value.isEmpty) {
//               return widget.errorMessage;
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import '../../constant/constant.dart';
import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';
import '../buttons/rouded_action_button.dart';

class MultiSelectDropDownInputField<T extends Object> extends StatefulWidget {
  final MultiSelectController<T> controller;
  final String fieldTitle;
  final String hintText;
  final bool needValidation;
  final String errorMessage;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final String? suffixText;
  final Color? backgroundColor;
  final bool? needTitle;
  final bool? setInitialValue;
  final TextStyle? titleStyle;
  final bool? needSearch;
  final bool? viewOnly;
  final T? initialValue;
  final List<T>? items;
  final List<DropdownItem<T>>? itemBuilder;
  final Function(List<T>)? onValueChange;
  final Key? itemKey;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final bool? needSelectAll;

  const MultiSelectDropDownInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.needValidation,
    required this.errorMessage,
    this.textInputAction,
    this.suffixText,
    this.backgroundColor,
    required this.fieldTitle,
    this.needTitle,
    this.items,
    this.setInitialValue,
    this.itemKey,
    this.onValueChange,
    this.itemBuilder,
    this.needSearch,
    this.viewOnly,
    this.titleStyle,
    this.initialValue,
    this.borderRadius,
    this.prefixWidget,
    this.prefixIcon,
    this.needSelectAll = false,
  });

  @override
  State<MultiSelectDropDownInputField<T>> createState() => _MultiSelectDropDownInputFieldState<T>();
}

class _MultiSelectDropDownInputFieldState<T extends Object> extends State<MultiSelectDropDownInputField<T>> {
  List<DropdownItem<T>> activeItemList = [];
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _initializeItems();
  }

  void _initializeItems() {
    if (widget.items != null || widget.itemBuilder != null) {
      try {
        if (widget.items != null && widget.itemBuilder == null) {
          activeItemList = widget.items!
              .map((e) => DropdownItem<T>(
            value: e,
            label: e.toString(),
          ))
              .toList();
        } else if (widget.items == null && widget.itemBuilder != null) {
          activeItemList = widget.itemBuilder!;
        } else {
          activeItemList = [];
        }
      } catch (error) {
        throw Exception("Please check if selection item list has been provided or not");
      }
    }
  }

  // Function to select all items
  void selectAll() {
    setState(() {
      widget.controller.selectAll(); // Assuming this method is available for select all.
    });
  }

  // Function to deselect all items manually
  void deselectAll() {
    print("Deselecting all items...");

    setState(() {
      // Deselect all items by setting 'selected' to false for each item
      for (var item in widget.controller.selectedItems) {
        item.selected = false;
      }

      // Notify listeners to update the UI after modifying selected items
      widget.controller.notifyListeners();

      // Print the current selected items to debug
      print("Selected items after deselecting: ${widget.controller.selectedItems}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true )
          Wrap(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: widget.fieldTitle, style: AppText().headerLine7),
                    if (widget.needValidation) TextSpan(text: "*", style: AppText().bodyMediumBold.copyWith(color: AppColor.red))
                  ],
                ),
              ),
            ],
          ),
        if (widget.needTitle ?? true) const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: MultiDropdown<T>(
                // closeOnBackButton: false,
                controller: widget.controller,
                enabled: true,
                searchEnabled: widget.needSearch ?? false,
                chipDecoration: ChipDecoration(
                  backgroundColor: AppColor.secondaryBlack,
                  labelStyle: AppText().bodyMedium.copyWith(color: AppColor.white),
                  deleteIcon: Icon(
                    Icons.close,
                    size: 14,
                    color: AppColor.white,
                  ),
                  wrap: true,
                  runSpacing: 2,
                  spacing: 10,
                ),
                items: widget.items != null
                    ? activeItemList = widget.items!
                    .map(
                      (e) => DropdownItem<T>(
                    label: e.toString(),
                    value: e,
                    selected: widget.controller.selectedItems.map((e) => e.value).contains(e) ? true : false,
                  ),
                )
                    .toList()
                    : widget.itemBuilder != null || widget.itemBuilder!.isEmpty
                    ? widget.itemBuilder!
                    : <DropdownItem<T>>[],
                onSelectionChange: (selectedItems) {
                  debugPrint("OnSelectionChange: $selectedItems");
                  print(widget.controller.selectedItems);
                },
                fieldDecoration: FieldDecoration(
                  hintText: widget.hintText,
                  hintStyle: AppText().bodyLarge.copyWith(color: AppColor.primaryBlack),
                  backgroundColor: widget.backgroundColor ?? AppColor.white,
                  prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
                  ),
                ),
                dropdownItemDecoration: DropdownItemDecoration(
                  selectedIcon: Icon(Icons.check_box, color: AppColor.primaryGreen),
                  disabledIcon: const Icon(Icons.lock, color: AppColor.primaryGreen),
                ),
                validator: (value) {
                  if (!widget.needValidation) return null;
                  if (value == null || value.toString().isEmpty || value.isEmpty) {
                    return widget.errorMessage;
                  }
                  return null;
                },
              ),
            ),
            if (widget.needSelectAll == true) const SizedBox(width: 5),
            if (widget.needSelectAll == true)
              RoundedActionButton(
                width: 80,
                onClick: selectAll,
                label: "Select All",
                borderRadius: BorderRadius.circular(10),
                textStyle: AppText().bodyExtraSmall.copyWith(color: AppColor.white),
              ),
          ],
        ),
      ],
    );
  }
}
