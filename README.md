# Haxe externs for MySQL client on NodeJS.

Description
------------------------------

The Haxe high quality definitions to MySQL NodeJS client.

See more of MySQL connector:
1. [GitHub repository](https://github.com/mysqljs/mysql "MySQL Connector repository")
2. [NPM Package](https://www.npmjs.com/package/mysql "NPM MySQL package")
3. [TypeScript definitions](https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/mysql "TypeScript definitions")

How to use
------------------------------
```
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
```

Adding library
------------------------------

1. Install haxelib so that you can use the Haxe libraries.
2. Run the command in the terminal to install the MySQL externs library globally on your local machine:
```
haxelib git mysql https://github.com/VolkovRA/HaxeMySQL master
```
Command syntax:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Add the mysql library to your project to use it in the code. If you are using HaxeDevelop, then simply add the entry to the .hxproj file:
```
<haxelib>
	<library name="mysql" />
</haxelib>
```

See more information:
 * [Documentation Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Documentation HaxeDevelop](https://haxedevelop.org/configure-haxe.html "Configure Haxe")