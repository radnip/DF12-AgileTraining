global with sharing class PermissionSetHelper {

	/*
	 * HAS PERMISSION
	 *
	 * Checks to see if the curent running user has permission to a particular permission set
	 * based on the permission set API Name.
	 * @returns Boolean True = Has permission, False = Does not have permission
	 */
	webservice static Boolean hasPermission(String permissionName){

		List<PermissionSetAssignment> perms = new List<PermissionSetAssignment>([SELECT 
				Id, 
				PermissionSet.Name 
			FROM 
				PermissionSetAssignment 
			WHERE 
				PermissionSet.Name = :permissionName AND
				AssigneeId = :Userinfo.getUserId()]);
		
		return (perms.size() > 0);
	}
	
	@isTest
	static void testHasPermission() {
		
/*
		*** TESTS TO BE DONE ***
*/
	}
	
}