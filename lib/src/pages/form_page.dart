import 'package:flutter/material.dart';

class InputPageMascota extends StatefulWidget {
  @override
  _InputPageStateMascota createState() => _InputPageStateMascota();
}

class _InputPageStateMascota extends State<InputPageMascota> {
  String _nombremascota = '';
  String _nombredueno = '';
  String _telefono = '';
  String _raza = '';
  String _edad = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Macho';
  String _opcionSeleccionadatipo = 'Perro';

  List _items = [];
  List<String> _sexo = ['Macho', 'Hembra'];
  List<String> _tipomascota = [
    'Perro',
    'Gato',
    'Ave',
    'Hámsters',
    'Pez',
    'Conejo'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Mascotas'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _crearmascota(),
              Divider(),
              _creardueno(),
              Divider(),
              _creartel(),
              Divider(),
              _crearedad(),
              Divider(),
              _crearFechaNac(context),
              Divider(),
              _crearraza(),
              Divider(),
              _crearDrop(),
              Divider(),
              _crearDroptipo(),
              Divider(),
            ],
          ),
          _lista()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          _Clear();

          //Navigator.pop(context);
        },
      ),
    );
  }

  Widget _crearmascota() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre de Mascota',
          labelText: 'Nombre Mascota',
          helperText: 'Ingrese el nombre de su mascota',
          suffixIcon: Icon(Icons.pets_outlined),
          icon: Icon(Icons.pets_sharp)),
      onChanged: (valor) {
        setState(() {
          _nombremascota = valor;
        });
      },
    );
  }

  Widget _creardueno() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del dueño',
          labelText: 'Nombre completo',
          helperText: 'Ingrese el nombre del representante',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombredueno = valor;
        });
      },
    );
  }

  Widget _creartel() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contacto del dueño',
          labelText: 'Teléfono',
          helperText: 'Ingrese el número del representante',
          suffixIcon: Icon(Icons.call),
          icon: Icon(Icons.call_sharp)),
      onChanged: (valor) {
        setState(() {
          _telefono = valor;
        });
      },
    );
  }

  Widget _crearraza() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Raza Mascota',
          labelText: 'Raza Mascota',
          helperText: 'Ingrese la raza',
          suffixIcon: Icon(Icons.pest_control_rodent),
          icon: Icon(Icons.pest_control)),
      onChanged: (valor) {
        setState(() {
          _raza = valor;
        });
      },
    );
  }

  Widget _crearedad() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Edad Mascota',
          labelText: 'Edad Mascota',
          helperText: 'Ingrese la edad de su mascota',
          suffixIcon: Icon(Icons.pest_control_rodent),
          icon: Icon(Icons.pest_control)),
      onChanged: (valor) {
        setState(() {
          _edad = valor;
        });
      },
    );
  }

  Widget _crearFechaNac(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _sexo.forEach((sexo) {
      lista.add(DropdownMenuItem(
        child: Text(sexo),
        value: sexo,
      ));
    });

    return lista;
  }

  Widget _crearDrop() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdowntipo() {
    List<DropdownMenuItem<String>> lista = new List();

    _tipomascota.forEach((tipo) {
      lista.add(DropdownMenuItem(
        child: Text(tipo),
        value: tipo,
      ));
    });

    return lista;
  }

  Widget _crearDroptipo() {
    return Row(
      children: <Widget>[
        Icon(Icons.policy_rounded),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionadatipo,
            items: getOpcionesDropdowntipo(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionadatipo = opt;
              });
            },
          ),
        )
      ],
    );
  }

  _Clear() {
    Map<String, dynamic> pet = {
      'nombrema': _nombremascota,
      'nombredue': _nombredueno,
      'tel': _telefono,
      'raza': _raza,
      'sexo': _opcionSeleccionada,
      'edad': _edad,
      'tipo': _opcionSeleccionadatipo,
      'fechanac': _fecha
    };
    setState(() {
      _items.add(pet);
    });

    // debugPrint(_items.toString());
    //debugPrint(_items[1].toString());
    // debugPrint(_items.join(','));
  }

  Widget _lista() {
    return ListView(
      children: _listaItems(_items, context),
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
          title: Text(opt['nombrema']),
          leading: (opt[Icon(Icons.pets_sharp)]),
          subtitle: Text('nombre dueno: $_nombredueno'
              '\n'
              'Tel: $_telefono'
              '\n'
              'Raza: $_raza'
              '\n'
              'Sexo: $_opcionSeleccionada'
              '\n'
              'Edad: $_edad'
              '\n'
              'Tipo: $_opcionSeleccionadatipo'
              '\n'
              'Fecha Nac.: $_fecha'),
          // trailing: Text(opt[Icon]),
          trailing: Icon(Icons.pets_sharp));

      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });

    return opciones;
  }
}
