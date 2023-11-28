import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:gap/gap.dart';
import '../modal/all_products.dart';
import '../repository/all_products_api.dart';

class AllProductUi extends StatefulWidget {
  const AllProductUi({super.key});

  @override
  State<AllProductUi> createState() => _AllProductUiState();
}

class _AllProductUiState extends State<AllProductUi> {
  List<Datum> apiData = [];

  getdata() async {
    // data = await AllProductsApi.getFromApi();
    var apiDatas = await AllProductsApi.getFromApi();
    if (apiDatas != null) {
      apiData.addAll(apiDatas.data.data);
      setState(() {});
    }
    print(apiData[0].id);

  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
    //getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: errorHandle(),
      ),
    );
  }

  errorHandle() {
    if (apiData.isNotEmpty) {
      return ListView.builder(
          itemCount: apiData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 200,
                    child: image.Image.network(
                      apiData[index].image.medium,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(20),
                  Container(
                    child: Text(
                      apiData[index].name,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(apiData[index]
                            .formattedFinalProductPrice
                            .toString()),
                        Text(apiData[index].discountedPrice.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    } else {
      return CircularProgressIndicator();
    }
  }
}
