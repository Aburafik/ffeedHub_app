import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:ffeed_hub/Commons/delivery_details_card.dart';
import 'package:flutter/material.dart';

class PickUpDetailsVC extends StatefulWidget {
  const PickUpDetailsVC({super.key});

  @override
  State<PickUpDetailsVC> createState() => _PickUpDetailsVCState();
}

class _PickUpDetailsVCState extends State<PickUpDetailsVC> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "PickUp Details",
          style: textStyle,
        ),
      ),
      body: 
      
      LayoutBuilder(
        builder: (context, boxConstraints) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: boxConstraints.maxHeight),
          child: SafeArea(
            child: Column(
              children: [
                OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                    switch (orientation) {
                      case Orientation.portrait:
                        return _buildStepper(StepperType.vertical);
                      case Orientation.landscape:
                        return _buildStepper(StepperType.horizontal);
                      default:
                        throw UnimplementedError(orientation.toString());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Food Details",
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: DeliveryDetailsCard(
                          canDelete: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonComponent(
                    buttonText: "PROCEED",
                    onPressed: () {
                      Navigator.pushNamed(context, "/navigation_view");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canContinue = currentStep < 2;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        _buildStep(
            title: "Sender", location: "Block factory", contact: "055114321"),
        _buildStep(
            title: "Reciever", location: "Kasoa", contact: "02034567890"),
      ],
    );
  }

  Step _buildStep({
    required String title,
    required String location,
    required String contact,
    StepState state = StepState.indexed,
    bool isActive = true,
  }) {
    return Step(
      title: Text(
        title,
      ),
      // subtitle: const Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 150,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: borderRadius2),
          child: Row(
            children: [
              Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: borderRadius2,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(FeatherIcons.mapPin),
                      const SizedBox(width: 10),
                      Text(location),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(FeatherIcons.phoneCall),
                      const SizedBox(width: 10),
                      Text(contact),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


  class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0012500,size.height*0.9975000);
    path0.lineTo(0,size.height*0.2525000);
    path0.quadraticBezierTo(size.width*0.2334375,size.height*0.2487500,size.width*0.3112500,size.height*0.2475000);
    path0.cubicTo(size.width*0.3725750,size.height*0.2494750,size.width*0.3686000,size.height*0.1728000,size.width*0.3725500,size.height*0.1285750);
    path0.cubicTo(size.width*0.3980750,size.height*0.0575750,size.width*0.4039250,size.height*0.0103250,size.width*0.4999125,size.height*0.0122250);
    path0.cubicTo(size.width*0.6008875,size.height*0.0062500,size.width*0.6054125,size.height*0.0652000,size.width*0.6270375,size.height*0.1318500);
    path0.cubicTo(size.width*0.6386250,size.height*0.1699500,size.width*0.6270000,size.height*0.2494000,size.width*0.6875000,size.height*0.2450000);
    path0.quadraticBezierTo(size.width*0.7650000,size.height*0.2462500,size.width*0.9975000,size.height*0.2500000);
    path0.lineTo(size.width*0.9987500,size.height*0.9975000);
    path0.lineTo(size.width*0.0012500,size.height*0.9975000);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
