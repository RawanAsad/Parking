import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/core/domain/models/wallet_nodel.dart';
import 'package:parkingapp/feature/Wallet/bloc/wallet_bloc.dart';
import 'package:parkingapp/feature/Wallet/wallet_Info.dart';
import 'package:parkingapp/feature/signup/bloc/signup_bloc.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({super.key});

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController securityCode = TextEditingController();
    TextEditingController confirmSecurityCode = TextEditingController();
    TextEditingController bankAccount = TextEditingController();
    return BlocProvider(
      create: (context) => WalletBloc(),
      child: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {
        if (state is WalletCreatedSuccessfully){
  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => WalletInfo(),
                              ));
        }
        },
        builder: (context, state) {
          return Builder(builder: (context) {
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 360,
                      child: TextFormField(
                        controller: securityCode,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your code"),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 60,
                      width: 360,
                      child: TextFormField(
                        controller: confirmSecurityCode,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Confirm your code"),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 60,
                      width: 360,
                      child: TextFormField(
                        controller: bankAccount,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your bank Account"),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                        onTap: () {
                          context.read<WalletBloc>().add(create_the_wallet(
                              create_wallet_info: Wallet_Model(
                                  securityCode: securityCode.text,
                                  confirmSecurityCode: confirmSecurityCode.text,
                                  bankAccount: bankAccount.text)));
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              'create',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 137, 85, 1),
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    BlocBuilder<WalletBloc, WalletState>(
                        builder: (context, state) {
                      switch (state) {
                        case WalletCreatedSuccessfully():
                        
                          return Text('yes');
                        case Erorrr():
                          return Container(
                            width: 200,
                            height: 50,
                            child: Text(
                              "erorrrrrrrrrrrr",
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        default:
                          return const Center(
                            child: Text('wait'),
                          );
                      }
                    })
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
