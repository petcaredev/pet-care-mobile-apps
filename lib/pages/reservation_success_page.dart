import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ReservationSuccessPage extends StatefulWidget {
  static const route = '/reservation-success-page';

  const ReservationSuccessPage({super.key});

  @override
  State<ReservationSuccessPage> createState() => _ReservationSuccessPageState();
}

class _ReservationSuccessPageState extends State<ReservationSuccessPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, HomePage.route);
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/33886-check-okey-done.json',
              width: 200,
              height: 200,
              controller: _controller,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
                _controller.forward();
              },
            ),
            Text(
              'Reservasi berhasil!',
              style: text14(
                weight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
