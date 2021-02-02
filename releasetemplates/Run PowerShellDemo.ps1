{
  "Description": "PowerShellDemo.ps1",
  "JobConfiguration": {
    "ScriptId": "Default::Script::PowerShellDemo.ps1",
    "JobType": 0,
    "ServerTargeting": 1,
    "TemplateId": null,
    "ServerNames": [
      "LOCALHOST"
    ],
    "ServerRoleNames": [],
    "EnvironmentNames": [],
    "Simulation": false,
    "Async": false,
    "CronSchedule": null,
    "Variables": {}
  },
  "TemplateUsage": 1,
  "RestrictToApiKey": null,
  "JobVariables": [
    {
      "Name": "YourName",
      "Description": null,
      "InitialValue": null,
      "Required": false,
      "Sensitive": false,
      "Type": "Text",
      "ListValues": [],
      "ListMultiple": false,
      "ListRestrict": true,
      "ListSourceDescription": null,
      "ListSourceXml": null,
      "ListVariableSource": null
    },
    {
      "Name": "EnableCuteMode",
      "Description": null,
      "InitialValue": null,
      "Required": false,
      "Sensitive": false,
      "Type": "Checkbox",
      "ListValues": [],
      "ListMultiple": false,
      "ListRestrict": true,
      "ListSourceDescription": null,
      "ListSourceXml": null,
      "ListVariableSource": null
    }
  ]
}