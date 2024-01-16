
import 'package:currency_flutter/data/souce/local/my_shared_preference.dart';
import 'package:currency_flutter/lang/locale_keys.g.dart';
import 'package:currency_flutter/presenter/main/main_bloc.dart';
import 'package:currency_flutter/ui/widgets/InputText.dart';
import 'package:currency_flutter/ui/widgets/currency_item.dart';
import 'package:currency_flutter/utils/status.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}



var _controllerV1 = TextEditingController();
var _controllerV2 = TextEditingController();
String text = "1232";



enum SingingCharacter { uzb, eng, ru }
class _MainScreenState extends State<MainScreen> {
  final bloc = MainBloc();
  SingingCharacter? _character = SingingCharacter.uzb;
  String _currentDate = DateTime.now().toLocal().toString().split(' ')[0];



  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
  @override
  void initState() {
    bloc.add(InitialCurrencyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // _controllerV1.addListener(() {
    //   double value1 = double.tryParse(_controllerV1.text) ?? 0.0;
    //   if (changer) {
    //     double result = value1 * unknownMultiplier;
    //     _controllerV2.text = result.toString();
    //   } else {
    //     double result = value1 / unknownMultiplier;
    //     _controllerV2.text = result.toString();
    //   }
    // });
    //
    return BlocProvider.value(
        value: bloc,
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state.status == Status.SUCCESS) {
            return  Scaffold(
              appBar: AppBar(title: Text(LocaleKeys.currency.tr(),
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700)), backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15),),
              ),
                actions: [
                  IconButton(onPressed: (){
                    //calendar
                  }, icon: Icon(Icons.calendar_month_sharp, color: Colors.white,)),

                  IconButton(onPressed: (){
                    //language

                    showModalBottomSheet(context: context,
                        isDismissible:  true,
                        isScrollControlled: true,
                        builder: (context) => Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title:  Text(LocaleKeys.uzbek.tr()),
                                leading: Radio<SingingCharacter>(
                                  value: SingingCharacter.uzb,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) async{
                                    await context.setLocale(const Locale("uz"));
                                    MyPreference.setString("lang", "uz");
                                    setState(() {
                                      _character = value;
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title:  Text(LocaleKeys.english.tr()),
                                leading: Radio<SingingCharacter>(
                                  value: SingingCharacter.eng,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) async{
                                    await context.setLocale(const Locale("en"));
                                    MyPreference.setString("lang", "en");
                                    setState(() {
                                      _character = value;
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ));

                  }, icon: Icon(Icons.language_outlined, color: Colors.white,))
                ],
              ),
              body:
                  ListView.builder(
                      itemCount: state.data?.length,
                      itemBuilder: (context, index) {

                        //_controllerV2.text = (int.parse(state.data![index].rate.toString()) * int.parse(_controllerV1.text.toString())).toString();

                        return CurrencyItem(state.data![index],
                                () {
                                  showModalBottomSheet(context: context,
                                isDismissible:  true,
                                isScrollControlled: true,
                                builder: (context) => Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                        Container(
                                            padding: EdgeInsets.all(16),
                                            child: InputText(state.data![index].ccy, TextInputType.number, _controllerV1, true)),

                                      Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text(_controllerV2.text),),

                                      Spacer(),


                                      Container(
                                        alignment: Alignment.bottomRight,
                                        padding: EdgeInsets.only(right: 16, bottom: 16),


                                        child: IconButton(onPressed: () {
                                          text = (int.parse(state.data![index].rate.toString()) * int.parse(_controllerV1.text.toString())).toString();

                                          setState(() {
                                            //_controllerV2.text = (int.parse(state.data![index].rate.toString() * int.parse(_controllerV1.text.toString())).toString();
                                            text = _controllerV2.text;
                                          });

                                        }, icon: Icon(Icons.currency_exchange_sharp, size: 36, color: Colors.deepPurple,)
                                        ),
                                      )
                                    ],
                                  ),
                                                                ),
                                ));

                        });
                      })

            );
          }else if(state.status == Status.ERROR) {
            return Scaffold(body: Placeholder(),);
          }else {
            return const Scaffold(body: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}

double stringToDouble(String text) {
  return double.tryParse(text) ?? 0.0;
}



Future<void> _selectDate() async {
  DateTime? initialDateTime = DateTime.parse(_currentDate);
  DateTime? picked = await showDatePicker(
      initialDate: initialDateTime,
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025));
  if (picked != null) {
    setState(() {
      _currentDate = picked.toString().split(" ")[0];
      _bloc.add(GetAllCurrenciesEvent(selectedLang, _currentDate));
    });
  }
}