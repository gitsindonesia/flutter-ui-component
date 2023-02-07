const String codeSnippetGitsDialog = '''import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../gits_button/gits_button.dart';

// ignore: must_be_immutable
class GitsDialog<T> extends StatelessWidget {
  GitsDialog(
      {Key? key,
      this.title,
      this.content,
      this.iconColor,
      this.buttonLabel,
      this.icon,
      this.onPressed,
      this.autoCloseDuration,
      this.buttons,
      this.initState,
      this.closeAble = true,
      this.width,
      this.buttonLabelNegatif,
      this.buttonLabelPositive,
      required this.context})
      : super(key: key);
  final String? title;
  final String? content;
  final String? buttonLabel;
  final String? buttonLabelNegatif;
  final String? buttonLabelPositive;
  final BuildContext context;
  final double? width;

  final Color? iconColor;
  final IconData? icon;
  final Duration? autoCloseDuration;
  final Function()? onPressed;
  final Function(BuildContext context)? initState;
  final List<Widget>? buttons;
  final bool? closeAble;
  bool isLoading = false;
  Future<T?> show() async {
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration!,
        () {
          if (!isClosed) {
            Navigator.pop(context);
          }
          if (kDebugMode) {
            print("still Called");
          }
        },
      );
    }
    return await showDialog<T?>(
        context: context,
        builder: (_) {
          return GitsDialog(
            context: context,
            width: width,
            icon: icon,
            title: title,
            content: content,
            buttonLabel: buttonLabel,
            iconColor: iconColor,
            onPressed: onPressed,
          );
        }).then((value) {
      isClosed = true;
      return value;
    });
  }

  Future<T?> showSuccess() async {
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration!,
        () {
          if (!isClosed) {
            Navigator.pop(context);
          }
        },
      );
    }
    return await showDialog<T?>(
        context: context,
        builder: (_) {
          return GitsDialog(
            context: context,
            width: width,
            icon: icon ?? Icons.check_circle,
            title: title,
            content: content,
            buttonLabel: buttonLabel,
iconColor: iconColor,            onPressed: onPressed,
          );
        }).then((value) {
      isClosed = true;
      return value;
    });
  }

  Future<T?> showError() async {
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration!,
        () {
          if (!isClosed) {
            Navigator.pop(context);
          }
        },
      );
    }
    return await showDialog<T?>(
        context: context,
        builder: (_) {
          return GitsDialog(
            context: context,
            width: width,
            icon: icon ?? Icons.error,
            title: title ?? "Error",
            content: content,
            buttonLabel: buttonLabel,
            iconColor: iconColor ?? Colors.red,
            onPressed: onPressed,
            closeAble: closeAble,
          );
        }).then((value) {
      isClosed = true;
      return value;
    });
  }

  Future<T?> showWarning() async {
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration!,
        () {
          if (!isClosed) {
            Navigator.pop(context);
          }
        },
      );
    }
    return await showDialog<T?>(
        context: context,
        builder: (_) => GitsDialog(
              context: context,
              icon: icon ?? Icons.warning,
              title: title,
              width: width,
              content: content,
              buttonLabel: buttonLabel,
              iconColor: iconColor ?? Colors.yellow,
              onPressed: onPressed,
              closeAble: closeAble,
            )).then((value) {
      isClosed = true;
      return value;
    });
  }

  Future<T?> showConfirm() async {
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration!,
        () {
          if (!isClosed) {
            Navigator.pop(context);
          }
        },
      );
    }
    return await showDialog<T?>(
        context: context,
        builder: (_) => GitsDialog(
              context: context,
              icon: icon ?? Icons.help,
              title: title,
              width: width,
              content: content,
              buttonLabel: buttonLabel,
              iconColor: iconColor ?? Theme.of(context).primaryColor,
              onPressed: onPressed,
              closeAble: closeAble,
              buttonLabelNegatif: buttonLabelNegatif,
              buttonLabelPositive: buttonLabelPositive,
              buttons: [
                Expanded(
                  child: GitsButton.elevated(
                    onPressed: () => Navigator.pop(_, false),
                    text: buttonLabelNegatif ?? "Tidak",
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: GitsButton.elevated(
                    onPressed: () => Navigator.pop(_, true),
                    text: buttonLabelPositive ?? "Iya",
                  ),
                )
              ],
            )).then((value) {
      isClosed = true;
      return value;
    });
  }

  Future<T?> showLoading() async {
    isLoading = true;
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration!,
        () {
          if (!isClosed) {
            Navigator.pop(context);
          }
        },
      );
    }
    return await showDialog<T?>(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          if (initState != null) {
            initState!(_);
          }
          return WillPopScope(onWillPop: () async => false, child: build(_));
        }).then((value) {
      isClosed = true;
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        height: isLoading ? MediaQuery.of(context).size.width * 0.7 : null,
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (closeAble == true)
                        Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.close))),
                      if (icon != null)
                        Icon(
                          icon,
                          color: iconColor ?? Colors.green,
                          size: MediaQuery.of(context).size.width * 0.09,
                        ),
                      if (icon != null)
                        const SizedBox(
                          height: 16,
                        ),
                      if (title != null)
                        Text(
                          title!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      if (title != null)
                        const SizedBox(
                          height: 10,
                        ),
                      if (content != null)
                        Text(
                          content!,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      if (content != null || title != null)
                        const SizedBox(
                          height: 16,
                        ),
                      if (buttonLabel != null && buttons == null)
                        GitsButton.elevated(
                          text: buttonLabel!,
                          onPressed: onPressed ?? () => Navigator.pop(context),
                        ),
                      if (buttons != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buttons!,
                        )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
''';
const String codeSnippetExampleGitsDialog = '''class ExampleGitsDialogPage extends StatefulWidget {
  const ExampleGitsDialogPage({super.key});

  @override
  State<ExampleGitsDialogPage> createState() => _ExampleGitsDialogPageState();
}

class _ExampleGitsDialogPageState extends State<ExampleGitsDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Gits Button"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GitsButton.elevated(
                  text: "Default Dialog",
                  onPressed: () async {
                    GitsDialog(
                            context: context,
                            width: 400,
                            title: "Default Dialog",
                            buttonLabel: "Ok",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .show();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.outlined(
                  text: "Dialog Show Error",
                  onPressed: () async {
                    GitsDialog(
                            context: context,
                            width: 500,
                            title: "Dialog Show Error",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showError();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.elevated(
                  text: "Dialog Show Success",
                  onPressed: () async {
                    await GitsDialog(
                            context: context,
                            width: 400,
                            title: "Gits Dialog",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showSuccess();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.outlined(
                  text: "Dialog Show Warning",
                  onPressed: () async {
                    await GitsDialog(
                            context: context,
                            width: 400,
                            title: "Gits Dialog",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showWarning();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.elevated(
                  text: "Dialog Show Confirm",
                  onPressed: () async {
                    bool isConfirm = await GitsDialog(
                            width: 600,
                            context: context,
                            title: "Gits Dialog",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showConfirm();
                    if (isConfirm) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Confirmed')),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Not Confirm')),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
''';
