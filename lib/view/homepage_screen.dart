import 'package:flutter/material.dart';
import 'package:weather_app/model/api.dart';
import '../model/response_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String noDataText = "Sorry, we don't have data..";
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
              SizedBox(height: 20),
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

  Widget _buildSearchWidget() {
    return SearchBar(
      hintText: "Search location here",
      onSubmitted: (value) {
        // Get data from API
        _getResultFromApi(value);
      },
    );
  }

  Widget _buildResponseWidget() {
    if (responseModel != null &&
        responseModel!.current != null &&
        responseModel!.location != null) {
      print("Country selected is: ${responseModel!.location!.country}");
      return Card(
        elevation: 4,
        child: Column(
          children: [
            Text(
              responseModel!.current!.tempC.toString(),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
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
    } else {
      return _noDataWidget();
    }
  }

  Widget _noDataWidget() {
    return Text(noDataText);
  }

  Future<void> _getResultFromApi(String location) async {
    setState(() {
      inProgress = true; // Set progress indicator to show loading
    });

    try {
      responseModel = await API.fetchLocation(location);
      if (responseModel == null) {
        setState(() {
          noDataText = "Sorry, data cannot be fetched";
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        noDataText = "Sorry, an error occurred while fetching data";
      });
    } finally {
      setState(() {
        inProgress = false; // Set progress indicator to hide loading
      });
    }
  }
}
