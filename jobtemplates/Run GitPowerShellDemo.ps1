{
  "Description": "DefaultGit::PowerShellDemo.ps1",
  "JobConfiguration": {
    "ScriptId": "DefaultGit::Script::PowerShellDemo.ps1",
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
      "CustomRenderer": null,
      "Type": "Text",
      "Usage": 0,
      "PipelineStageNames": [],
      "ListValues": [],
      "ListMultiple": false,
      "ListRestrict": true
    },
    {
      "Name": "EnableCuteMode",
      "Description": null,
      "InitialValue": null,
      "Required": false,
      "Sensitive": false,
      "CustomRenderer": null,
      "Type": "Checkbox",
      "Usage": 0,
      "PipelineStageNames": [],
      "ListValues": [],
      "ListMultiple": false,
      "ListRestrict": true
    }
  ]
}