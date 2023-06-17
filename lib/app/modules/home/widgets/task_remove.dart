import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_controller.dart';

class RemoveTask extends AlertDialog {
  RemoveTask(BuildContext context, String task, int id, {super.key})
      : super(
          title: const Text('Deletar Task?'),
          content: Text(task),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeController>().removeTask(id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Removida a anotação: $task'),
                    ));
                    Navigator.of(context).pop(true);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Sim')),
            ),
            // SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Não')),
            ),
          ],
        );
}
