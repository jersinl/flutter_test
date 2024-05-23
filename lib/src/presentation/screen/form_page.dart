import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/constants/app_strings.dart';
import 'package:test_app/src/presentation/viewmodel/form_page_view_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const channel = MethodChannel('ToastMethod');
    showToast(String msg) {
      channel.invokeMethod('Valor anterior:', {'msg': msg});
    }

    return Consumer<FormPageViewModel>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text(AppStrings.formPage),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: TextFormField(
                      controller: textController,
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(),
                          hintText: AppStrings.hintTestArray,
                          suffixIcon: Container(
                            margin: const EdgeInsets.all(5),
                            child: FilledButton(
                                onPressed: () {
                                  value.rotateList();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "ultimo valor: ${value.inputText}")));

                                  textController.clear();
                                },
                                child: const Text(AppStrings.buttonText)),
                          )),
                      onFieldSubmitted: (text) {
                        value.getList(text);
                        textController.clear();
                      },
                    )),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: value.sizeList,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    key: UniqueKey(),
                    itemCount: value.items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                        key: UniqueKey(),
                        child: Center(
                          child: Text(
                            value.items[index].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
