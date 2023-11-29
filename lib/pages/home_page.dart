import 'package:flutter/material.dart';
import 'package:flutter_codigo_taskdb/db/db_admin.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DBAdmin.db.getTask();
              },
              child: Text("Mostrar data"),
            ),
            ElevatedButton(
              onPressed: () {
                //DBAdmin.db.insertRawTask();
                DBAdmin.db.insertask();
              },
              child: Text("Insertar tarea"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Actualizar tarea"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Eliminar tarea"),
            )
          ],
        ),
      ),
    );
  }
}
