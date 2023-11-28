import 'package:api_testing/modal/bossend_categories.dart';
import 'package:api_testing/repository/bosssend_api.dart';
import 'package:api_testing/ui/product_by_categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class bsCategoriesUi extends StatefulWidget {
  const bsCategoriesUi({super.key});

  @override
  State<bsCategoriesUi> createState() => _bsCategoriesUiState();
}

class _bsCategoriesUiState extends State<bsCategoriesUi> {

  List<Datum> category=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    if(category.isEmpty) {
      var data = await BosssendApi.getCategories();
      category = data.data;
    }
    setState(() {
    });
    print(category);
  }
  dataChecked(){
    if(category.isNotEmpty){
      return Container(
        child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 18.0,left: 10,right: 10),
            child: OutlinedButton( child: Text(category[index].name), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductByCategoriesUi(id: category[index].id,)));
             // print(category[index].id.toString());
            },),
          );
        }),
      );
    }else{
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Test Project"),),
      body: dataChecked(),
    );
  }
}
