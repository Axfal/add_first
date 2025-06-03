import 'package:olx_app/resources/exports.dart';

class SubCategoryItems extends StatefulWidget {
  final String title;
  final List<Subcategories> subcategories;

  const SubCategoryItems({
    super.key,
    required this.title,
    required this.subcategories,
  });

  @override
  State<SubCategoryItems> createState() => _SubCategoryItemsState();
}

class _SubCategoryItemsState extends State<SubCategoryItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, widget.title),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: ListView.separated(
          itemCount: widget.subcategories.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final sub = widget.subcategories[index];
            return InkWell(
              onTap: () {
                // Handle navigation to next sub-subcategory screen
              },
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        sub.categoryIcon ?? '',
                        width: 48.w,
                        height: 48.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: 40.w,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Text(
                        sub.categoryName ?? 'No Name',
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 24.w,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
