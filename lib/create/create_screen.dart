import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/api/api_postal_code.dart';
import 'package:xlo/common/custom_drawer/cep_field.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';
import 'package:xlo/create/widgets/hide_phone_widget.dart';
import 'package:xlo/create/widgets/images_field.dart';


class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Inserir anuncio'),
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            ImagesField(
              onSaved: (images) {
                print(images);
              },
              initialValue: [],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Título *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text) {
                if (text.isEmpty) return 'Campo obrigatório';
                return null;
              },
              onSaved: (t) {
                //ad.title = t;
              },
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Descrição *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text) {
                if (text.trim().isEmpty) return 'Campo obrigatório';
                if (text.trim().length < 10) return 'Descrição muito curta';
                return null;
              },
              onSaved: (d) {
                //ad.description = d;
              },
            ),
            CepField(
              decoration: InputDecoration(
                labelText: 'CEP *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              onSaved: (d) {
                //ad.description = d;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Preço *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
              validator: (text) {
                if (text.isEmpty) return 'Campo obrigatório';
                if (int.tryParse(getSanitizedText(text)) == null)
                  return 'Utilize valores válidos';
                return null;
              },
              onSaved: (p) {
                //ad.price = int.parse(getSanitizedText(p)) / 100;
              },
            ),
             HidePhoneWidget(
                  onSaved: (h){
                    //ad.hidePhone = h;
                  },
                  initialValue: false,
                ),
            Container(
              height: 50,
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    getAddressFromApi('95.185000');
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

    String getSanitizedText(String text) {
    return text.replaceAll(RegExp(r'[^\d]'), '');
  }
}
