DF12-AgileTraining
==================

This repository contains all code used in the Dreamforce 2012 session "An Iterative approach to training in the Cloud".

The included class contains one method: 

    PermissionSetHelper.hasPermission(String permissionName)

This allows you to query the current user to see if they have access to a particular permission set passing the developer
name of the permission set as a string parameter.

This can then be leveraged in any JavaScript button from within Salesforce to check to see if the current user
has permission to the particular permission set before continuing on to another action.

The following is an example JavaScript button checks for the permission set "My_Wizard_Permission". If the user
has the permission set the user is redirected to the Apex page "myApexWizard" (but this could be any URL). Otherwise
the user is redirected to a page to complete training on the function.

========================================================================
{!REQUIRESCRIPT("/soap/ajax/24.0/connection.js")}
{!REQUIRESCRIPT("/soap/ajax/24.0/apex.js")}

var result = sforce.apex.execute(
   "PermissionSetHelper",
   "hasPermission", 
   {permissionName:"My_Wizard_Permission"});

if(result == 'true'){
  location.href = "/apex/myApexWizard";

}else{
  window.open('https://docs.google.com/a/netstronghold.com/spreadsheet/viewform?formkey=dEhCMDRwYS1JYkNZTFdmQ09kNV9mOFE6MQ','mywindow');

}
========================================================================

Any questions on this please contact me on twitter.

Thanks

Francis Pindar
@radnip