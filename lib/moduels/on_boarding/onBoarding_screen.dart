import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/component.dart';
import '../login/login_screen.dart';

class OnBoardingScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image/onboarding.png'),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.end ,
            children: [
              Center(child: Image.asset('assets/image/onboarsing.png',height: 170,width: 170,)),
              Text('Welcome',style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 40,
                fontWeight:FontWeight.w600,
                color: Colors.white
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('To Our Social App',style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 35,
                    fontWeight:FontWeight.w600,
                    color: Colors.white
                ),),
              ),
              Text('We wish you to spend the best time with your friends',textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: 16,
                  color: HexColor('FCFCFC')
              ),),
              SizedBox(height:20 ,),
              defualtButton(context: context, name: 'Get Started', onPressed: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()))     ;       }),
              SizedBox(height:35 ,),

            ],
          )
        ],
      ),
    );
  }
}
