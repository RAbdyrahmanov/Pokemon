import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poke_ap/core/service/app_assets.dart';
import 'package:poke_ap/core/service/app_router.dart';
import 'package:poke_ap/features/auth/presentation/widgets/bg_circle.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          const BgCircle(
            color: Colors.blue,
            left: -50,
            height: 250,
          ),
          const BgCircle(
            color: Colors.yellow,
            right: -50,
            top: 250,
            height: 250,
          ),
          const BgCircle(
            color: Colors.red,
            left: -50,
            bottom: -50,
            height: 250,
          ),
          Positioned(
            top: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Pokemon',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(AppAssets.pokeball),
                ],
              ),
            ),
          ),
          Positioned(top: 100, child: Image.asset(AppAssets.pokeballBg)),
          Positioned(bottom: 0, child: Image.asset(AppAssets.ash)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFCC18)),
                onPressed: () { 
                  context.router.push(const HomeRoute());
                },
                child: const Text(
                  'Start Viewing',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
