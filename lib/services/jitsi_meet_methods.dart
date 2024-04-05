// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/services/auth_methods.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/services/firestore_methods.dart';

class JitsiMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods= FirestoreMethods();
  var jitsiMeet = JitsiMeet();

  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted}) async {
    try {
      // FeatureFlag featureFlag = FeatureFlag();
      // featureFlag.welcomePageEnabled = false;
      // featureFlag.resolution = FeatureFlagVideoResolution
      //     .MD_RESOLUTION; // Limit video resolution to 360p

      // var options = JitsiMeetingOptions(room: roomName)
      //   ..userDisplayName = _authMethods.user.displayName
      //   ..userEmail = _authMethods.user.email
      //   ..userAvatarURL = _authMethods.user.photoURL // or .png
      //   ..audioMuted = isAudioMuted
      //   ..videoMuted = isVideoMuted
      //   ..serverURL = "https://meet.jit.si/";
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.engagemedia.org",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        userInfo: JitsiMeetUserInfo(
            displayName: _authMethods.user.displayName,
            email: _authMethods.user.email,
            avatar: _authMethods.user.photoURL

        ),
    );

      _firestoreMethods.addToMeetingHistory(roomName);
      await jitsiMeet.join(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
