// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    hide
        Tooltip,
        Colors,
        Chip,
        ButtonStyle,
        showDialog,
        Checkbox,
        CheckboxThemeData;
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tempgen/helpers/user_preferences.dart';
import 'package:tempgen/screens/login.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../helpers/firebase_helper.dart';
import '../theme.dart';

const List<String> accentColorNames = [
  'System',
  'Yellow',
  'Orange',
  'Red',
  'Magenta',
  'Purple',
  'Blue',
  'Teal',
  'Green',
];

bool get kIsWindowEffectsSupported {
  return !kIsWeb &&
      [
        TargetPlatform.windows,
        TargetPlatform.linux,
        TargetPlatform.macOS,
      ].contains(defaultTargetPlatform);
}

const _LinuxWindowEffects = [
  WindowEffect.disabled,
  WindowEffect.transparent,
];

const _WindowsWindowEffects = [
  WindowEffect.disabled,
  WindowEffect.solid,
  WindowEffect.transparent,
  WindowEffect.aero,
  WindowEffect.acrylic,
  WindowEffect.mica,
  WindowEffect.tabbed,
];

const _MacosWindowEffects = [
  WindowEffect.disabled,
  WindowEffect.titlebar,
  WindowEffect.selection,
  WindowEffect.menu,
  WindowEffect.popover,
  WindowEffect.sidebar,
  WindowEffect.headerView,
  WindowEffect.sheet,
  WindowEffect.windowBackground,
  WindowEffect.hudWindow,
  WindowEffect.fullScreenUI,
  WindowEffect.toolTip,
  WindowEffect.contentBackground,
  WindowEffect.underWindowBackground,
  WindowEffect.underPageBackground,
];

List<WindowEffect> get currentWindowEffects {
  if (kIsWeb) return [];

  if (defaultTargetPlatform == TargetPlatform.windows) {
    return _WindowsWindowEffects;
  } else if (defaultTargetPlatform == TargetPlatform.linux) {
    return _LinuxWindowEffects;
  } else if (defaultTargetPlatform == TargetPlatform.macOS) {
    return _MacosWindowEffects;
  }

  return [];
}

class Settings extends StatefulWidget {
  const Settings({Key? key, this.controller}) : super(key: key);

  final ScrollController? controller;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String email = "";

