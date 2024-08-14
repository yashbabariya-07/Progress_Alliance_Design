import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class BTypeSheet extends StatefulWidget {
  const BTypeSheet({super.key});

  @override
  State<BTypeSheet> createState() => _BTypeSheetState();
}

class _BTypeSheetState extends State<BTypeSheet> {
  final TextEditingController _businessTypeController = TextEditingController();

  Divider buildDivider() {
    return Divider(
      color: FontsColor.grey,
      thickness: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
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
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f16,
                    fontWeight: FontsWeight.bold,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
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
  }
}

class BFormationTypeSheet extends StatefulWidget {
  const BFormationTypeSheet({super.key});

  @override
  State<BFormationTypeSheet> createState() => _BFormationTypeSheetState();
}

class _BFormationTypeSheetState extends State<BFormationTypeSheet> {
  final TextEditingController _businessFormationController =
      TextEditingController();
  Divider buildDivider() {
    return Divider(
      color: FontsColor.grey,
      thickness: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f16,
                  fontWeight: FontsWeight.bold,
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
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
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
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
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
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
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
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
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
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f14,
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
  }
}
