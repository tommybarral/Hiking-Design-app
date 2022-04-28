import 'package:flutter/material.dart';
import 'package:hiking_design_app/constants.dart';
import 'package:hiking_design_app/screens/home_screen.dart';
import 'package:hiking_design_app/widgets/custom_button.dart';
import 'package:hiking_design_app/widgets/nb_person.dart';
import 'package:provider/provider.dart';
import 'package:hiking_design_app/models/hiking_data.dart';

class HikingDetailsScreen extends StatefulWidget {

  static const routeName = '/hiking-details';


  const HikingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HikingDetailsScreen> createState() => _HikingDetailsScreenState();
}

class _HikingDetailsScreenState extends State<HikingDetailsScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {

    final hikingId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedHikingData = Provider.of<HikingData>(context).hikingItem.firstWhere((hiking) => hiking.id == hikingId);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(loadedHikingData.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                  const SizedBox(width: 280,),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                    },
                    icon: const Icon(Icons.more_vert, color: Colors.white,),
                  ),
                ],
              ),
            ),
            Positioned(
             bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25),),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(loadedHikingData.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        Text('${loadedHikingData.price.toInt()} €', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.textColor1),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.textColor1),
                        const SizedBox(width: 5,),
                        Text('${loadedHikingData.country}, ${loadedHikingData.location}', style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: AppColors.textColor1),),
                      ],
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: index<loadedHikingData.like ? AppColors.startColor : AppColors.textColor2);
                          }),
                        ),
                        SizedBox(width: 5,),
                        Text('(${loadedHikingData.like} ${loadedHikingData.like == 1 ? 'star' : 'stars'})', style: const TextStyle(fontSize: 16, color: AppColors.textColor2),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text('People', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                    const Text('Number of people in your group'),
                    /* OLD
                    Container(
                      height: 55,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 55,
                              width: 55,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text('1'),),
                            );
                          }),
                    ),
                     */
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: NBPerson(
                              color: _selectedIndex == index ? Colors.white : Colors.black,
                              backgroundColor: _selectedIndex == index ? Colors.black : AppColors.buttonbackground,
                              size: 50,
                              borderColor: _selectedIndex == index ? Colors.black : AppColors.buttonbackground,
                              icon: Icons.favorite_border,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const Text('Description', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                    Text(loadedHikingData.description, style: const TextStyle(fontSize: 18), maxLines: 4, softWrap: true,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NBPerson(color: AppColors.textColor1, backgroundColor: Colors.white, size: 60, borderColor: AppColors.textColor1, isIcon: true, icon: Icons.favorite_border,),
                        const SizedBox(width: 20,),
                        CustomButton(isResponsive: true),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
