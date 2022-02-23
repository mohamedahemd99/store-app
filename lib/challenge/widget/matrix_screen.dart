import 'package:flutter/material.dart';

import '../model.dart';
import 'card.dart';

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({Key? key}) : super(key: key);

  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  double avg = 0;

  @override
  void initState() {
    super.initState();
    avg = getAveragePrice();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardWidget(
                  child: Column(
                    children: [
                      Text("Number of items:"),
                      Text("${json.length.toString()} items"),
                    ],
                  ),
                ),
                CardWidget(
                    child: Column(
                  children: [
                    Text("Average Price:"),
                    Text("\$${avg.toString().split(".")[0]}"),
                  ],
                )),
              ],
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  List<String> tags = json[index]["tags"];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(image,
                              width: 100, fit: BoxFit.cover, height: 100),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Company: ${json[index]["company"]}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Buyer:${json[index]["buyer"]}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Price:${json[index]["price"]}",
                                    overflow: TextOverflow.ellipsis),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                    children: tags.map((e) => Text(e)).toList())
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: json[index]["isActive"]
                                    ? Colors.tealAccent
                                    : Colors.red,
                              ),
                              Text(
                                  json[index]["isActive"]
                                      ? "Active"
                                      : "Inactive",
                                  overflow: TextOverflow.ellipsis)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.teal),
                itemCount: json.length),
          ],
        ),
      ),
    );
  }
}
