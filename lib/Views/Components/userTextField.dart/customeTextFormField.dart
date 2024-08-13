import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class UserCustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const UserCustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontsFamily.inter,
            fontSize: FontsSize.f14,
            color: FontsColor.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: FontsColor.grey, width: 0.5),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: FontsSize.f14,
                fontFamily: FontsFamily.inter,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: FontsColor.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePageSelectionField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback onTap;

  const ProfilePageSelectionField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontsFamily.inter,
            fontSize: FontsSize.f14,
            color: FontsColor.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: FontsColor.grey, width: 0.5),
          ),
          child: InkWell(
            onTap: onTap,
            child: IgnorePointer(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: FontsSize.f14,
                    fontFamily: FontsFamily.inter,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: FontsColor.black,
                      width: 1,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileGenderButton extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final VoidCallback onTap;

  const ProfileGenderButton({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = gender == selectedGender;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? FontsColor.black : FontsColor.grey,
            width: isSelected ? 1 : 0.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gender,
              style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
                color: isSelected ? FontsColor.black : FontsColor.black54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const UserDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontsFamily.inter,
            fontSize: FontsSize.f14,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: FontsColor.grey,
              width: 0.5,
            ),
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: FontsColor.white,
            iconSize: MediaQuery.of(context).size.width * 0.06,
            style: TextStyle(
              fontSize: FontsSize.f14,
              fontFamily: FontsFamily.inter,
              color: FontsColor.black,
            ),
            value: value,
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: FontsSize.f14,
                fontFamily: FontsFamily.inter,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FontsColor.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MaxLineTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final double? labelFontSize;
  final double? hintTextFontSize;
  final FontWeight? labelWeight;

  const MaxLineTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.labelFontSize,
    this.hintTextFontSize,
    this.labelWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontsFamily.inter,
            fontSize: labelFontSize,
            color: FontsColor.black,
            fontWeight: labelWeight,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: FontsColor.grey, width: 0.5),
          ),
          child: TextFormField(
            maxLines: 4,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: hintTextFontSize,
                fontFamily: FontsFamily.inter,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: FontsColor.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PickLocationButton extends StatelessWidget {
  final VoidCallback onTap;

  const PickLocationButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.085,
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.2, color: FontsColor.grey),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Images/map.png",
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Text(
                    "Pick Location",
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f13,
                      color: FontsColor.purple,
                      fontWeight: FontsWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "(Click here to pick location)",
                style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f12,
                  color: FontsColor.grey700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChange;

  const CustomeSearchField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: FontsColor.grey, width: 0.2),
      ),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: FontsSize.f14,
              fontFamily: FontsFamily.inter,
              color: FontsColor.grey700,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              size: MediaQuery.of(context).size.width * 0.06,
              color: FontsColor.orange,
            ),
          ),
          onChanged: onChange),
    );
  }
}
