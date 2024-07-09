import 'package:deels_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:get/get.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  List<CoolDropdownItem<String>> gender = [
    CoolDropdownItem<String>(
        label: 'MALE',
        value: 'MALE',
        selectedIcon: const Icon(Icons.male_rounded),
        icon: const Icon(Icons.male_rounded)),
    CoolDropdownItem<String>(
        label: 'FEMALE',
        value: 'FEMALE',
        selectedIcon: const Icon(Icons.female_rounded),
        icon: const Icon(Icons.female_rounded)),
  ];
  final genderController = DropdownController();

  @override
  void dispose() {
    genderController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CoolDropdown<String>(
      dropdownList: gender,
      controller: genderController,
      onChange: (value) {
        Get.find<Store>().user.gender=value;
      },
      isMarquee: true,
      dropdownOptions: const DropdownOptions(
          top: 20,
          height: 400,
          gap: DropdownGap.all(5),
          borderSide: BorderSide(width: 1, color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 10),
          align: DropdownAlign.left,
          animationType: DropdownAnimationType.size),
      onOpen: (value) {},
      resultOptions: const ResultOptions(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 200,
        icon: SizedBox(
          width: 10,
          height: 10,
          child: CustomPaint(
            painter: DropdownArrowPainter(),
          ),
        ),
        render: ResultRender.all,
        placeholder: "Gender",

        isMarquee: true,
      ),
      dropdownTriangleOptions: const DropdownTriangleOptions(
        width: 20,
        height: 30,
        align: DropdownTriangleAlign.left,
        borderRadius: 3,
        left: 20,
      ),
      dropdownItemOptions: const DropdownItemOptions(
        isMarquee: true,
        mainAxisAlignment: MainAxisAlignment.start,
        render: DropdownItemRender.all,
        height: 50,
      ),
    );
  }
}