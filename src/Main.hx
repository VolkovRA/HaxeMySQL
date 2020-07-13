package;

import mysql.MySQL;

class Main 
{
	static function main() 
	{
		var con = MySQL.createConnection({ host:"localhost" });
		
		con.connect(function(err){
			con.query("SELECT * FROM Users;");
		});
	}
}