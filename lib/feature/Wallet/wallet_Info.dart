import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/feature/Wallet/add_money.dart';
import 'package:parkingapp/feature/Wallet/bloc/wallet_bloc.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc()..add(get_wallet_info()),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(),
            body:
                BlocBuilder<WalletBloc, WalletState>(builder: (context, state) {
              if (state is GetWalletInfouccessfully) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 166,
                            height: 145,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color.fromRGBO(8, 183, 131, 1)),
                                color: Color.fromRGBO(226, 245, 237, 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.wallet_result.balance}\$',
                                  style: TextStyle(
                                    color: Color.fromRGBO(90, 90, 90, 1),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Available Balance',
                                  style: TextStyle(
                                    color: Color.fromRGBO(90, 90, 90, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 166,
                            height: 145,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color.fromRGBO(8, 183, 131, 1)),
                                color: Color.fromRGBO(226, 245, 237, 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.wallet_result.balance}\$',
                                  style: TextStyle(
                                    color: Color.fromRGBO(90, 90, 90, 1),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Total Expend',
                                  style: TextStyle(
                                    color: Color.fromRGBO(90, 90, 90, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => AddMoney_ByCode(),
                          ));
                        },
                        child: Container(
                          width: 171,
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Color.fromRGBO(8, 183, 131, 1)),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              'Add Money',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(8, 183, 131, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is Erorrr) {
                return Container(
                  width: 200,
                  height: 50,
                  child: Text(
                    "erorrrrrrrrrrrr",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
      }),
    );
  }
}
