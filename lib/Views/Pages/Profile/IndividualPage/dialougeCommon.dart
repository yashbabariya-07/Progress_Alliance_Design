import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class ProfileOption extends StatefulWidget {
  const ProfileOption({super.key});

  @override
  State<ProfileOption> createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
  File? _profileImage;
  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Profile Photo',
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              fontWeight: FontsWeight.bold,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.remove_red_eye,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              'View Profile',
              style: TextStyle(
                  fontWeight: FontsWeight.bold,
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14),
            ),
            onTap: () {
              Navigator.pop(context);
              _pickProfileImage();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.note_alt_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              'Change Profile',
              style: TextStyle(
                  fontWeight: FontsWeight.bold,
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14),
            ),
            onTap: () {
              Navigator.pop(context);
              _pickProfileImage();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.delete,
              size: MediaQuery.of(context).size.width * 0.06,
              color: Colors.red,
            ),
            title: Text(
              'Remove Profile',
              style: TextStyle(
                color: Colors.red,
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
                fontWeight: FontsWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _profileImage = null;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AddChildDialog extends StatefulWidget {
  final Function(Map<String, String>) onAddChild;

  const AddChildDialog({super.key, required this.onAddChild});

  @override
  _AddChildDialogState createState() => _AddChildDialogState();
}

class _AddChildDialogState extends State<AddChildDialog> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  String _gender = 'Boy';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: FontsColor.white,
      title: Text(
        'Add Child',
        style: TextStyle(
          fontFamily: FontsFamily.inter,
          fontSize: FontsSize.f18,
          fontWeight: FontsWeight.bold,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
              ),
            ),
          ),
          TextField(
            controller: dobController,
            decoration: InputDecoration(
              labelText: 'DOB',
              labelStyle: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  dobController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                });
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'Gender',
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
            ),
          ),
          DropdownButtonFormField<String>(
            value: _gender,
            items: ['Boy', 'Girl']
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _gender = value!;
              });
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FontsColor.black,
                  width: 1,
                ),
              ),
            ),
            style: TextStyle(
              fontSize: FontsSize.f14,
              fontFamily: FontsFamily.inter,
              color: FontsColor.black,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
              color: FontsColor.black,
              fontWeight: FontsWeight.bold,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(
            'Add',
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
              color: FontsColor.black,
              fontWeight: FontsWeight.bold,
            ),
          ),
          onPressed: () {
            widget.onAddChild({
              'name': nameController.text,
              'dob': dobController.text,
              'gender': _gender,
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class EditChildDialog extends StatefulWidget {
  final Map<String, String> childData;
  final Function(Map<String, String>) onSave;

  const EditChildDialog({
    Key? key,
    required this.childData,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditChildDialogState createState() => _EditChildDialogState();
}

class _EditChildDialogState extends State<EditChildDialog> {
  late TextEditingController nameController;
  late TextEditingController dobController;
  late String _gender;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.childData['name']);
    dobController = TextEditingController(text: widget.childData['dob']);
    _gender = widget.childData['gender'] ?? 'Girl';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: FontsColor.white,
      title: Text(
        'Edit Child',
        style: TextStyle(
          fontFamily: FontsFamily.inter,
          fontSize: FontsSize.f18,
          fontWeight: FontsWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
                ),
              ),
            ),
            TextField(
              controller: dobController,
              decoration: InputDecoration(
                labelText: 'DOB',
                labelStyle: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    dobController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Gender',
              style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
              ),
            ),
            DropdownButtonFormField<String>(
              value: _gender,
              items: ['Boy', 'Girl']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _gender = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FontsColor.black,
                    width: 1,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: FontsSize.f14,
                fontFamily: FontsFamily.inter,
                color: FontsColor.black,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
              color: FontsColor.black,
              fontWeight: FontsWeight.bold,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(
            'Save',
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
              color: FontsColor.black,
              fontWeight: FontsWeight.bold,
            ),
          ),
          onPressed: () {
            widget.onSave({
              'name': nameController.text,
              'dob': dobController.text,
              'gender': _gender,
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
