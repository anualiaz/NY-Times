import 'package:flutter/material.dart';
import 'package:ny_times/app/services/http_service.dart';
import 'package:ny_times/app/ui/theme/my_colors.dart';


class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  static HttpService http = HttpService();
  String url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=etXCnTdKIEi9i15g709qTrUvg9lT5dZj";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        leading: const Icon(Icons.menu,color: MyColors.whiteColor,),
        centerTitle: true,
        title: const Text("NY Times Most Popular",
          style: TextStyle(
            color: MyColors.whiteColor,
          ),),
        actions: const [
          Icon(Icons.search, color: MyColors.whiteColor,),
          Icon(Icons.more_vert, color: MyColors.whiteColor,)
        ],
      ),
      body: FutureBuilder(
        future: http.get(url),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return  newsData != 0 ?ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context,index){
                var str = newsData[index]["updated"];
                return
                  ListTile(
                    leading: const CircleAvatar(),
                    title: Text(
                      "${newsData[index]["title"]}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                            child: Text(
                              "${newsData[index]["byline"]}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Row(
                          children: [
                            Icon(Icons.calendar_today,size: 10,),
                            SizedBox(width: 5,),
                            Text(str.substring(0, 10)),
                          ],
                        )
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                  );
              }
          ) : CircularProgressIndicator();
        },
      ),
    );
  }
}

