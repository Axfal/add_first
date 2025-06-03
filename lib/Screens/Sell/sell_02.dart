// ignore_for_file: prefer_const_constructors

import 'package:olx_app/Screens/Sell/form_screen.dart';
import 'package:olx_app/resources/exports.dart';

class Sell02 extends StatefulWidget {
  final Categories categories;
  const Sell02({super.key, required this.categories});

  @override
  State<Sell02> createState() => _Sell02State();
}

class _Sell02State extends State<Sell02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Sub Category'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "Choose a sub category",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                itemCount: widget.categories.subcategories?.length ?? 0,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final subcategory = widget.categories.subcategories![index];
                  final categoryId = subcategory.id ?? 0;
                  return GestureDetector(
                    onTap: () {
                      print("category id: $categoryId ");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DynamicPostFormScreen(categoryId: categoryId)),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subcategory.categoryName ?? 'Subcategory',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey[700]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
