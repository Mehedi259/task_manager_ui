import 'package:get/get.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/auth/verify_email_screen.dart';
import '../view/screens/auth/verify_otp_screen.dart';
import '../view/screens/auth/set_new_password_screen.dart';
import '../view/screens/info/help_support_screen.dart';
import '../view/screens/info/privacy_policy_screen.dart';
import '../view/screens/info/terms_screen.dart';
import '../view/screens/profile/account_settings_screen.dart';
import '../view/screens/profile/edit_profile_screen.dart';
import '../view/screens/profile/my_profile_screen.dart';
import '../view/screens/tasks/edit_task_screen.dart';
import '../view/screens/tasks/my_tasks_screen.dart';
import '../view/screens/tasks/add_task_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/tasks/task_details_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verifyEmail = '/verify-email';
  static const String verifyOtp = '/verify-otp';
  static const String setNewPassword = '/set-new-password';
  static const String myTasks = '/my-tasks';
  static const String addTask = '/add-task';
  static const String profile = '/profile';
  static const String taskDetails = '/task-details';
  static const String editTask = '/edit-task';
  static const String myProfile = '/my-profile';
  static const String AccountSetting = '/account-setting';
  static const String editProfile = '/edit-profile';
  static const String termCondition = '/terms-condition';
  static const String privacyPolicy = '/privacy-policy';
  static const String helpSupport = '/help-support';

  static final routes = [
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: verifyOtp, page: () => VerifyOtpScreen(email: 'example@email.com')),
    GetPage(name: setNewPassword, page: () => const SetNewPasswordScreen()),
    GetPage(name: myTasks, page: () => MyTaskScreen()),
    GetPage(name: addTask, page: () => const AddTaskScreen()),
    GetPage(name: editTask, page: () => const EditTaskScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfileScreen()),
    GetPage(name: myProfile, page: () => const MyProfileScreen()),
    GetPage(name: taskDetails, page: () => const TaskDetailsScreen()),
    GetPage(name: AccountSetting, page: () => const AccountSettingScreen()),
    GetPage(name: setNewPassword, page: () => const SetNewPasswordScreen()),
    GetPage(name: termCondition, page: () => const TermsAndConditionsScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: helpSupport, page: () => const HelpSupportScreen()),
  ];
}
