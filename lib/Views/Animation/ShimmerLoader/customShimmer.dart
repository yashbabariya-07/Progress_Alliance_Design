import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustom extends StatefulWidget {
  const ShimmerCustom({super.key});

  @override
  State<ShimmerCustom> createState() => _ShimmerCustomState();
}

class _ShimmerCustomState extends State<ShimmerCustom>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: FontsColor.grey300!,
        highlightColor: FontsColor.grey100!,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FontsColor.grey200),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.062,
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: FontsColor.grey200),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: FontsColor.grey200),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey300),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey300),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey300),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: FontsColor.grey300),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: FontsColor.grey300),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey300),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const CustomeRow(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012,
                            ),
                            const CustomeRow(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const CustomeRow(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const CustomeRow(),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const CustomeRow(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const CustomeRow(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const CustomeRow(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const CustomeRow(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class CustomeRow extends StatelessWidget {
  const CustomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: FontsColor.grey300,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.022,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: FontsColor.grey300,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: FontsColor.grey300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
