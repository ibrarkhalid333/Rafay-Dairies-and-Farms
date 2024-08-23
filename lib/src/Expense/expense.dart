import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rafay_dairies_and_farms/src/Expense/expense_card.dart';
import 'package:rafay_dairies_and_farms/src/Expense/expense_provider.dart';
import 'package:rafay_dairies_and_farms/src/components/navbar.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  String? startDate;
  String? endDate;
  String selectedTile = 'Expenses';

  String? handleDate(DateTime? date) {
    if (date != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      setState(() {});
      return formattedDate;
    }
    return null;
  }

  double _parseStringToDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 0.0;
    }

    String cleanedValue = value.replaceAll(',', '').trim();

    return double.tryParse(cleanedValue) ?? 0.0;
  }

  Future<void> _initialize(ExpenseProvider provider) async {
    await provider.setToken();
    await provider.fetchExpenseData(token: provider.token);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExpenseProvider>(
      create: (context) => ExpenseProvider(),
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
            title: Text('Expenses'),
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<ExpenseProvider>(
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
                    thickness: .4.sp,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10.h),
                  Consumer<ExpenseProvider>(
                    builder: (context, provider, child) {
                      if (provider.expenseModel == null) {
                        return const Center(
                          child: Text('Select Dates to Show the list'),
                        );
                      } else if (provider.expenseModel!.data!.isEmpty) {
                        return const Center(
                          child: Text(
                              'No data available for the selected date range.'),
                        );
                      } else {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children:
                                    provider.expenseModel!.data!.map((item) {
                                  double parsedAmount =
                                      _parseStringToDouble(item.amount);
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: ExpenseCard(
                                      id: item.id ?? 0,
                                      amount: parsedAmount,
                                      description: item.description ?? "",
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
