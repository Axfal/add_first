// ignore_for_file: prefer_const_constructors

import 'package:olx_app/Screens/Sell/form_screen.dart';
import 'package:olx_app/Screens/Sell/sell_02.dart';
import 'package:olx_app/resources/exports.dart';

class Sell01 extends StatefulWidget {
  const Sell01({super.key});

  @override
  State<Sell01> createState() => _Sell01State();
}

class _Sell01State extends State<Sell01> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.getCategory?.categories ?? [];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: buildAppBar(context, "Sell Now"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose a category",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final categoryName = category.categoryName ?? "Unnamed";
                  final iconPath = category.categoryIcon;
                  final categoryId = category.id ?? 0;

                  return CategoriesItemCard(
                    text: categoryName,
                    iconPath: iconPath,
                    icon: Icons.arrow_forward_ios,
                    onTap: () {
                      if (category.subcategories!.isEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DynamicPostFormScreen(categoryId: categoryId),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Sell02(categories: category),
                          ),
                        );
                      }
                    },
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
