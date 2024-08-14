import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/Button/CommonButton.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class AskPage extends StatefulWidget {
  const AskPage({super.key});

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  String selected = "";
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  final TextEditingController _businessCategoryController =
      TextEditingController();
  final TextEditingController _description = TextEditingController();

  Widget _buildContainer(String label, Color color) {
    bool isSelected = selected == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = isSelected ? "" : label;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.045,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: isSelected ? color : FontsColor.transparent,
          border: Border.all(
              width: 1,
              color: isSelected ? FontsColor.transparent : FontsColor.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f13,
              fontWeight: isSelected ? FontsWeight.bold : FontWeight.normal,
              color: isSelected ? FontsColor.white : FontsColor.black,
            ),
          ),
        ),
      ),
    );
  }

  void _showBusinessCategory(BuildContext context) {
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

    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: BgColor.white,
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
                      _searchQuery.value = value;
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
                                buildDivider(),
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
      },
    );
  }

  Divider buildDivider() {
    return Divider(
      color: FontsColor.grey,
      thickness: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: AppBar(
          backgroundColor: BgColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Add Ask",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                CustomeSearchField(
                  hintText: 'Search by product and service',
                  controller: _searchController,
                  onChange: (value) {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Business Category",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
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
                        onTap: () {
                          _showBusinessCategory(context);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _businessCategoryController,
                            decoration: InputDecoration(
                              hintText: 'select category',
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
                                Icons.arrow_forward_ios_rounded,
                                color: FontsColor.grey,
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MaxLineTextField(
                  label: "Description",
                  hintText: 'Write brief description for your ask....',
                  controller: _description,
                  labelFontSize: FontsSize.f13,
                  hintTextFontSize: FontsSize.f13,
                  labelWeight: FontsWeight.bold,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Time Duration",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        fontWeight: FontsWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: MediaQuery.of(context).size.width * 0.03,
                    runSpacing: MediaQuery.of(context).size.height * 0.015,
                    children: [
                      _buildContainer("Inquiry", FontsColor.green),
                      _buildContainer("Urgent", Colors.red),
                      _buildContainer("In 1 Month", FontsColor.blue),
                      _buildContainer("In 2 Month", FontsColor.orange),
                      _buildContainer("In 3 Month", FontsColor.yellow),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CommonButton(text: "Submit", onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
