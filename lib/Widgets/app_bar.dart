// ignore_for_file: prefer_const_constructors

import 'package:olx_app/resources/exports.dart';

PreferredSizeWidget buildAppBar(context, String title,
    {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: AppColor.primaryColor,
    elevation: 2,
    centerTitle: true,
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
    automaticallyImplyLeading: true,
    title: Text(
      title,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    actions: actions,
  );
}
