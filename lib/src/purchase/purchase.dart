import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rafay_dairies_and_farms/src/components/navbar.dart';
import 'package:rafay_dairies_and_farms/src/components/productcard.dart';
import 'package:rafay_dairies_and_farms/src/purchase/purchase_provider.dart';

class Purchase extends StatefulWidget {
  const Purchase({super.key});

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  String? startDate;
  String? endDate;
  String selectedTile = 'Purchases';

  String? handleDate(DateTime? date) {
    if (date != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      setState(() {});
      return formattedDate;
    }
    return null;
  }

  Future<void> _initialize(PurchaseProvider provider) async {
    await provider.setToken();
    await provider.fetchPurchaseData(token: provider.token);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PurchaseProvider>(
      create: (context) => PurchaseProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          drawer: NavBar(
            selectedTile: selectedTile,
            onTileSelected: (String tileName) {
              setState(() {
                selectedTile = tileName;
              });
            },
          ),
          appBar: AppBar(
            title: const Text('Purchase'),
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<PurchaseProvider>(
                    builder: (context, provider, child) => Container(
                      height: 38.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Start Date',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0.sp),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5.w),
                              ),
                              controller: TextEditingController(
                                text: startDate ?? '',
                              ),
                              textAlign: TextAlign.center,
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                startDate = handleDate(date);
                                provider.setStartDate(startDate ?? '');
                              },
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            flex: 6,
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'End Date',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0.sp),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5.w),
                              ),
                              controller: TextEditingController(
                                text: endDate ?? '',
                              ),
                              textAlign: TextAlign.center,
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                endDate = handleDate(date);
                                provider.setEndDate(endDate ?? '');
                              },
                            ),
                          ),
                          SizedBox(width: 2.8.w),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () => _initialize(provider),
                              child: Container(
                                width: 14.w,
                                height: 52.h,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: .3.sp,
                    color: Colors.black,
                  ),
                  SizedBox(height: 7.h),
                  Consumer<PurchaseProvider>(
                    builder: (context, provider, child) {
                      if (provider.purchaseModel == null) {
                        return const Center(
                          child: Text('Select Dates to Show the list'),
                        );
                      } else if (provider.purchaseModel!.data!.isEmpty) {
                        return const Center(
                          child: Text(
                              'No purchases available for the selected date range.'),
                        );
                      } else {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children:
                                    provider.purchaseModel!.data!.map((item) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 4.h),
                                    child: Productcard(
                                      type: 'Customer',
                                      id: item.id ?? 0,
                                      ty: item.vendor ?? '',
                                      total: double.tryParse(
                                              item.totalPrice ?? '0') ??
                                          0,
                                      date: item.createdAt ?? 'Unknown Date',
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
