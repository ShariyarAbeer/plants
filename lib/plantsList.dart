import 'package:flutter/material.dart';
import 'package:plants/plantdetail.dart';

class PlansList extends StatefulWidget {
  const PlansList({Key key}) : super(key: key);

  @override
  _PlansListState createState() => _PlansListState();
}

class _PlansListState extends State<PlansList> {
  ScrollController scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description'
  ];
  String description;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            children: [
              getPlantCard(
                  "assets/images/whiteplant.png", "25", "OutDoor", "Aloe Vera"),
              getPlantCard(
                  "assets/images/aloevera.png", "25", "InDoor", "Fiucs"),
              getPlantCard(
                  "assets/images/smallplant.png", "25", "OutDoor", "Aloe Vera"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
            ),
          ),
        )
      ],
    );
  }

  getPlantCard(
      String imgPath, String price, String plantType, String plantName) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Stack(
        children: [
          Container(
            height: 325.0,
            width: 225.0,
            child: Container(
              padding: EdgeInsets.only(right: 15.0, left: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green[300],
              ),
              height: 250.0,
              width: 225.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "From",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            "Tk" + price,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Image(
                    image: AssetImage(imgPath),
                    height: 165.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            plantType,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            plantName,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey[200],
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green[300],
                        ),
                        child: Icon(
                          Icons.wb_sunny,
                          color: Colors.white.withOpacity(0.4),
                          size: 20.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey[200],
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green[300],
                        ),
                        child: Icon(
                          Icons.ac_unit,
                          color: Colors.white.withOpacity(0.4),
                          size: 20.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey[200],
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green[300],
                        ),
                        child: Icon(
                          Icons.sd_card,
                          color: Colors.white.withOpacity(0.4),
                          size: 20.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.green[300],
                          ),
                          child: InkWell(
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.white.withOpacity(0.4),
                              size: 20.0,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (contex) => PlantDetail(),
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 90.0, top: 300.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.black),
              child: Center(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
