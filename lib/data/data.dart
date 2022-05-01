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
