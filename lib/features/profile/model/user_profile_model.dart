import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redditclone/core/constants/firebasefield_constants.dart';
import 'package:redditclone/core/errormessage.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';
import '../../../models/post_model.dart';
import '../../../models/user_model.dart';

final userProfileRepositoryProvider = Provider((ref) {
  return UserProfileRepository(firestore: ref.watch(firestoreProvider));
});

class UserProfileRepository {
  final FirebaseFirestore _firestore;
  UserProfileRepository({required FirebaseFirestore firestore}) : _firestore = firestore;

  CollectionReference get _users => _firestore.collection(FirebaseFieldConstants.usersCollection);
  CollectionReference get _posts => _firestore.collection(FirebaseFieldConstants.postsCollection);

  FutureVoid editProfile(UserModel user) async {
    try {
      return right(_users.doc(user.uid).update(user.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(ErrorMessage(e.toString()));
    }
  }

  Stream<List<Post>> getUserPosts(String uid) {
    return _posts.where('uid', isEqualTo: uid).orderBy('createdAt', descending: true).snapshots().map(
          (event) => event.docs
          .map(
            (e) => Post.fromMap(
          e.data() as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }

  FutureVoid updateUserpraise(UserModel user) async {
    try {
      return right(_users.doc(user.uid).update({
        'praise': user.praise,
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(ErrorMessage(e.toString()));
    }
  }
}
