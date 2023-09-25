import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_bistro/utils/toast.dart';
import 'package:flutter/material.dart';

class Auth {
  static Future<bool> userExist(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  static void login(
    BuildContext context,
    String email,
    String password,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        Toast.alert(
          context,
          "Logged In Successfully",
          AlertType.success,
        );
        Navigator.of(context).pushReplacementNamed("/dashboard");
      }
    } catch (e) {
      if (context.mounted) {
        Toast.alert(
          context,
          e.toString(),
          AlertType.error,
        );
      }
    }
  }

  static void register(
    BuildContext context,
    String email,
    String password,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        Toast.alert(
          context,
          "Logged In Successfully",
          AlertType.success,
        );
        Navigator.of(context).pushReplacementNamed("/login");
      }
    } catch (e) {
      if (context.mounted) {
        Toast.alert(
          context,
          e.toString(),
          AlertType.error,
        );
      }
    }
  }

  static void resetPassword(
    BuildContext context,
    String email,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      if (context.mounted) {
        Toast.alert(
          context,
          "Passoword Request Link Sent !",
          AlertType.success,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Toast.alert(
          context,
          e.toString(),
          AlertType.error,
        );
      }
    }
  }

  static void logout(
    BuildContext context,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      if (context.mounted) {
        Toast.alert(
          context,
          "Signed Out Successfully",
          AlertType.success,
        );
        Navigator.of(context).pushReplacementNamed("/login");
      }
    } catch (e) {
      if (context.mounted) {
        Toast.alert(
          context,
          e.toString(),
          AlertType.error,
        );
      }
    }
  }
}
