import 'package:event_app/core/services/snackbar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthUtils {
  static Future<bool> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackBarService.showSuccessSnackBar('account created successfully');
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('the password provided is too week');
        SnackBarService.showErrorSnackBar('the password provided is too week');
      } else if (e.code == 'email-already-in-use') {
        print('the account already exists for that email');
        SnackBarService.showErrorSnackBar(
          'the account already exists for that email',
        );
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      SnackBarService.showErrorSnackBar('something went wrong');
      return Future.value(false);
    }
  }

  static Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackBarService.showSuccessSnackBar('signed in successfully');
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarService.showErrorSnackBar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('wrong password provided for that user.');
        SnackBarService.showErrorSnackBar(
          'wrong password provided for that user.',
        );
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      SnackBarService.showErrorSnackBar('something went wrong');
      return Future.value(false);
    }
  }
}
