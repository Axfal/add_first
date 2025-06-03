class AppUrl {
  static const String baseUrl = 'https://adfirst.pk/olx/API';
  static const String signIn = "$baseUrl/signin.php";
  static const String signUp = "$baseUrl/signup.php";
  static const String verifyOTP = "$baseUrl/verify_otp.php";
  static const String signInOTP = "$baseUrl/signin_otp.php"; // forgot password
  static const String logOut = "$baseUrl/logout.php";
  static const String getCategory = "$baseUrl/category.php";
  static const String getAttribute = "$baseUrl/attributes.php?category_id=";
  static const String submitForm = "$baseUrl/submit_ad.php";
  static const String getBanners = '$baseUrl/get_adds.php'; /// get adds/ banners
}
