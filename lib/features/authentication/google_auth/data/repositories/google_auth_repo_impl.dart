import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/exceptions/failures.dart';
import 'package:socshea/utils/exceptions/firebase_auth_exception.dart';
import 'package:socshea/utils/exceptions/firebase_exception.dart';
import 'package:socshea/utils/exceptions/format_exception.dart';
import 'package:socshea/utils/exceptions/platform_exception.dart';

class GoogleAuthRepoImpl implements GoogleAuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  GoogleAuthRepoImpl({
    required this.googleSignIn,
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, GoogleSignInAccount>> selectGoogleAccount() async {
    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(Failure('sign_in_canceled', 'Google Sign-In was canceled'));
      }
      return Right(googleUser);
    } on FirebaseAuthException catch (e) {
      return Left(TFireBaseAuthException(e.code));
    } on FirebaseException catch (e) {
      return Left(TFireBaseException(e.code));
    } on FormatException catch (e) {
      return Left(TFormatException.fromMessage(e.message));
    } on PlatformException catch (e) {
      return Left(TPlatformException(e.code));
    } catch(e){
      throw "Something went wrong. Please try again.";
    }
  }

  @override
  Future<Either<Failure, UserModel>> authenticateWithGoogle(GoogleSignInAccount googleUser) async {
    try {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final UserModel userModel = UserModel(
          uID: user.uid,
          firstName: user.displayName?.split(' ').first ?? '',
          lastName: user.displayName?.split(' ').skip(1).join(' ') ?? '',
          username: user.displayName ?? '',
          phone: user.phoneNumber ?? "0934567890",
          email: user.email ?? "",
          image: user.photoURL ?? TImages.user,
          isVerified: user.emailVerified
        );

        await saveUser(user);

        return Right(userModel);
      } else {
        return Left(Failure('user_data_unavailable', 'User data not available'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(TFireBaseAuthException(e.code));
    } on FirebaseException catch (e) {
      return Left(TFireBaseException(e.code));
    } on FormatException catch (e) {
      return Left(TFormatException.fromMessage(e.message));
    } on PlatformException catch (e) {
      return Left(TPlatformException(e.code));
    } catch(e){
      throw "Something went wrong. Please try again.";
    }
  }

  @override
  Future<void> saveUser(User user) async {
    final displayName = user.displayName ?? '';
    final nameParts = displayName.split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts[0] : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    final userModel = UserModel(
      uID: user.uid,
      firstName: firstName,
      lastName: lastName,
      username: user.displayName!,
      phone: user.phoneNumber ?? "0934567890",
      email: user.email ?? "",
      image: user.photoURL ?? TImages.user,
      isVerified: user.emailVerified,
    );

    final userDoc = firebaseFirestore.collection("users").doc(userModel.uID);
    final userSnapshot = await userDoc.get();

    if (!userSnapshot.exists) {
      await userDoc.set(userModel.toJson());
    } else {
      await userDoc.update({"lastSignIn": FieldValue.serverTimestamp()});
    }
  }
}
