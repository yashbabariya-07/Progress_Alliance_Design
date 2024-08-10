import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class ConnectCustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const ConnectCustomTextField({
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
              fontWeight: FontsWeight.bold),
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
                fontSize: FontsSize.f13,
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

class ConnectPageSelectionField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback onTap;

  const ConnectPageSelectionField({
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
              fontWeight: FontsWeight.bold),
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
                    fontSize: FontsSize.f13,
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

class GenderButton extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final VoidCallback onTap;
  final String iconPath;

  const GenderButton({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = gender == selectedGender;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.28,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? FontsColor.purple : FontsColor.grey,
            width: isSelected ? 1 : 0.5,
          ),
          color: isSelected ? FontsColor.white : FontsColor.grey100,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SizedBox(width: 5),
            Text(
              gender,
              style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
                  color: isSelected ? FontsColor.purple : FontsColor.black54,
                  fontWeight: FontsWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
