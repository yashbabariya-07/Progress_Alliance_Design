import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          color: isSelected ? color : Colors.transparent,
          border: Border.all(
              width: 1, color: isSelected ? Colors.transparent : Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13.sp,
              color: isSelected ? Colors.white : Colors.black,
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
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Scaffold(
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
                            fontFamily: 'Inter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.2),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          labelText: 'Search business category...',
                          labelStyle:
                              TextStyle(fontSize: 14.sp, fontFamily: 'Inter'),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          prefixIcon: Icon(
                            Icons.search,
                            size: MediaQuery.of(context).size.width * 0.06,
                            color: Colors.orange,
                          )),
                      onChanged: (value) {
                        _searchQuery.value = value;
                      },
                    ),
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
                                        fontFamily: 'Inter', fontSize: 14.sp),
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
    return const Divider(
      color: Colors.grey,
      thickness: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Add Ask",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 0.2),
                  ),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search by product and service',
                      labelStyle: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Inter',
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(
                        Icons.search,
                        size: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.orange,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
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
                          fontFamily: 'Inter',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
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
                                fontSize: 13.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Write brief description for your ask....',
                        hintStyle: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Inter',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Time Duration",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
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
                      _buildContainer("Inquiry", Colors.green),
                      _buildContainer("Urgent", Colors.red),
                      _buildContainer("In 1 Month", Colors.blue),
                      _buildContainer("In 2 Month", Colors.orange),
                      _buildContainer("In 3 Month", Colors.yellow),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 2, 90),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}