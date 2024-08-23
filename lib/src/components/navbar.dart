import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafay_dairies_and_farms/src/Expense/expense.dart';
import 'package:rafay_dairies_and_farms/src/Home/home.dart';
import 'package:rafay_dairies_and_farms/src/Sale/sales.dart';
import 'package:rafay_dairies_and_farms/src/login/login.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';
import 'package:rafay_dairies_and_farms/src/payments/payment.dart';
import 'package:rafay_dairies_and_farms/src/purchase/purchase.dart';

class NavBar extends StatelessWidget {
  final String selectedTile;
  final ValueChanged<String> onTileSelected;

  NavBar({required this.selectedTile, required this.onTileSelected});
  final UserPrefrences userPrefrences = UserPrefrences();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10.sp, 0, 10.sp),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30.sp, 5, 4.sp, 0),
              child: Container(
                height: 90.h,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.sp,
                      backgroundImage: AssetImage('lib/data/assets/logo.png'),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rafay',
                          style: TextStyle(
                              fontSize: 20.sp, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'dairies & farms',
                          style: TextStyle(
                              fontSize: 16.sp, fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: .2.sp,
              color: Colors.black,
            ),
            // List of ListTiles
            Column(
              children: [
                _buildListTile(
                  context,
                  icon: Icons.dashboard,
                  title: "Dashboard",
                  selectedTile: selectedTile,
                  tileName: 'Dashboard',
                  onTileSelected: onTileSelected,
                  destination: const Home(),
                ),
                _buildListTile(
                  context,
                  icon: Icons.shopping_cart,
                  title: "Purchases",
                  selectedTile: selectedTile,
                  tileName: 'Purchases',
                  onTileSelected: onTileSelected,
                  destination: const Purchase(),
                ),
                _buildListTile(
                  context,
                  icon: Icons.shopping_bag_rounded,
                  title: "Sales",
                  selectedTile: selectedTile,
                  tileName: 'Sales',
                  onTileSelected: onTileSelected,
                  destination: const Sales(),
                ),
                _buildListTile(
                  context,
                  iconPath: 'lib/data/assets/payment.png',
                  title: "Payments",
                  selectedTile: selectedTile,
                  tileName: 'Payments',
                  onTileSelected: onTileSelected,
                  destination: const Payment(),
                ),
                _buildListTile(
                  context,
                  icon: Icons.attach_money_outlined,
                  title: "Expenses",
                  selectedTile: selectedTile,
                  tileName: 'Expenses',
                  onTileSelected: onTileSelected,
                  destination: const Expense(),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("SignOut"),
              onTap: () {
                userPrefrences.RemoveUser();
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a ListTile
  Widget _buildListTile(BuildContext context,
      {IconData? icon,
      String? iconPath,
      required String title,
      required String selectedTile,
      required String tileName,
      required ValueChanged<String> onTileSelected,
      required Widget destination}) {
    final isSelected = selectedTile == tileName;

    return ListTile(
      leading: iconPath != null
          ? ImageIcon(
              AssetImage(iconPath),
              color: isSelected ? Colors.blue : Colors.black,
            )
          : Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.black,
            ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: () {
        onTileSelected(tileName);
        Navigator.pop(context); // Close the drawer
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
    );
  }
}
