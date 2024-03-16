import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trave_app/misc/colors.dart';
import 'package:trave_app/widgets/app_large_text.dart';
import 'package:trave_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}):super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "SnorkLing",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu text
          Container(
            padding: EdgeInsets.only(top: 0.1 * MediaQuery.of(context).size.height, left: 0.05 * MediaQuery.of(context).size.width),
            child: Row(
              children: [
                Icon(Icons.menu, size: 0.08 * MediaQuery.of(context).size.width, color: Colors.black54),
                Expanded(child: Container()),

                Container(
                  margin: EdgeInsets.only(right: 0.05 * MediaQuery.of(context).size.width),
                  width: 0.12 * MediaQuery.of(context).size.width,
                  height: 0.12 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height,),
          // discover text
          Container(
            margin: EdgeInsets.only(left: 0.05 * MediaQuery.of(context).size.width),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 0.02 * MediaQuery.of(context).size.height,),
          //tabbar
          Container(
            child: Align(             
              //alignment: Alignment.centerLeft,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.only(left: 0.05 * MediaQuery.of(context).size.width, right: 0.05 * MediaQuery.of(context).size.width),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 0.01 * MediaQuery.of(context).size.width),
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          //tabbar view
          Container(
            padding: EdgeInsets.only(left: 0.05 * MediaQuery.of(context).size.width, top: 0.04 * MediaQuery.of(context).size.width),
            height: 0.35 * MediaQuery.of(context).size.height,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index){
                    return Container(
                      margin: EdgeInsets.only(right: 0.04 * MediaQuery.of(context).size.width, top: 0.02 * MediaQuery.of(context).size.height),
                      width: 0.45 * MediaQuery.of(context).size.width,
                      height: 0.3 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                "img/mountain.jpg"
                            ),
                            fit:BoxFit.cover
                        )
                      ),
                    );
                  },
                ),
                Text("There"),
                Text("Bye"),
              ],
            ),
          ),
          SizedBox(height: 0.03 * MediaQuery.of(context).size.height,),

          Container(
            margin: EdgeInsets.only(left: 0.05 * MediaQuery.of(context).size.width, right: 0.05 * MediaQuery.of(context).size.width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 0.05 * MediaQuery.of(context).size.width),
                AppText(text: "Sell all", color: AppColors.textColor1)
              ],
            ),
          ),

          SizedBox(height: 0.025 * MediaQuery.of(context).size.height,),

          Container(
            height: 0.12 * MediaQuery.of(context).size.height,
            width: double.infinity,
            margin: EdgeInsets.only(left: 0.05 * MediaQuery.of(context).size.width),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
                return Container(
                  margin: EdgeInsets.only(right: 0.075 * MediaQuery.of(context).size.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 0.15 * MediaQuery.of(context).size.width,
                        height: 0.15 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("img/"+images.keys.elementAt(index)),
                              fit:BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 0.01 * MediaQuery.of(context).size.height,),
                      Container(
                        child: AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                        ),
                      )
                    ],
                  ),
                );
              }),
          ),
          
        ],
      )
    );
  }
}


class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }


}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, 
  ImageConfiguration configuration){
    // TODO : implement paint
    Paint _paint = Paint();
    _paint.color= color;
    _paint.isAntiAlias=true;
    final Offset circleOffset=Offset(configuration.size!.width/2 -radius/2, configuration.size!.height-radius);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
}