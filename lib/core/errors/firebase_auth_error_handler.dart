import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';

class AuthErrorHandler {
  static String handle(dynamic error) {
    if (error is FirebaseAuthException) {
      return _mapFirebaseErrorCode(error.code);
    }
    if (error is SocketException) {
      return 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة وإعادة المحاولة.';
    }
    if (error is TimeoutException) {
      return 'انتهت مهلة الطلب. يرجى المحاولة مرة أخرى لاحقاً.';
    }
    return 'حدث خطأ غير متوقع . يرجى المحاولة ثانية.';
  }
  static String _mapFirebaseErrorCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مسجل بالفعل. حاول تسجيل الدخول.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً. يرجى استخدام كلمة مرور أقوى.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
      case 'user-disabled':
        return 'هذا الحساب تم تعطيله من قبل الإدارة.';
      case 'invalid-email':
        return 'تنسيق البريد الإلكتروني غير صحيح.';
      case 'operation-not-allowed':
        return 'عملية تسجيل الدخول هذه غير مفعلة حالياً.';
      case 'too-many-requests':
        return 'تم حظر الطلبات مؤقتاً لكثرة المحاولات. حاول بعد قليل.';
      case 'network-request-failed':
        return 'فشل الاتصال بالخادم. تأكد من اتصالك بالإنترنت.';
      case 'expired-action-code':
        return 'انتهت صلاحية رمز التحقق.';
      default:
        return 'حدث خطأ في عملية المصادقة : $code).';
    }
  }
}
