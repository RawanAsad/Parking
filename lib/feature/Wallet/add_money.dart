import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/feature/Wallet/bloc/wallet_bloc.dart';
import 'package:parkingapp/feature/Wallet/create_wallet.dart';
import 'package:parkingapp/feature/Wallet/wallet_Info.dart';

class AddMoney_ByCode extends StatelessWidget {
  const AddMoney_ByCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc()..add(get_available_codes()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<WalletBloc, WalletState>(
            builder: (context, state) {
              if (state is GetAvailableCodesSuccessfully) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            _openAnimatedDialog(
                                context, state.listCodes[index].code);
                          },
                          child: Container(
                            width: 362,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color.fromRGBO(8, 183, 131, 1),
                              ),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.monetization_on_outlined,
                                size: 35,
                                color: Color.fromRGBO(8, 183, 131, 1),
                              ),
                              title: Text(
                                '${state.listCodes[index].code}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Text(
                                '${state.listCodes[index].amount}\$',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                      itemCount: state.listCodes.length),
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
            },
          ),
        );
      }),
    );
  }

  _openAnimatedDialog(BuildContext context, String codee) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            backgroundColor: Color.fromRGBO(226, 245, 237, 1),
            title: Text(
              'Confirmation',
              style: TextStyle(
                  color: Color.fromRGBO(8, 183, 131, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            content: SizedBox(
              height: 85,
              child: Column(
                children: [
                  Text(
                      'Are you sure you want to charge your wallet with this code?'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    codee,
                  )
                  
                ],
              ),
            ),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'cancel',
                    style: TextStyle(color: Colors.black54),
                  )),
              BlocProvider(
                create: (context) => WalletBloc(),
                child: BlocConsumer<WalletBloc, WalletState>(
                  listener: (context, state) {
                    if (state is MoneyAddedSuccessfully) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WalletInfo(),
                          ));
                    }
                  },
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () {
                          print(codee);
                          context
                              .read<WalletBloc>()
                              .add(Add_money_byCode(code: codee));
                          print('1');
                        },
                        child: Text(
                          'Done',
                          style:
                              TextStyle(color: Color.fromRGBO(8, 183, 131, 1)),
                        ));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
