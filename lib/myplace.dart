import 'package:flutter/material.dart';

class Myplace extends StatelessWidget {
  const Myplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(
      children: [
        //block1(),
        // block2(),
        block3(),
        // block4(),
      ],
    );
  }

  Widget block3() {
    return Row(
      children: [
        Column(children: [Icon(Icons.call), Text("call")]),
        Column(children: [Icon(Icons.directions), Text("route")]),
        Column(children: [Icon(Icons.share), Text("share")]),
      ],
    );
  }

  Widget block2() {
    var namePlace = "Sahara";
    var addressPlace = "Châu Phi";
    var votePlace = "41";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(namePlace), Text(addressPlace)],
          ),
          Row(children: [Icon(Icons.star), Text(votePlace)]),
        ],
      ),
    );
  }

  Widget block4() {
    var data =
        "Khí hậu Sahara đã trải qua những biến đổi to lớn giữa ẩm và khô trong vài trăm nghìn năm qua. Trong kỷ băng hà cuối cùng, Sahara lớn hơn ngày nay, trải dài xa hơn về phía nam so với biên giới hiện tại .";
    return Text(data);
  }

  Widget block1() {
    var src =
        "https://cdn.britannica.com/86/115086-050-0C320EC1/Camel-caravan-Sahara-Morocco.jpg ";

    return Image.network(src);
  }
}