  void getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    email = _prefs.getString("email").toString();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final appTheme = context.watch<AppTheme>();
    const spacer = SizedBox(height: 10.0);
    const biggerSpacer = SizedBox(height: 40.0);
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Settings')),
      scrollController: widget.controller,
      children: [
        Text('Theme mode', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        ...List.generate(ThemeMode.values.length, (index) {
          final mode = ThemeMode.values[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.mode == mode,
              onChanged: (value) {
                if (value) {
                  appTheme.mode = mode;

                  if (kIsWindowEffectsSupported) {
                    // some window effects require on [dark] to look good.
                    appTheme.setEffect(appTheme.windowEffect, context);
                  }
                }
              },
              content: Text('$mode'.replaceAll('ThemeMode.', '')),
            ),
          );
        }),
        biggerSpacer,
        Text('Accent Color',
            style: FluentTheme.of(context).typography.subtitle),
        spacer,
        Wrap(children: [
          Tooltip(
            child: _buildColorBlock(appTheme, systemAccentColor),
            message: accentColorNames[0],
          ),
          ...List.generate(Colors.accentColors.length, (index) {
            final color = Colors.accentColors[index];
            return Tooltip(
              message: accentColorNames[index + 1],
              child: _buildColorBlock(appTheme, color),
            );
          }),
        ]),
        biggerSpacer,
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("email", isEqualTo: "kosai.pairo@hotmail.com")
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              var docs = snapshot.data?.docs;
              print("Users: ${docs![0]['email']}");
              if (docs[0].exists && docs[0]['userRole'] == "admin") {
                return Text('Add Users',
                    style: FluentTheme.of(context).typography.subtitle);
              } else {
                return const Center();
              }
            } else {
              return const SizedBox();
            }
          },
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("email", isEqualTo: "kosai.pairo@hotmail.com")
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              var docs = snapshot.data?.docs;
              if (docs![0]['userRole'] == "admin") {
                return Center(
                  child: SizedBox(
                    width: 150,
                    child: Chip.selected(
                      image: const CircleAvatar(
                        radius: 12.0,
                        child: Icon(
                          FluentIcons.follow_user,
                          size: 14.0,
                        ),
                      ),
                      text: const Text('New User'),
                      onPressed: () {
                        showDialog(
                            builder: (BuildContext context) {
                              TextEditingController _emailEditingController =
                                  TextEditingController();
                              TextEditingController _passwordEditingController =
                                  TextEditingController();
                              bool disabled = false;
                              bool? isAdmin = false;
                              String role = "user";
                              return ContentDialog(
                                title: Text("User Registration"),
                                content: Material(
                                  child: Center(
                                    child: Container(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: const [
                                              CustomText(
                                                  text: "Register New User",
                                                  color: Colors.grey,
                                                  weight: FontWeight.normal,
                                                  size: 14),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextField(
                                            controller: _emailEditingController,
                                            decoration: InputDecoration(
                                                labelText: "Email",
                                                hintText: "email@domain.com",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextField(
                                            obscureText: true,
                                            controller:
                                                _passwordEditingController,
                                            decoration: InputDecoration(
                                                labelText: "Password",
                                                hintText: "******",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    onChanged: disabled
                                                        ? null
                                                        : (v) => setState(() =>
                                                            isAdmin =
                                                                v ?? false),
                                                    checked: isAdmin,
                                                  ),
                                                  const CustomText(
                                                    text:
                                                        "Is the user an administrator?",
                                                    weight: FontWeight.normal,
                                                    color: Colors.black,
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (_passwordEditingController
                                                      .text.isNotEmpty &&
                                                  _emailEditingController
                                                      .text.isNotEmpty) {
                                                if (isAdmin != null &&
                                                    isAdmin == true) {
                                                  role = "admin";
                                                } else {
                                                  role = "user";
                                                }
                                                FirebaseHelper()
                                                    .registerWithEmailPassword(
                                                        _emailEditingController
                                                            .text,
                                                        _passwordEditingController
                                                            .text,
                                                        role,
                                                        context)
                                                    .then((value) {
                                                  if (value != null) {
                                                    Navigator.of(context).pop();
                                                  } else {
                                                    showTopSnackBar(
                                                        context,
                                                        Center(
                                                          child: Text(
                                                            'Registration failed. Please try again',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ));
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              alignment: Alignment.center,
                                              width: double.maxFinite,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16),
                                              child: const CustomText(
                                                  text: "Register",
                                                  color: Colors.white,
                                                  weight: FontWeight.normal,
                                                  size: 16),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                            context: context);
                      },
                    ),
                  ),
                );
              } else {
                return const Center();
              }
            } else {
              return const SizedBox();
            }
          },
        ),
        biggerSpacer,
        Text('Session', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        spacer,
        Center(
          child: SizedBox(
            width: 100,
            child: Chip.selected(
              image: const CircleAvatar(
                radius: 12.0,
                child: Icon(
                  FluentIcons.lock,
                  size: 14.0,
                ),
              ),
              text: const Text('Logout'),
              onPressed: () {
                UserPrefs().clearPreferences();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorBlock(AppTheme appTheme, AccentColor color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Button(
        onPressed: () {
          appTheme.color = color;
        },
        style: ButtonStyle(
          padding: ButtonState.all(EdgeInsets.zero),
          backgroundColor: ButtonState.resolveWith((states) {
            if (states.isPressing) {
              return color.light;
            } else if (states.isHovering) {
              return color.lighter;
            }
            return color;
          }),
        ),
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child: appTheme.color == color
              ? Icon(
                  FluentIcons.check_mark,
                  color: color.basedOnLuminance(),
                  size: 22.0,
                )
              : null,
        ),
      ),
    );
  }
}
