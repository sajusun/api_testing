import 'package:api_testing/modal/bdwash_service.dart' as bdWash;
import 'package:api_testing/repository/all_products_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as image;

class BdWashProductList extends StatefulWidget {
  const BdWashProductList({super.key});

  @override
  State<BdWashProductList> createState() => _BdWashProductListState();
}

class _BdWashProductListState extends State<BdWashProductList> with TickerProviderStateMixin {
  List<bdWash.Datum> datum = [];
  List<Widget> tabBar=[];
  List<Widget> tabBarData=[];
  late TabController tabController;

int index=0;

  getData() async {
    bdWash.BdWashService data = await AllProductsApi.bdWashData();
    print(data.data);
    datum.addAll(data.data);
    dynamicTabBar();
    tabController =TabController(length: datum.length, vsync: this);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    //dynamicTabBar();
  }
  
  dynamicTabBar(){
    for(int i=0;i<datum.length;i++){
      tabBar.add(Text(datum[i].name));
    }
  }
  productOntab(int id){
    print(datum[id].products.length);
    for(int i=0;i<datum[id].products.length;i++){
      print(datum[id].products[i].name);
     tabBarData.add(Container(
        child: Column(
          children: [
            Text(datum[id].products[i].name),
            Text(datum[id].products[i].id.toString()),
          ],
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BdWash"),
      ),
      body: tabBarErr(),
    );
  }

  tabBarErr(){
    if(tabBar.isNotEmpty ){
      return Column(
        children: [
          TabBar(
              controller: tabController,
              onTap: (value){
                index=value;
                setState(() {
                });
              }, tabs: datum.map((data) => Tab(text: data.name,)).toList()
          ),

          SizedBox(
                height: 200,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Center(child: TabBarView(
                      controller: tabController,
                      children: datum.map((data) => Container(child:
                    Column(
                      children: data.products.map((e) => Text(e.name)).toList()
                    )
                    ,)).toList()
                  ),
                  ),
                ),
              ),
        ],
      );

    }else{
      return Center(child: CircularProgressIndicator());
    }
  }
  // check api data is successfully fetch or display a circular bar
  // isNotError(){
  //   if(datum.isNotEmpty){
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 48.0),
  //       child: SizedBox(
  //         height: 350,
  //         width: MediaQuery.of(context).size.width,
  //         child: ListView.builder(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: datum.length,
  //             itemBuilder: (context, item) {
  //               return SizedBox(
  //                 width: 300,
  //                 child: Card(
  //                   clipBehavior: Clip.hardEdge,
  //                   child: Column(
  //                     children: [
  //                       image.Image.network(
  //                         datum[item].name,
  //                         height: 180,
  //                         width: 300,
  //                         fit: BoxFit.fitWidth,
  //                       ),
  //                       Text(datum[item].name,
  //                           style: TextStyle(color: Colors.black,fontSize: 16, height: 3)),
  //                       SizedBox(
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           children: [
  //                             Text("position : ${datum[item].position}"),
  //                             Text("id : ${datum[item].id}"),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             }),
  //       ),
  //     );
  //   }else{
  //     return Center(child: CircularProgressIndicator());
  //   }
  // }
}
