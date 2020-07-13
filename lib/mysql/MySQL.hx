package mysql;

import haxe.extern.EitherType;
import mysql.lib.Connection;
import mysql.lib.ConnectionConfig;
import mysql.lib.PoolCluster;
import mysql.lib.PoolClusterConfig;
import mysql.lib.PoolConfig;
import mysql.lib.Pool;
import mysql.lib.protocol.sequences.Query;

/**
 * MySQL Database client for NodeJS. (Haxe extern definitions)
 * 
 * These extern definitions take from TypeScript definitions and translated to Haxe.
 * 
 * @see MySQL GitHub: https://github.com/mysqljs/mysql
 * @see MySQL npm: https://www.npmjs.com/package/mysql
 * @see TypeScript definitions: https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/mysql
 */
@:jsRequire("mysql")
extern class MySQL
{	
    /**
     * Create a new `Connection` instance.
     * @param config Configuration or connection string for new MySQL connection.
     * @return A new MySQL connection.
     */
    static public function createConnection(config:EitherType<String, ConnectionConfig>):Connection;

    /**
     * Create a new `Pool` instance.
     * @param config Configuration or connection string for new MySQL connections.
     * @return A new MySQL pool.
     */
    static public function createPool(config:EitherType<String, PoolConfig>):Pool;

    /**
     * Create a new `PoolCluster` instance.
     * @param config Configuration for pool cluster.
     * @return New MySQL pool cluster.
     */
    static public function createPoolCluster(?config:PoolClusterConfig):PoolCluster;

    /**
     * Create a new `Query` instance.
     * @param sql The SQL for the query.
     * @param values Any values to insert into placeholders in sql.
     * @param callback The callback to use when query is complete.
     * @return New query object.
     */
    static public function createQuery(sql:String, values:Array<Dynamic>, callback:Dynamic):Query;

    /**
     * Escape a value for SQL.
     * @param value The value to escape.
     * @param stringifyObjects Setting if objects should be stringified.
     * @param timeZone Setting for time zone to use for Date conversion.
     * @return Escaped string value.
     */
    static public function escape(value:Dynamic, stringifyObjects:Bool = false, timeZone:String = "local"):String;

    /**
     * Escape an identifier for SQL.
     * @param value The value to escape.
     * @param forbidQualified Setting to treat '.' as part of identifier.
     * @return Escaped string value.
     */
    static public function escapeId(value:String, forbidQualified:Bool = false):String;

    /**
     * Format SQL and replacement values into a SQL string.
     * @param sql The SQL for the query.
     * @param values Any values to insert into placeholders in sql.
     * @param stringifyObjects Setting if objects should be stringified.
     * @param timeZone Setting for time zone to use for Date conversion.
     * @return Formatted SQL string.
     */
    static public function format(sql:String, values:Array<Dynamic>, stringifyObjects:Bool = false, timeZone:String = "local"):String;

    /**
     * Wrap raw SQL strings from escape overriding.
     * @param sql The raw SQL.
     * @return Wrapped object.
     */
    static public function raw(sql:String):{ toSqlString:Void->String };
}