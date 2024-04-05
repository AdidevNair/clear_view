import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom_clone/services/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/home_screen_button.dart';
import 'package:zoom_clone/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _page = 0;

  // void onPageSelected(int page) {
  //   setState(() {
  //     _page = page;
  //   });
  // }

  // List<Widget> pages = [
  //   MeetingScreen(),
  //   const MeetingHistoryScreen(),
  //   CustomButton(buttonName: 'Log Out', onPressed: () => AuthMethods().signOut()),
  // ];
  final JitsiMethods _jitsiMethods= JitsiMethods();

  createNewMeeting() async{
    //to generate a random 7 digit number for meetingID (roomName)
    var random= Random();
    String roomName= (random.nextInt(100000000)+ 10000000).toString();
    _jitsiMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/join-meeting');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'Meet & Chat',
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      // body: pages[_page],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Center(
            //   child: Text(
            //     'Create/Join Meetings with just a click!',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            HomeScreenButton(
              icon: Icons.videocam,
              onPressed: createNewMeeting,
              text: 'New Meeting',
            ),
            SizedBox(height: 60),
            HomeScreenButton(
              icon: Icons.add_box_rounded,
              onPressed: () => joinMeeting(context),
              text: 'Join Meeting',
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: zoomFooterColor,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   type: BottomNavigationBarType.fixed,
      //   unselectedLabelStyle: const TextStyle(fontSize: 14),
      //   onTap: onPageSelected,
      //   currentIndex: _page,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.comment_bank),
      //       label: 'Meet & Chat',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.lock_clock),
      //       label: 'Meetings',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings_outlined),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
