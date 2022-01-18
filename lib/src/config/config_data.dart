import 'package:salarlinktree/src/models/socila_media_model.dart';
import 'package:salarlinktree/src/models/user_model.dart';
import 'package:salarlinktree/src/models/xontact_model.dart';

UserModel userModel = UserModel(
    uid: "id0",
    firstName: "Salar",
    lastName: "Pro",
    peofileImage:
        "https://yt3.ggpht.com/ytc/AKedOLRE5OLH8g0_Mhw9zEwwlZmAvT_-d345dVKUF44hyUU=s900-c-k-c0x00ffffff-no-rj",
    bio: "Pro app developer",
    currentState: "Searching for apps 😋",
    socialMedia: [
      SocialMedia(
          uid: "",
          name: "Facebook",
          imageUrl: "facebook.png",
          link: "https://facebook.com/salarpro",
          type: ""),
      SocialMedia(
          uid: "",
          name: "Youtube",
          imageUrl: "youtube.png",
          link: "https://youtube.com/salarpro",
          type: ""),
      SocialMedia(
          uid: "",
          name: "GitHub",
          imageUrl: "github.png",
          link: "https://github.com/salarpro",
          type: ""),
      SocialMedia(
          uid: "",
          name: "LinkedIn",
          imageUrl: "linkedin.png",
          link: "https://www.linkedin.com/in/salar-pro-13b970120/",
          type: ""),
    ],
    contact: [
      Contact(
          name: "WhatsApp",
          link: "https://wa.me/+9647503505440",
          image: "whatsapp.png"),
      Contact(name: "Phone", link: "+9647503505440", image: "phone.png"),
    ]);
