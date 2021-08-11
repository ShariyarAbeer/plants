import 'package:flutter/material.dart';
import 'package:plants/plantsList.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  elevation: 0.0,
                  mini: true,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 17.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Top Picks",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Top",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Outdoor",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Indoor",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Plans",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200.0,
            child: TabBarView(
              controller: tabController,
              children: [
                PlansList(),
                PlansList(),
                PlansList(),
                PlansList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
