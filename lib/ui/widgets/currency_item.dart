import 'package:currency_flutter/data/model/currency_model.dart';
import 'package:currency_flutter/data/souce/local/my_shared_preference.dart';
import 'package:currency_flutter/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget CurrencyItem(CurrencyModel data, void Function() onShowCalc) {

  String lang =  MyPreference.getString("lang") ?? "No data";
  Map<String, String> translations = {
    "uz" : data.ccyNmUz.toString(),
    "en" : data.ccyNmEn.toString()
  };

  return Card(shape: RoundedRectangleBorder(
      borderRadius:
      BorderRadius.all(Radius.circular(16)),

  ),

    color: Colors.white,
    child: ExpansionTile(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(16))),
    title:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    translations[lang]??"data empty",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    data?.diff ?? "",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '1 ${data?.ccy ?? ""} => ${data?.rate ?? ""} UZS | 📆 ${data?.date ?? ""}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
      // ),
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: (){
                    onShowCalc();
                  },
                  child: Container(
                    // height: 28,
                    padding: EdgeInsets.all(6),
                    // width: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calculate_outlined,color: Colors.white,size:20,),
                        SizedBox(width: 5,),
                        Text(LocaleKeys.calculate.tr(),style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )

      ],
    ),
  );
}