
import 'package:get/get.dart';

// Auth + splash
import 'package:beauty_related/splash_screen.dart';
import 'package:beauty_related/onboarding_screen.dart';
import 'package:beauty_related/auth_screens/login.dart';
import 'package:beauty_related/auth_screens/select_role_screen.dart';
import 'package:beauty_related/auth_screens/Signup1.dart';
import 'package:beauty_related/auth_screens/signup2.dart';
import 'package:beauty_related/auth_screens/terms_condition_screen.dart';
import 'package:beauty_related/auth_screens/privacy_policy.dart';
import 'package:beauty_related/auth_screens/forget_password_screen.dart';
import 'package:beauty_related/auth_screens/otp_verification.dart';
import 'package:beauty_related/auth_screens/update_password.dart';

// Bottom nav + screens
import 'package:beauty_related/OwnersSite/bottomnavigation_screen.dart';

import 'package:beauty_related/OwnersSite/liked_screens.dart';



import 'OwnersSite/profile/profile_screen.dart';
import 'app_routes.dart';

import 'OwnersSite/booking/book_appointment_screen.dart';
import 'OwnersSite/booking/booking_confirm_screen.dart';
import 'OwnersSite/booking/booking_details_review_screen.dart';
import 'OwnersSite/booking/bookings_screens.dart';
import 'OwnersSite/home/details_screen.dart';
import 'OwnersSite/home/feature_experts_screens.dart';
import 'OwnersSite/home/home_screen.dart';
import 'OwnersSite/home/notification_screen.dart';
import 'OwnersSite/home/portfolio_screen.dart';
import 'OwnersSite/home/search_screen.dart';
import 'OwnersSite/profile/account_setting.dart';
import 'OwnersSite/profile/change_password_screen.dart';
import 'OwnersSite/profile/edit_profile.dart';
import 'OwnersSite/profile/reviews_screen.dart';
import 'OwnersSite/write_reviews_screen.dart';
import 'clientSites/account_settings_client.dart';
import 'clientSites/change_passsword_client.dart';
import 'clientSites/client_bookings.dart';
import 'clientSites/client_bottom_nav_bar.dart';
import 'clientSites/client_home_screen.dart';
import 'clientSites/client_profile_screen.dart';
import 'clientSites/edit_profile_screen.dart';
import 'clientSites/notifications_screen.dart';
import 'clientSites/reviews_screen_client.dart';

class AppPages {
  static final pages = [
    // Auth flow
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const Login(),
    ),
    GetPage(
      name: AppRoutes.selectRole,
      page: () => const SelectRoleScreen(),
    ),
    GetPage(
      name: AppRoutes.signupClient,
      page: () => const SignupClient(),
    ),
    GetPage(
      name: AppRoutes.signupOwner,
      page: () => const SignupOwner(),
    ),
    GetPage(
      name: AppRoutes.terms,
      page: () => const TermsAndConditionsScreen(),
    ),
    GetPage(
      name: AppRoutes.privacy,
      page: () => const PrivacyPolicyScreen(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPassword(),
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OTPVerification(),
    ),
    GetPage(
      name: AppRoutes.updatePassword,
      page: () => const UpdatePassword(),
    ),

    // Bottom navigation
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => const BottomNavigationScreen(),
    ),

    // Bottom tab screens
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.liked,
      page: () => const LikedScreens(),
    ),
    GetPage(
      name: AppRoutes.bookings,
      page: () => const BookingsScreens(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
    ),

    // Extra screens
    GetPage(
      name: AppRoutes.accountSetting,
      page: () => const AccountSetting(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.helperDetail,
      page: () => const HelperDetailScreen(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfile(),
    ),
    GetPage(
      name: AppRoutes.featureExperts,
      page: () => const FeatureExpertsScreens(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: AppRoutes.portfolio,
      page: () => const PortfolioScreen(),
    ),
    GetPage(
      name: AppRoutes.reviews,
      page: () => const ReviewsScreen(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.writeReview,
      page: () => const WriteReviewScreen(),
    ),
    GetPage(
      name: AppRoutes.bookAppointment,
      page: () => const BookAppointmentScreen(),
    ),
    GetPage(
      name: AppRoutes.bookingDetailsReview,
      page: () =>  BookingDetailsReviewScreen(serviceName: '', serviceDetail: '', selectedDate: DateTime.now(), selectedTime: '',),
    ),
    GetPage(
      name: AppRoutes.bookingConfirm,
      page: () =>  BookingConfirmScreen()
    ),
    GetPage(
      name: AppRoutes.clientBottomNav,
      page: () =>  ClientBottomNavigationScreen()
    ),
    GetPage(
      name: AppRoutes.clientHome,
      page: () =>  ClientHomescreen()
    ),
    GetPage(
      name: AppRoutes.clientReviews,
      page: () =>  ClientReviewsScreen()
    ),
    GetPage(
      name: AppRoutes.clientBookings,
      page: () =>  ClientBookingsScreens()
    ),
    GetPage(
      name: AppRoutes.clientProfile,
      page: () =>  ClientProfileScreen()
    ),
    GetPage(
      name: AppRoutes.clientNotification,
      page: () =>  ClientNotificationScreen()
    ),
    GetPage(
      name: AppRoutes.clientAccountSetting,
      page: () =>  ClientAccountSetting()
    ),
    GetPage(
      name: AppRoutes.clientChangePassword,
      page: () =>  ClientChangePasswordScreen()
    ),
    GetPage(
      name: AppRoutes.clientEditProfile,
      page: () =>  ClientEditProfile()
    ),
  ];
}