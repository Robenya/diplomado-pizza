import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

/*
La pizzería Bella Napoli ofrece pizzas vegetarianas y no vegetarianas a sus clientes.
Los ingredientes para cada tipo de pizza aparecen a continuación.
Ingredientes vegetarianos: Pimiento y tofu.
Ingredientes no vegetarianos: Peperoni, Jamón y Salmón.
Mozzarella y tomate están en todas la pizzas.

Al final se debe mostrar por pantalla si la pizza elegida es vegetariana o no y todos los ingredientes que lleva.
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzeria Botelli',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pizzeria Botelli - Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch(selectedIndex){
      case 0:
        page = const Vegetariana();
        break;
      case 1:
        page = const NoVegetariana();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, contraints) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Text('Elige tu pizza', style: TextStyle(fontSize: 20)),
                NavigationBar(
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.local_pizza), 
                      label: 'Vegetariana',
                      ),
                    NavigationDestination(
                      icon: Icon(Icons.local_pizza_outlined), 
                      label: 'No Vegetariana',
                      )
                    ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = (value);
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page,
                  )
                ),
              ]
            ),
          ),
        );
      }
    );
  }
}

class Vegetariana extends StatefulWidget {
  const Vegetariana({super.key});

  @override
  State<Vegetariana> createState() => _VegetarianaState();
}

enum IngredientePizza {
  pimiento, tofu, pepperoni, jamon, salmon
  }

class _VegetarianaState extends State<Vegetariana> {
  IngredientePizza? ingrediente = IngredientePizza.pimiento;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        const Text(
          'Elige tu ingrediente:', 
          style: TextStyle(fontSize: 20)),
        ListTile(
          title: const Text('Pimiento'),
          leading: Radio<IngredientePizza>(
            value: IngredientePizza.pimiento, 
            groupValue: ingrediente, 
            onChanged: (IngredientePizza? value) {
              setState(() {
                ingrediente = value;
              }); 
            }
          )
        ),
        ListTile(
          title: const Text('Tofu'),
          leading: Radio<IngredientePizza>(
            value: IngredientePizza.tofu, 
            groupValue: ingrediente, 
            onChanged: (IngredientePizza? value) {
              setState(() {
                ingrediente = value;
              }); 
            }
          )
        ),
        ElevatedButton(
          child: const Text('Ordenar'),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog.fullscreen(
              child: Card(
                elevation: 10,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Pizza vegetariana',
                      style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10,),
                      const Text('Ingredientes:'),
                      Text(ingrediente!.name.toUpperCase()),
                      const Text('Mozzarella'),
                      const Text('Tomate'),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            )      
          )
        ),
      ]
    );
  }
}

class NoVegetariana extends StatefulWidget {
  const NoVegetariana({super.key});

  @override
  State<NoVegetariana> createState() => _NoVegetarianaState();
}

class _NoVegetarianaState extends State<NoVegetariana> {
  IngredientePizza? ingrediente = IngredientePizza.pepperoni;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        const Text(
          'Elige tu ingrediente:', 
          style: TextStyle(fontSize: 20)),
        ListTile(
          title: const Text('Pepperoni'),
          leading: Radio<IngredientePizza>(
            value: IngredientePizza.pepperoni, 
            groupValue: ingrediente, 
            onChanged: (IngredientePizza? value) {
              setState(() {
                ingrediente = value;
              }); 
            }
          )
        ),
        ListTile(
          title: const Text('Jamon'),
          leading: Radio<IngredientePizza>(
            value: IngredientePizza.jamon, 
            groupValue: ingrediente, 
            onChanged: (IngredientePizza? value) {
              setState(() {
                ingrediente = value;
              }); 
            }
          )
        ),
        ListTile(
          title: const Text('Salmon'),
          leading: Radio<IngredientePizza>(
            value: IngredientePizza.salmon, 
            groupValue: ingrediente, 
            onChanged: (IngredientePizza? value) {
              setState(() {
                ingrediente = value;
              }); 
            }
          )
        ),
        ElevatedButton(
          child: const Text('Ordenar'),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog.fullscreen(
              child: Card(
                elevation: 10,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Pizza no vegetariana', 
                        style: TextStyle(fontSize: 20)
                        ),
                      const SizedBox(height: 10,),
                      const Text('Ingredientes:'),
                      Text(ingrediente!.name.toUpperCase()),
                      const Text('Mozzarella'),
                      const Text('Tomate'),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            )      
          )
        ),
      ],
    );
  }
}