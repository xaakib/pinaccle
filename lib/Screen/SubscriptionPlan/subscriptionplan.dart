import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/SubscriptionPlan/subscriptionplan.dart';
import 'package:hoichoi_clone_app/Http/Transition/transition.dart';
import 'package:hoichoi_clone_app/Model/SubscriptionPlan/subscriptionplan.dart';
import 'package:hoichoi_clone_app/Screen/Payment_Type/paymenttype.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:hoichoi_clone_app/mainpage.dart';

class SubscriptionPlanPage extends StatefulWidget {
  const SubscriptionPlanPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanPage> createState() => _SubscriptionPlanPageState();
}

class _SubscriptionPlanPageState extends State<SubscriptionPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubscriptionPlan"),
      ),
      body: FutureBuilder<SubscriptionPlan?>(
        future: HttpSubscriptionPlan().getsubscriptionplan(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.videoStreamingApp!.length,
              itemBuilder: ((context, index) {
                var data = snapshot.data!.videoStreamingApp![index];
                return InkWell(
                    onTap: () {
                      if (data.planPrice == "0.00") {
                        HttpTransition()
                            .transitionadd(
                                paymentgatway: "Free",
                                paymentid: "00000000000",
                                planid: data.planId.toString())
                            .then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MainPage())),
                              (route) => false);
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PaymenttypePage(
                                    planid: data.planId.toString(),
                                    currency: data.currencyCode!,
                                    name: data.planName!,
                                    country: "bd",
                                    price: data.planPrice!))));
                      }
                    },
                    child: subscriptionbox(data));
              }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: color),
            );
          }
        }),
      ),
    );
  }

  Widget subscriptionbox(VideoStreamingApp data) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      color: Color(0xFF74084E),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            data.planName!,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [color, color],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${data.planPrice!} ${data.currencyCode}",
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: color),
                ),
                SizedBox(width: 10),
                Text(
                  data.planDuration!,
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: color),
                ),
                SizedBox(width: 10),
                Text(
                  "Ad Free Premium Access",
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Select Plan"),
              decoration: BoxDecoration(
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        )
      ]),
    );
  }
}
