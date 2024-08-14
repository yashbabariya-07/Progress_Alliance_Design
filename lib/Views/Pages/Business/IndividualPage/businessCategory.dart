import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class BCategorySheet extends StatefulWidget {
  const BCategorySheet({super.key});

  @override
  State<BCategorySheet> createState() => _BCategorySheetState();
}

class _BCategorySheetState extends State<BCategorySheet> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  final TextEditingController _businessCategoryController =
      TextEditingController();
  final List<String> businessCategories = [
    'Advertising Services',
    'Agriculture & Agro',
    'Automobile',
    'Beauty Care & Cosmetic Product',
    'Chemicals',
    'Computer Hardware & CCTV',
    'Construction Materials',
    'Consultancy & Services',
    'Ecommerce',
    'Education',
    'Electronics & Electricals',
    'Energy & Power',
    'Engineering & Foundry',
    'Financial & Legal Services'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FontsColor.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Text(
                    'Select Business Category',
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f16,
                        fontWeight: FontsWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomeSearchField(
                hintText: 'Search business category...',
                controller: _searchController,
                onChange: (value) {
                  setState(() {
                    _searchQuery.value = value;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Expanded(
                child: ValueListenableBuilder<String>(
                  valueListenable: _searchQuery,
                  builder: (context, query, child) {
                    final filteredCategories =
                        businessCategories.where((category) {
                      return category
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList();
                    return ListView.builder(
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                filteredCategories[index],
                                style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    fontSize: FontsSize.f14),
                              ),
                              onTap: () {
                                _businessCategoryController.text =
                                    filteredCategories[index];
                                Navigator.pop(context);
                              },
                            ),
                            Divider(
                              color: FontsColor.grey,
                              thickness: 0.2,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BSubCategorySheet extends StatefulWidget {
  const BSubCategorySheet({super.key});

  @override
  State<BSubCategorySheet> createState() => _BSubCategorySheetState();
}

class _BSubCategorySheetState extends State<BSubCategorySheet> {
  final TextEditingController _businessSubCategoryController =
      TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  final List<String> businessSubCategories = [
    'Accounting Software',
    'Digital Marketing',
    'ERP Software',
    'IT Industrial Training',
    'Mobile Application Development',
    'SEO',
    'Software Development',
    'Standard Software',
    'Tally Accounting Software',
    'Web Design & Development',
  ];

  final Set<String> selectedSubCategories = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FontsColor.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Select Business Sub Category',
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f16,
                        fontWeight: FontsWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      _businessSubCategoryController.text =
                          selectedSubCategories.join(', ');
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f15,
                        color: FontsColor.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomeSearchField(
                hintText: 'Search business sub-category',
                controller: _searchController,
                onChange: (value) {
                  setState(() {
                    _searchQuery.value = value;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: ValueListenableBuilder<String>(
                  valueListenable: _searchQuery,
                  builder: (context, query, child) {
                    final filteredCategories =
                        businessSubCategories.where((category) {
                      return category
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList();
                    return ListView.builder(
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: Transform.scale(
                                scale:
                                    MediaQuery.of(context).size.height * 0.0012,
                                child: Checkbox(
                                  value:
                                      selectedSubCategories.contains(category),
                                  onChanged: (bool? value) {
                                    if (value == true) {
                                      selectedSubCategories.add(category);
                                    } else {
                                      selectedSubCategories.remove(category);
                                    }

                                    (context as Element).markNeedsBuild();
                                  },
                                ),
                              ),
                              title: Text(
                                category,
                                style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    fontSize: FontsSize.f14),
                              ),
                              onTap: () {
                                if (selectedSubCategories.contains(category)) {
                                  selectedSubCategories.remove(category);
                                } else {
                                  selectedSubCategories.add(category);
                                }

                                (context as Element).markNeedsBuild();
                              },
                            ),
                            Divider(
                              color: FontsColor.grey,
                              thickness: 0.2,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
