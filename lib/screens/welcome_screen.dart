import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/greet_data.dart';
import '../screens/home_screen.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final greetData = Provider.of<GreetData>(context).items;
    return Scaffold(
      body: PageView.builder(
        itemCount: greetData.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Expanded(
                    flex: MediaQuery.of(context).size.height < 600 ? 3 : 2,
                    child: Container(
                      margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(greetData[index].title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                              Text(greetData[index].subtitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),),
                              const SizedBox(height: 20,),
                              Container(
                                width: 250,
                                child: Text(greetData[index].description, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.textColor2),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height < 600 ? 35 : 20,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(height: 30, width: constraints.maxWidth * 0.5),
                                    Container(
                                        width: constraints.maxWidth * 0.3,
                                        child: CustomButton(isResponsive: false, width: 105)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(greetData.length, (indexDots) {
                              return Container(
                                height: index == indexDots ? 25 : 8,
                                width: 8,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.4),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(greetData[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
