import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:flutter_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter_delivery_app/app/pages/auth/login/register/register_controller.dart';
import 'package:flutter_delivery_app/app/pages/auth/login/register/register_state.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/base_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSucess('Usuário cadastrado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Cadastro', style: context.textStyles.textTitle),
              Text(
                'Preencha os campos para criar seu cadastro',
                style: context.textStyles.textMedium.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                controller: _nameEC,
                validator: Validatorless.required('Nome obrigatório'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                controller: _emailEC,
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail obrigatório'),
                  Validatorless.email('E-mail inválido')
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  controller: _passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Senha obrigatória"),
                    Validatorless.min(
                        6, 'Sua senha deve conter no mínimo 6 caracteres')
                  ])),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Confirma senha'),
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Confirmar a senha é obrigatória"),
                    Validatorless.compare(_passwordEC, 'As senhas não conferem')
                  ])),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: DeliveryButton(
                  onPressed: () {
                    final valid = _formKey.currentState?.validate() ?? false;
                    if (valid) {
                      controller.register(
                          _nameEC.text, _emailEC.text, _passwordEC.text);
                    }
                  },
                  label: 'Cadastrar',
                  widht: double.infinity,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
