import 'package:flutter/material.dart';
import 'package:weather_app/model/api.dart';
import '../model/response_model.dart';

class HomePageScreeen extends StatefulWidget {
  const HomePageScreeen({Key? key}) : super(key: key);

  @override
  State<HomePageScreeen> createState() => _HomePageScreeenState();
}

class _HomePageScreeenState extends State<HomePageScreeen> {
  String noDatatext = "Sorry, we don't have data..";
  bool inProgress = false;
  ResponseModel? responseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSearchWidget(),
              SizedBox(
                height: 20,
              ),
              if (inProgress)
                LinearProgressIndicator()
              else if (responseModel != null)
                Expanded(child: _buildResponseWidget())
              else
                _noDataWidget()
            ],
          ),
        ),
      ),
    );
  }

   _buildSearchWidget() {
    return SearchBar(
      hintText: "Search location here",
      onSubmitted: (value) {
        //get data from api
        _getResultFromApi(value);
      },
    );
  }

    
   _buildResponseWidget() {
    if(responseModel != null && responseModel!.current != null && responseModel!.location !=null){
      print("Country selected is: ");
      print(responseModel!.current!.tempC);
return Card(
      elevation: 4,
      child: Column(
        children: [
          Text(responseModel!.current!.tempC.toString(),
          style: TextStyle(
            color: Colors.red,
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          Container(
            height: 30,
            width: 60,
            child: Column(
              children: [
                Text('data'),
              ],
            ),
          )
        ],
      ),
    );
    }else{
      return _noDataWidget();
    }
    
  }

 _noDataWidget() {
    return Text(noDatatext);
  }

   _getResultFromApi(String location) async {
    setState(() {
      inProgress = true; // Set progress indicator to show loading
    });

    try {
      responseModel = await API.fetchLocation(location);
    } catch (e) {
      responseModel = null;
      noDatatext = "Sorry, data cannot be fetched";
    } finally {
      setState(() {
        inProgress = false; // Set progress indicator to hide loading
      });
    }
  }
}
