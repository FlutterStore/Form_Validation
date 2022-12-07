// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form_validation(),
    );
  }
}

class Form_validation extends StatefulWidget {
  const Form_validation({super.key});

  @override
  State<Form_validation> createState() => _Form_validationState();
}

class _Form_validationState extends State<Form_validation> {

  TextEditingController name= TextEditingController();
  TextEditingController number= TextEditingController();
  TextEditingController email= TextEditingController();

  final FocusNode emailFocus = FocusNode();

  final _validationKey = GlobalKey<FormState>();

  int validateEmail(String emailAddress) {
    String patttern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(patttern);
    if (emailAddress.isEmpty || emailAddress.isEmpty) {
      return 1;
    } else if (!regExp.hasMatch(emailAddress)) {
      return 2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Form Validation",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
              'Enter Your Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: name,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.green,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z ]'), allow: true)
                  ],
                  style: const TextStyle(height: 1,fontSize: 13,color: Colors.green),
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18,right: 18,),
                      child: Icon(Icons.person,color: Colors.black,)
                    ),
                    labelText: 'Enter Your Name',
                    labelStyle: TextStyle(fontSize: 12,color: Colors.grey.withOpacity(.8)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),)
                  ),
                  onChanged: (value){
                    
                  },
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
              'Enter Mobile Number',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: number,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.green,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'^[0-9]{1,10}'), allow: true)
                  ],
                  style: const TextStyle(height: 1,fontSize: 13,color: Colors.green),
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18,right: 18,),
                      child: Icon(Icons.call,color: Colors.black,)
                    ),
                    labelText: 'Enter Mobile Number',
                    labelStyle: TextStyle(fontSize: 12,color: Colors.grey.withOpacity(.8)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),)
                  ),
                  onChanged: (value){
                    
                  },
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
              'Enter Email Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10,),
              Form(
                key: _validationKey,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {},
                  maxLines: 1,
                  validator: (value) {
                    int res = validateEmail(value!);
                    if (res == 1) {
                      return "Please  fill email address";
                    } else if (res == 2) {
                      return "Please enter valid email address";
                    } else {
                      return null;
                    }
                  },
                  focusNode: emailFocus,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18,right: 18,),
                      child: Icon(Icons.email_rounded,color: Colors.black,)
                    ),
                    labelText: 'Enter Email Address',
                    labelStyle: TextStyle(fontSize: 12,color: Colors.grey.withOpacity(.8)),
                    errorMaxLines: 3,
                    counterText: "",
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffE5E5E5),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              OutlinedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () 
                {
                  if(name.text.isEmpty){
                    SnackBarrr(context, 'Enter Your Name');
                  }
                  else if(number.text.isEmpty){
                    SnackBarrr(context, 'Enter Mobile Number');
                  }
                  else if(number.text.length < 10)
                  {
                    SnackBarrr(context, 'Enter Valid Mobile Number');
                  }
                  else if (email.text.isEmpty) {
                   _validationKey.currentState?.validate();
                    SnackBarrr(context, 'Enter Your Email');
                  } 
                  // else if(email.text ==''){
                  // }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Homepage(),));
                  }
                }, 
                child: const Text("Submit",style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }

  SnackBarrr(BuildContext context, String title){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title, style: const TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.red.withOpacity(0.8),
        action: SnackBarAction(label: "",textColor: Colors.white, onPressed: (){}),
        padding: const EdgeInsets.only(top: 5,left: 8),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Home page",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: const Center(child: Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}