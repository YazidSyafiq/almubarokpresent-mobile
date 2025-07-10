import 'package:almubarok_present/utils/environment.dart';

class Endpoint {
  // Base Url
  static String baseUrl = Environment.production;

  // Login
  static String login = '$baseUrl/login';

  // Logout
  static String logout = '$baseUrl/logout';

  // Change Password
  static String changePassword = '$baseUrl/change-password';

  // FCM Token
  static String registerFCMToken = '$baseUrl/fcm-token-register';

  // Profile
  static String getProfile = '$baseUrl/profile';
  static String updateProfile = '$baseUrl/profile-update';

  // History
  static String getAttendanceMonth = '$baseUrl/attendance/month';
  static String getAttendanceYear = '$baseUrl/attendance/year';

  // Leave
  static String getLeave = '$baseUrl/leave/get';
  static String getLeaveDetail = '$baseUrl/leave/getDetail';
  static String requestLeave = '$baseUrl/leave/create';

  // Attendance
  static String getAttendanceToday = '$baseUrl/attendance/today';
  static String getSetupAttendance = '$baseUrl/attendance/setup';
  static String registerFace = '$baseUrl/face';
  static String submitAttendance = '$baseUrl/attendance/presensi';
  static String bannedAkun = '$baseUrl/banned';
}
