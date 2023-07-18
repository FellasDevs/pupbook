import 'package:flutter/material.dart';

Future<bool?> ConfirmationDialog(
  BuildContext context, {
  required String title,
  String? description,
  Color? backgroundColor,
  Color? foregroundColor,
  String? cancelBtnTxt,
  Color? cancelButtonBgColor,
  Color? cancelButtonTxtColor,
  String? confirmBtnTxt,
  Color? confirmButtonBgColor,
  Color? confirmButtonTxtColor,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(title,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 20,
            )),
        content: Text(description ?? '',
            style: TextStyle(
              color: foregroundColor,
              fontSize: 18,
            )),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleLarge,
              backgroundColor: cancelButtonBgColor,
              foregroundColor: cancelButtonTxtColor,
            ),
            child: Text(cancelBtnTxt ?? 'Cancelar'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleLarge,
              backgroundColor: confirmButtonBgColor,
              foregroundColor: confirmButtonTxtColor,
            ),
            child: Text(confirmBtnTxt ?? 'Confirmar'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
}
