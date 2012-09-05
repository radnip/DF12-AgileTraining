global with sharing class PermissionSetHelper {

	/*
	 * HAS PERMISSION
	 *
	 * Checks to see if the curent running user has permission to a particular permission set
	 * based on the permission set API Name.
	 * @returns Boolean True = Has permission, False = Does not have permission
	 */
	webservice static Boolean hasPermission(String permissionName){
		
		Boolean foundPermission = False;
		
		List<PermissionSetAssignment> perms = new List<PermissionSetAssignment>([SELECT 
				Id, 
				PermissionSet.Name 
			FROM 
				PermissionSetAssignment 
			WHERE 
				PermissionSet.Name = :permissionName AND
				AssigneeId = :Userinfo.getUserId()]);
		
		if (perms.size() > 0){
			foundPermission = true;
		}
		
		return foundPermission;
	}
	
	@isTest
	static void testHasPermission() {
		
/*
		*** TESTS TO BE DONE ***
*/
	}
	
}