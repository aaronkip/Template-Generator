String templateName = "";
/*Map<String, dynamic> sectionList = {
  "sections": [
    {
      "data": {
        "title": "What level would you rate your eyestrain?",
        "choices": ["High", "Low"],
        "postFix": "level of eyestrain."
      }
    },
    {
      "data": {
        "title": "What symptoms accompany your eyestrain?",
        "choices": ["Headache", "Stomach ache", "Neck pains"],
        "postFix": "accompanies the patient's eyestrain."
      }
    },
    {
      "data": {
        "title": "What electronic devices do you use frequently?",
        "choices": ["Laptop", "Television", "Mobile Phone"],
        "postFix": "is frequently used by the patient."
      }
    },
  ],
};*/
int selectedIndex = 0;
Map<String, dynamic> selectedList = {};
Map<String, dynamic> sectionList = {"sections": []};

/*
void updateNotes(String prefix, String choice) {
  _notes['data'].add(
    {
      "prefix": prefix,
      "data": [choice]
    },
  );
  String combo = "";
  bool found = false;
  for (int i = 0; i < _notes['data'].length; i++) {
    if (_notes['data'][i]['prefix'] == prefix) {
      if (_notes['data'][i]['data'].toString().split(',').length > 1) {
        _notes['data'][i]['data'] =
            _notes['data'][i]['data'] + ", " + choice + "\n";
      } else {
        _notes['data'][i]['data'] = choice;
      }
      found = true;
    }
  }
  for (int i = 0; i < _notes['data'].length; i++) {
    combo = combo +
        _notes['data'][i]['prefix'] +
        " " +
        _notes['data'][i]['data'] +
        "\n";
  }
  setState(() {
    noteController.text = noteController.text + combo;
  });
}*/
