import 'package:flutter/cupertino.dart';

class investmentPage extends StatefulWidget {
  const investmentPage({Key? key}) : super(key: key);

  @override
  State<investmentPage> createState() => _investmentPage();
}

class _investmentPage extends State<investmentPage> {
  List<Stock> stockList=[];
  String searchValue = '';
   List<String> _suggestions = [];

  @override
  void initState(){
    initStockList();
    initSearchBarSugggestions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: EasySearchBar(
              title: const Text('Find Stocks'),
              onSearch: (value) => setState(() => searchValue),


          ),
          drawer: Drawer(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                        title: const Text('Item 1'),
                        onTap: () => Navigator.pop(context)
                    ),
                    ListTile(
                        title: const Text('Item 2'),
                        onTap: () => Navigator.pop(context)
                    )
                  ]
              )
          ),
        body: ListView.builder(itemCount: stockList.length, itemBuilder: (BuildContext context,int index){
          Color tileColor;
          if (stockList[index].rating > 1 && stockList[index].rating < 3){
            tileColor=Colors.red;
          }else if(stockList[index].rating > 3 && stockList[index].rating < 4){
            tileColor=Colors.orange;
          }else{
            tileColor = Colors.green;
          }
          return Container (
              decoration: new BoxDecoration (
              color: tileColor
          ),
          child: new ListTile(
          leading: Text(stockList[index].stockName),
          trailing: Text(stockList[index].stockCurrentPrice.toString()),
          onLongPress: () => {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  FormPage(title: "Stock trading",stockName: stockList[index].stockName,stockPrice: stockList[index].stockCurrentPrice))
          )
          },
          ));
        }),
      )
    );
  }


  
  //create mock data for the investment page
  void initStockList() {
    Stock stock1 = Stock("ARK",10.24,2.3);
    Stock stock2 = Stock("MYB",30.1,4.1);
    Stock stock3 = Stock("GGO",100.4,4.9);
    stockList.add(stock1);
    stockList.add(stock2);
    stockList.add(stock3);

  }

  void initSearchBarSugggestions(){
    stockList.forEach((element) {
      _suggestions.add(element.stockName);
    });
  }

  void searchStock(String stockName){
    final suggestions = stockList.where((element) {
      final stock = element.stockName.toLowerCase();
      final query = stockName.toLowerCase();

      return (stock.contains(query));
    }).toList();

    setState(() {
      stockList= suggestions;
    });
  }
}


class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title,required this.stockName, required this.stockPrice}) : super(key: key);

  final String title;
  final String stockName;
  final double stockPrice;


  @override
  _FormPageState createState() => _FormPageState(stockPrice,stockName);
}

class _FormPageState extends State<FormPage> {

  _FormPageState(this.stockPrice,this.stockName);
  double stockPrice=0;
  String stockName='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SignUpForm(stockPrice,stockName)),
    );
  }
}

class SignUpForm extends StatefulWidget {

  SignUpForm(this.stockPrice,this.stockName);
  double stockPrice;
  String stockName;

  @override
  _SignUpFormState createState() => _SignUpFormState(stockPrice,stockName);
}

class _SignUpFormState extends State<SignUpForm> {

  _SignUpFormState(this.stockPrice,this.stockName);
  double stockPrice;
  String stockName;

  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();


  String _name = '';
  String _email = '';
  int _age = -1;
  String _maritalStatus = 'single';
  int _selectedGender = 0;
  String _password = '';
  bool _termsChecked = true;
  int quantity=0;
  double totalPrice = 0;

  List<DropdownMenuItem<int>> genderList = [];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(TextFormField(
      decoration:
      const InputDecoration(labelText: 'StockName', hintText: 'Name'),
      initialValue: stockName,
      enabled: false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a name';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));

    validateEmail(String? value) {
      if (value!.isEmpty) {
        return 'Please enter mail';
      }

      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());
      if (!regex.hasMatch(value.toString())) {
        return 'Enter Valid Email';
      } else {
        return null;
      }
    }

    formWidget.add(TextFormField(
      decoration:
      const InputDecoration(labelText: 'StockCurrentPrice', hintText: 'price'),
      initialValue: stockPrice.toString(),
      enabled: false,
      onSaved: (value) {
        setState(() {
          _email = value.toString();
        });
      },
    ));

    formWidget.add(TextFormField(
      decoration:
      const InputDecoration(hintText: 'quantity', labelText: 'Enter quantity'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter quantity';
        } else {
          return null;
        }
      },
      onChanged:(value) {
        setState(() {
          quantity = int.parse(value.toString());
          totalPrice = quantity*stockPrice;
          print(totalPrice);
        }) ;
      },
    ));

    // formWidget.add(TextFormField(
    //   decoration:
    //   const InputDecoration(hintText: 'quantity', labelText: 'Total'),
    //   keyboardType: TextInputType.number,
    //   initialValue: totalPrice.toString(),
    //   enabled: false,
    //
    // ));





    formWidget.add(CheckboxListTile(
      value: _termsChecked,
      onChanged: (value) {
        setState(() {
          _termsChecked = value.toString().toLowerCase() == 'true';
        });
      },
      subtitle: !_termsChecked
          ? const Text(
        'Required',
        style: TextStyle(color: Colors.red, fontSize: 12.0),
      )
          : null,
      title: const Text(
        'I agree to the terms and condition',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    void onPressedSubmit() {
      if (_formKey.currentState!.validate() && _termsChecked) {
        _formKey.currentState?.save();

        print("Name " + _name);
        print("Email " + _email);
        print("Age " + _age.toString());
        switch (_selectedGender) {
          case 0:
            print("Gender Male");
            break;
          case 1:
            print("Gender Female");
            break;
          case 3:
            print("Gender Others");
            break;
        }
        print("Marital Status " + _maritalStatus);
        print("Password " + _password);
        print("Termschecked " + _termsChecked.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Order Submitted')));
      }
    }

    formWidget.add(ElevatedButton(
        child: const Text('Buy'), onPressed: onPressedSubmit));
    formWidget.add(ElevatedButton(
        child: const Text('Sell'), onPressed: onPressedSubmit));

    return formWidget;
  }
}
