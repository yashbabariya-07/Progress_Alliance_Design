import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Views/Pages/Business/businessInfo.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({super.key});

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  final TextEditingController _cname = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _businessFormationController =
      TextEditingController();
  final TextEditingController _businessCategoryController =
      TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  final TextEditingController _businessSubCategoryController =
      TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _webURLController = TextEditingController();
  final TextEditingController _businessDescController = TextEditingController();
  File? _bannerImage;
  File? _logoImage;
  bool isValue = false;

  Future<void> _pickBannerImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _bannerImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _picklogoImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    }
  }

  void _showBusinessType(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Business Type',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel_rounded,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    'Retailer',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'Retailer';
                    Navigator.pop(context);
                  },
                ),
                buildDivider(),
                ListTile(
                  title: Text(
                    'WholeSaler/Distributor',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'WholeSaler/Distributor';
                    Navigator.pop(context);
                  },
                ),
                buildDivider(),
                ListTile(
                  title: Text(
                    'Manufacturer',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'Manufacturer';
                    Navigator.pop(context);
                  },
                ),
                buildDivider(),
                ListTile(
                  title: Text(
                    'Supplier',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'Supplier';
                    Navigator.pop(context);
                  },
                ),
                buildDivider(),
                ListTile(
                  title: Text(
                    'Reseller',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'Reseller';
                    Navigator.pop(context);
                  },
                ),
                buildDivider(),
                ListTile(
                  title: Text(
                    'Service Provider',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'Service Provider';
                    Navigator.pop(context);
                  },
                ),
                buildDivider(),
                ListTile(
                  title: Text(
                    'Home Industry',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    _businessTypeController.text = 'Home Industry';
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBusinessFormationType(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Business Formation',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_rounded,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'Sole Proprietorship',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                  ),
                ),
                onTap: () {
                  _businessFormationController.text = 'Sole Proprietorship';
                  Navigator.pop(context);
                },
              ),
              buildDivider(),
              ListTile(
                title: Text(
                  'Limited Liability Partnership',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                  ),
                ),
                onTap: () {
                  _businessFormationController.text =
                      'Limited Liability Partnership';
                  Navigator.pop(context);
                },
              ),
              buildDivider(),
              ListTile(
                title: Text(
                  'Private Limited',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                  ),
                ),
                onTap: () {
                  _businessFormationController.text = 'Private Limited';
                  Navigator.pop(context);
                },
              ),
              buildDivider(),
              ListTile(
                title: Text(
                  'Partnership Firm',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                  ),
                ),
                onTap: () {
                  _businessFormationController.text = 'Partnership Firm';
                  Navigator.pop(context);
                },
              ),
              buildDivider(),
              ListTile(
                title: Text(
                  'Consulting',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                  ),
                ),
                onTap: () {
                  _businessFormationController.text = 'Consulting';
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
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

  void _showSubBusinessCategory(BuildContext context) {
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

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Scaffold(
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
                            fontFamily: 'Inter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
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
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search business sub-category',
                      hintStyle:
                          TextStyle(fontSize: 15.sp, fontFamily: 'Inter'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.orange,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                    onChanged: (value) {
                      _searchQuery.value = value;
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
                                    scale: MediaQuery.of(context).size.height *
                                        0.0012,
                                    child: Checkbox(
                                      value: selectedSubCategories
                                          .contains(category),
                                      onChanged: (bool? value) {
                                        if (value == true) {
                                          selectedSubCategories.add(category);
                                        } else {
                                          selectedSubCategories
                                              .remove(category);
                                        }

                                        (context as Element).markNeedsBuild();
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    category,
                                    style: TextStyle(
                                        fontFamily: 'Inter', fontSize: 14.sp),
                                  ),
                                  onTap: () {
                                    if (selectedSubCategories
                                        .contains(category)) {
                                      selectedSubCategories.remove(category);
                                    } else {
                                      selectedSubCategories.add(category);
                                    }

                                    (context as Element).markNeedsBuild();
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
            "Business Details",
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
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Businessinfo(
                      name: _cname.text,
                      type: _businessTypeController.text,
                      category: _businessCategoryController.text,
                      subCategory: _businessSubCategoryController.text,
                      product: _productController.text,
                      gstNo: _gstController.text,
                      number: _phoneController.text,
                      email: _emailController.text,
                      website: _webURLController.text,
                      teamSize: '',
                      formation: _businessFormationController.text,
                      establish: _date.text,
                      about: _businessDescController.text,
                      logoImage: _logoImage,
                      bannerImage: _bannerImage,
                      shopNumber: '',
                      streetName: '',
                      area: '',
                      landmark: '',
                      pincode: '',
                      state: '',
                      city: '',
                      facebook: '',
                      linkedin: '',
                      instagram: '',
                      youtube: '',
                      google: '',
                    ),
                  ),
                );
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15.sp,
                  color: const Color.fromARGB(255, 16, 2, 90),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company Name',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        controller: _cname,
                        decoration: InputDecoration(
                          hintText: 'Enter your company name',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
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
                      'Primary Business',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: MediaQuery.of(context).size.height * 0.0014,
                            child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.white),
                                child: Checkbox(
                                    value: isValue,
                                    onChanged: (value) {
                                      setState(() {
                                        isValue = value!;
                                      });
                                    })),
                          ),
                          Text(
                            "Is this your primary business?",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ],
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
                      'Business Established Date',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2050),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              _date.text =
                                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                            });
                          }
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _date,
                            decoration: InputDecoration(
                              hintText: 'Business established date',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Type',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: InkWell(
                              onTap: () {
                                _showBusinessType(context);
                              },
                              child: IgnorePointer(
                                child: TextFormField(
                                  controller: _businessTypeController,
                                  decoration: InputDecoration(
                                    hintText: 'select your business type',
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
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
                                      Icons.arrow_drop_down,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Formation',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: InkWell(
                              onTap: () {
                                _showBusinessFormationType(context);
                              },
                              child: IgnorePointer(
                                child: TextFormField(
                                  controller: _businessFormationController,
                                  decoration: InputDecoration(
                                    hintText: 'select your business formation',
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
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
                                      Icons.arrow_drop_down,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                      'Business Category',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                              hintText: 'select your business category',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Business Sub Category',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: InkWell(
                        onTap: () {
                          _showSubBusinessCategory(context);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _businessSubCategoryController,
                            decoration: InputDecoration(
                              hintText: 'select your sub business category',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product/Service',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _productController,
                            decoration: InputDecoration(
                              hintText: 'select your products/service',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Email',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
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
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'Enter your business ',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Number',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
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
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: 'enter your contact number',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
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
                              ),
                            ),
                          ),
                        ],
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
                      "GST Number",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        controller: _gstController,
                        decoration: InputDecoration(
                          hintText: 'Enter your GST number',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
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
                      "Website URL",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
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
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        controller: _webURLController,
                        decoration: InputDecoration(
                          hintText: 'Enter your website url',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
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
                      "Business Description",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        maxLines: 4,
                        controller: _businessDescController,
                        decoration: InputDecoration(
                          hintText: 'Enter your business description',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Logo",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.006,
                      ),
                      InkWell(
                        onTap: _picklogoImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: _logoImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _logoImage!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "+ Add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14.sp,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Banner",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    InkWell(
                      onTap: _pickBannerImage,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: _bannerImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  _bannerImage!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: Text(
                                  "+ Add",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}