import 'package:flutter/material.dart';
import '/i18n/generated_i18n.dart';

/// 打開一個 顯示錯誤的 模式對話框
Future<void> showErrorMessageDialog(BuildContext context, e) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).error.title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "$e",
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(MaterialLocalizations.of(context).closeButtonLabel),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}

/// 打開一個 顯示錯誤的 模式對話框
Future<void> showErrorListMessageDialog(BuildContext context, List? errors) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).error.title),
        content: SingleChildScrollView(
          child: ListBody(
            children: errors
                    ?.map((data) => Text(
                          "$data",
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ))
                    .toList() ??
                <Widget>[],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(MaterialLocalizations.of(context).closeButtonLabel),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}

/// 打開一個 對話框 爲用戶顯示消息
Future<T?> showMessageDialog<T>(
    BuildContext context, Widget title, Widget? child,
    {List<Widget>? actions}) {
  actions ??= <Widget>[
    TextButton(
      child: Text(MaterialLocalizations.of(context).closeButtonLabel),
      onPressed: () => Navigator.of(context).pop(),
    ),
  ];

  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: child == null
            ? null
            : SingleChildScrollView(
                child: child,
              ),
        actions: actions,
      );
    },
  );
}

/// 打開一個 要求用戶確定操作的 確認對話框
Future<bool?> showConfirmDialog(
  BuildContext context,
  Widget title,
  Widget child,
) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: child,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          TextButton(
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      );
    },
  );
}

/// 打開一個 用戶輸入 對話框
Future<bool?> showInputDialog<bool>(
  BuildContext context,
  Widget title,
  Widget? child,
) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: child,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          TextButton(
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      );
    },
  );
}

// /// 打開一個 二維碼顯示 窗口
// Future<void> showQRCodeDialog(
//   BuildContext context,
//   Widget title,
//   Uint8List data,
//   String value,
// ) {
//   assert(data != null);
//   String str;
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: title,
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.memory(data),
//               TextFormField(
//                 readOnly: true,
//                 initialValue: value,
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text(S.of(context).app.save),
//             onPressed: () async {
//               try {
//                 if (str == null) {
//                   //str = await ImageGallerySaver.saveImage(data);
//                   str = await savePNG(data);
//                 }
//                 showMessageDialog(context,
//                     Text(S.of(context).app.saveImageSucess), Text("$str"));
//               } catch (e) {
//                 showErrorMessageDialog(context, e);
//               }
//             },
//           ),
//           FlatButton(
//             child: Text(S.of(context).app.share),
//             onPressed: () async {
//               try {
//                 if (str == null) {
//                   str = await savePNG(data);
//                 }
//                 ShareIt.file(
//                   path: str,
//                   type: ShareItFileType.image,
//                 ).catchError((e) {
//                   showErrorMessageDialog(context, e);
//                 });
//                 debugPrint("shared $str");
//               } catch (e) {
//                 showErrorMessageDialog(context, e);
//               }
//             },
//           ),
//           FlatButton(
//             child: Text(MaterialLocalizations.of(context).closeButtonLabel),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       );
//     },
//   );
// }

// /// 打開一個 對話框 讓用戶輸入評價
// Future<void> showReviewsDialog(BuildContext context) {
//   final reviews = MyReviews.instance;
//   return reviews.setCount(0).then((value) => showDialog<void>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(S.of(context).app.reivew),
//             content: const MyReviewsView(),
//           );
//         },
//       ));
// }
