import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/Views/Animation/PageTransition/CustomePageTransition.dart';
import 'package:progress_alliance/Views/Pages/Business/bAddress.dart';
import 'package:progress_alliance/Views/Pages/Business/bDetail.dart';
import 'package:progress_alliance/Views/Pages/Business/businessInfo.dart';
import 'package:progress_alliance/Views/Pages/Business/socialAcc.dart';
import 'package:progress_alliance/Views/Pages/Drawer%20Filed/Complaint/addComplaint.dart';
import 'package:progress_alliance/Views/Pages/Drawer%20Filed/Complaint/complaint.dart';
import 'package:progress_alliance/Views/Pages/Drawer%20Filed/Contact%20Us/contactUs.dart';
import 'package:progress_alliance/Views/Pages/Drawer%20Filed/Downloads/bookview.dart';
import 'package:progress_alliance/Views/Pages/Drawer%20Filed/Downloads/download.dart';
import 'package:progress_alliance/Views/Pages/Drawer%20Filed/Feedback/feedback.dart';
import 'package:progress_alliance/Views/Pages/Member%20Directory/cityPAdetail.dart';
import 'package:progress_alliance/Views/Pages/Member%20Directory/cityPartner.dart';
import 'package:progress_alliance/Views/Pages/Member%20Directory/citygrowthPartner.dart';
import 'package:progress_alliance/Views/Pages/Member%20Directory/directory.dart';
import 'package:progress_alliance/Views/Pages/Member%20Directory/growthPartner.dart';
import 'package:progress_alliance/Views/Pages/MyQr_Code/scanner.dart';
import 'package:progress_alliance/Views/Pages/Home/Notification/detail.dart';
import 'package:progress_alliance/Views/Pages/Home/Notification/notification_detail.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/PAbusiness.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/company_detail.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/industry.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/member_detail.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/services.dart';
import 'package:progress_alliance/Views/Pages/Profile/basic.dart';
import 'package:progress_alliance/Views/Pages/Profile/fdetail.dart';
import 'package:progress_alliance/Views/Pages/Profile/gSearch.dart';
import 'package:progress_alliance/Views/Pages/Profile/rdetail.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/ask.dart';
import 'package:progress_alliance/Views/Pages/GooglePage/googleMap.dart';
import 'package:progress_alliance/Views/Pages/Home/home.dart';
import 'package:progress_alliance/Views/Pages/Profile/profile.dart';
import 'package:progress_alliance/Views/Pages/Home/homeSearch.dart';
import 'package:progress_alliance/Views/Pages/Login/login.dart';
import 'package:progress_alliance/Views/Pages/Login/otp.dart';
import 'package:progress_alliance/Views/Pages/Login/stayConnect.dart';
import 'package:progress_alliance/Views/Pages/MyQr_Code/qr.dart';
import 'package:progress_alliance/Views/Pages/Home/Notification/notification.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Views/Pages/SearchArea/search.dart';
import 'package:progress_alliance/Views/Pages/Splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool shouldUseCustomTransition(String? routeName) {
    final noTransitionRoutes = [
      Routes.homeRoute,
      Routes.paBusinessRoute,
      Routes.googleMapRoute,
      Routes.memberRoute,
      Routes.businessRoute,
      Routes.profileRoute,
    ];
    return !noTransitionRoutes.contains(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashRoute,
          theme: ThemeData(
            useMaterial3: true,
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageTransitionsBuilder(
                  condition: shouldUseCustomTransition,
                ),
                TargetPlatform.iOS: CustomPageTransitionsBuilder(
                  condition: shouldUseCustomTransition,
                ),
              },
            ),
          ),
          routes: {
            Routes.loginRoute: (context) => const LoginPage(),
            Routes.homeRoute: (context) => const HomePage(),
            Routes.splashRoute: (context) => const SplashPage(),
            Routes.profileRoute: (context) => const Profile(
                  gender: '',
                  dob: '',
                  marriage: '',
                  mobile: '',
                  weight: '',
                  bgroup: '',
                  spouseName: '',
                  spouseDOB: '',
                  emgName: '',
                  emgNumber: '',
                ),
            Routes.basicDetailRoute: (context) => const BasicDetail(),
            Routes.familyDetailRoute: (context) => const FamilyDetail(),
            Routes.locationRoute: (context) => const ResidentialDetail(),
            Routes.mapRoute: (context) => const Google(),
            Routes.businessRoute: (context) => const Businessinfo(
                  name: '',
                  type: '',
                  category: '',
                  subCategory: '',
                  product: '',
                  gstNo: '',
                  number: '',
                  email: '',
                  website: '',
                  teamSize: '',
                  formation: '',
                  establish: '',
                  about: '',
                  shopNumber: '',
                  streetName: '',
                  area: '',
                  landmark: '',
                  pincode: '',
                  state: '',
                  city: '',
                  facebook: '',
                  linkedin: '',
                  instagram: '',
                  youtube: '',
                  google: '',
                ),
            Routes.businessDetailRoute: (context) => const BusinessDetail(),
            Routes.businessAddressRoute: (context) => const BusinessAddress(),
            Routes.socialAccountRoute: (context) => const SocialAccount(),
            Routes.otpRoute: (context) => const OTPPage(),
            Routes.connectRoute: (context) => const Connected(),
            Routes.memberRoute: (context) => const MemberDirectory(),
            Routes.growthPartnerRoute: (context) => const Growthpartner(),
            Routes.askRoute: (context) => const AskPage(),
            Routes.paBusinessRoute: (context) => const Pabusiness(),
            Routes.googleMapRoute: (context) => const Googlemap(),
            Routes.searchPlaceRoute: (context) => const SearchPlace(),
            Routes.ServiceRoute: (context) => const AdService(),
            Routes.qrRoute: (context) => const QrCodePage(),
            Routes.scannerRoute: (context) => const ScannerPage(),
            Routes.industrieRoute: (context) => const Retailer(),
            Routes.companyDetailRoute: (context) => const CompanyDetail(),
            Routes.memberDetailRoute: (context) => const MemberDetail(),
            Routes.notificationRoute: (context) => const NotificationPage(),
            Routes.notificationDetailRoute: (context) =>
                const NotificationDetail(),
            Routes.detailPersonRoute: (context) => const DeatailPage(),
            Routes.ComplaintRoute: (context) => const ComplaintPage(),
            Routes.addComplaintRoute: (context) => const Addcomplaint(),
            Routes.downloadRoute: (context) => const Download(),
            Routes.pdfviewRoute: (context) => const BookView(
                  pdfPath: '',
                ),
            Routes.cityDetailRoute: (context) => const CityPartner(),
            Routes.citygrowthPartnerRoute: (context) =>
                const CityGrowthPartner(),
            Routes.paDetailRoute: (context) => const PADetail(),
            Routes.feedbackRoute: (context) => const FeedbackPage(),
            Routes.contactRoute: (context) => const ContactUs(),
            Routes.homeSearchRoute: (context) => const Homesearch(),
          },
        );
      },
    );
  }
}
