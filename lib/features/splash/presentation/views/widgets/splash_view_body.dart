import 'package:flutter/material.dart';
import '../../../../../core/widgets/back_ground.dart';

class SplashViewBody extends StatelessWidget {
  final String image;
  const SplashViewBody({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.sizeOf(context).height * 0.0016;
    final textHeight = MediaQuery.sizeOf(context).height * 0.005;
    return BackGround(
      body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<Offset>(
                tween: Tween(begin: Offset(0, 0), end: Offset(0, -imageHeight)),
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return SlideTransition(
                    position: AlwaysStoppedAnimation(value),
                    child: Align(alignment: Alignment.center, child: child),
                  );
                },
                child: Center(
                  child: SizedBox(
                    width: 175,
                    height: 175,
                    child: Image.asset(image),
                  ),
                ),
              ),
              TweenAnimationBuilder<Offset>(
                tween: Tween(begin: Offset(0, 0), end: Offset(0, textHeight)),
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return SlideTransition(
                    position: AlwaysStoppedAnimation(value),
                    child: Align(alignment: Alignment.center, child: child),
                  );
                },
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}

// class SplashViewBody extends StatelessWidget {
//   final String image;
//   const SplashViewBody({super.key, required this.image});
//   @override
//   Widget build(BuildContext context) {
//     final imageHeight = MediaQuery.sizeOf(context).height * 0.0016;
//     final textHeight = MediaQuery.sizeOf(context).height * 0.005;
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           // gradient: LinearGradient(
//           //   begin: Alignment.topLeft,
//           //   end: Alignment.bottomRight,
//           //   colors: [Color(0xFF1a1a2e), Color(0xFF16213e), Color(0xFF0f3460)],
//           // ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TweenAnimationBuilder<Offset>(
//               tween: Tween(begin: Offset(0, 0), end: Offset(0, -imageHeight)),
//               duration: Duration(seconds: 3),
//               curve: Curves.easeOut,
//               builder: (context, value, child) {
//                 return SlideTransition(
//                   position: AlwaysStoppedAnimation(value),
//                   child: Align(alignment: Alignment.center, child: child),
//                 );
//               },
//               child: Center(
//                 child: SizedBox(
//                   width: 175,
//                   height: 175,
//                   child: Image.asset(image),
//                 ),
//               ),
//             ),
//             TweenAnimationBuilder<Offset>(
//               tween: Tween(begin: Offset(0, 0), end: Offset(0, textHeight)),
//               duration: Duration(seconds: 3),
//               curve: Curves.easeOut,
//               builder: (context, value, child) {
//                 return SlideTransition(
//                   position: AlwaysStoppedAnimation(value),
//                   child: Align(alignment: Alignment.center, child: child),
//                 );
//               },
//               child: Center(
//                 child: SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: CircularProgressIndicator(color: Colors.green),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
