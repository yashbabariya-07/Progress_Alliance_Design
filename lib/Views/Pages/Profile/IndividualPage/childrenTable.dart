import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Pages/Profile/IndividualPage/dialougeCommon.dart';

class ChildTable extends StatefulWidget {
  const ChildTable({super.key});

  @override
  State<ChildTable> createState() => _ChildTableState();
}

class _ChildTableState extends State<ChildTable> {
  List<Map<String, String>> children = [];

  void _addChild() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddChildDialog(
          onAddChild: (childData) {
            setState(() {
              children.add(childData);
            });
          },
        );
      },
    );
  }

  void _editChild(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditChildDialog(
          childData: children[index],
          onSave: (updatedChildData) {
            setState(() {
              children[index] = updatedChildData;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: FontsColor.grey, width: 0.5),
      ),
      child: Table(
        border: TableBorder.all(color: FontsColor.grey, width: 0.5),
        children: [
          TableRow(
            children: [
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f13,
                    fontWeight: FontsWeight.bold,
                    color: const Color.fromARGB(255, 16, 2, 90),
                  ),
                )),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Text(
                  'DOB',
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f13,
                    fontWeight: FontsWeight.bold,
                    color: const Color.fromARGB(255, 16, 2, 90),
                  ),
                )),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Text(
                  'Gender',
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontWeight: FontsWeight.bold,
                    fontSize: FontsSize.f13,
                    color: const Color.fromARGB(255, 16, 2, 90),
                  ),
                )),
              )),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: GestureDetector(
                        onTap: _addChild,
                        child: Icon(
                          Icons.add,
                          size: MediaQuery.of(context).size.width * 0.06,
                        )),
                  ),
                ),
              ),
            ],
          ),
          for (int i = 0; i < children.length; i++)
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        children[i]['name'] ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        children[i]['dob'] ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        children[i]['gender'] ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () => _editChild(i),
                            child: Icon(
                              Icons.edit,
                              size: MediaQuery.of(context).size.width * 0.06,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                children.removeAt(i);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              size: MediaQuery.of(context).size.width * 0.06,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
