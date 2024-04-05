import 'package:flutter/material.dart';
import 'package:zoom_clone/services/auth_methods.dart';
import 'package:zoom_clone/services/jitsi_meet_methods.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController roomIDController;
  JitsiMethods _jitsiMeet = JitsiMethods();

  @override
  void initState() {
    roomIDController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
    roomIDController.dispose();
  }

  _joinMeeting() {
    _jitsiMeet.createMeeting(
        roomName: roomIDController.text,
        isAudioMuted: true,
        isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Join Meeting',
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: roomIDController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLines: 1,
            decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.inversePrimary,
                filled: true,
                border: InputBorder.none,
                hintText: 'Enter Room ID...',
                hintStyle: const TextStyle(fontStyle: FontStyle.italic)),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary),
            height: 45,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              _authMethods.user.displayName!,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: _joinMeeting,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(10),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Join',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background),
              ),
            ),
          )
        ],
      ),
    );
  }
}
