import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/hiking_data.dart';
//import 'package:hiking_design_app/nav_bar.dart';
import '../screens/hiking_details_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/stats_screen.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  final Map<String, String> _activities = {
    'https://c8.alamy.com/comp/T9MA3R/boat-canoe-kayak-ship-abstract-flat-color-icon-template-T9MA3R.jpg' : 'Kayaking',
    'https://cdn3.vectorstock.com/i/1000x1000/14/02/hiking-abstract-concept-vector-38351402.jpg': 'Hiking',
    'https://cdn3.vectorstock.com/i/1000x1000/14/32/snorkeling-abstract-concept-vector-38351432.jpg' : 'Snorkling',
    'https://mpng.subpng.com/20180209/wcq/kisspng-hot-air-balloon-cartoon-hot-air-balloon-vector-5a7db9c3208469.6845526115181889951332.jpg' : 'Balloning',
  };

  final List _pages = const [
    HomeScreen(),
    StatsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

  TabController _tabController = TabController(length: 3, vsync: this);
  final hikingData = Provider.of<HikingData>(context).hikingItem;
  //final hiking = Provider.of<Hiking>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 30, color: Colors.black,),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: const Center(child: Text('Profile pic', textAlign: TextAlign.center,),),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        //currentIndex: _currentIndex,
        //onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'Discovery',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotions'),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height < 600 ? 266 : 340,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HikingDetailsScreen.routeName, arguments: hikingData[index].id);
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width < 350 ? 200 : 250,
                              margin: const EdgeInsets.only(top: 10, right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(hikingData[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 75,
                                width: MediaQuery.of(context).size.width < 350 ? 200 : 250,
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(hikingData[index].title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.location_on, color: Colors.white,),
                                        Text('${hikingData[index].country}, ${hikingData[index].location}', softWrap: true, maxLines: 1, style: const TextStyle(color: Colors.white, fontSize: 16),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Center(child: Text('Inspiration part there')),
                  const Center(child: Text('emotions part there')),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Explore more', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),),
                  Text('See all', style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 93,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _activities.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 35),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 76,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(_activities.keys.elementAt(index)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(_activities.values.elementAt(index), style: const TextStyle(color: AppColors.textColor2),)
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

}