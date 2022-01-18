import 'package:salarlinktree/src/models/socila_media_model.dart';
import 'package:salarlinktree/src/models/xontact_model.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? peofileImage;
  String? bio;
  String? currentState;
  List<SocialMedia>? socialMedia;
  List<Contact>? contact;
  UserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.peofileImage,
      this.bio,
      this.currentState,
      this.socialMedia,
      this.contact});
}
