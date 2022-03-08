import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/loader.dart';
import 'package:http/http.dart' as http;

class StreamExample extends StatefulWidget {
  const StreamExample({Key? key}) : super(key: key);

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  final controller = StreamController<int>();
  int bitcoinPrice = BitcoinApi.bitcoinPrice;

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<int>(
          initialData: bitcoinPrice,
          stream: BitcoinApi.getPrice(),
          builder: (context, snapshot) {
            final coin = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircleLoading();
              default:
                if (snapshot.hasError) {
                  return const Text('error');
                } else {
                  return Text('jumlah coin saat ini $coin');
                }
            }
          },
        ),
        ButtonPrimary(
            text: 'add 50',
            onPressed: () {
              print('tes');
              bitcoinPrice += 500;
              controller.sink.add(bitcoinPrice);
            }),
      ],
    );
  }
}

class BitcoinApi {
  static int bitcoinPrice = 32000;
  static const _key = '4fe49fbf4baf5a7b866ecbbc5622f468';

  static Stream<int> getPrice() => Stream.periodic(const Duration(seconds: 5)).asyncMap((_) => getPrices());

  static Future<int> getPrices() async {
    // final url = Uri.parse('https://api.nomics.com/v1/currencies/ticker?key=$_key&ids=BTC&interval=1d');

    // final response = await http.get(url);
    // final body = json.decode(response.body).first;
    // final price =  double.parse(body['price'].toString()).floor();
    final price = Random().nextInt(6000);

    return price;
  }
}
