package mysql.lib;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import mysql.lib.PoolConfig.PoolActualConfig;
import mysql.lib.protocol.sequences.Query;

/**
 * Enumeration of events emitted by all `Pool` instances.
 */
@:enum abstract PoolEvent<T:Function>(Event<T>) to Event<T>
{
    /**
     * Set handler to be run when a new connection is made within the pool.
     * 
     * Callback: `function(connection:PoolConnection):Void;`
     */
    var CONNECTION:PoolEvent<PoolConnection->Void> = "connection";

    /**
     * Set handler to be run when a connection is acquired from the pool.
     * 
     * This is called after all acquiring activity has been performed on the
     * connection, right before the connection is handed to the callback of the
     * acquiring code.
     * 
     * Callback: `function(connection:PoolConnection):Void;`
     */
    var ACQUIRE:PoolEvent<PoolConnection->Void> = "acquire";

    /**
     * Set handler to be run when a connection is released back to the pool.
     * 
     * This is called after all release activity has been performed on the
     * connection, so the connection will be listed as free at the time of the
     * event.
     * 
     * Callback: `function(connection:PoolConnection):Void;`
     */
    var RELEASE:PoolEvent<PoolConnection->Void> = "release";

    /**
     * Set handler to be run when a a fatal error occurs.
     * 
     * Callback: `function(error:MysqlError):Void;`
     */
    var ERROR:PoolEvent<MysqlError->Void> = "error";

    /**
     * Set handler to be run when a callback has been queued to wait for an available connection.
     * 
     * Callback: `function(?error:MysqlError):Void;`
     */
    var ENQUEUE:PoolEvent<Null<MysqlError>->Void> = "enqueue";
}

/**
 * Source code: https://github.com/mysqljs/mysql/blob/master/lib/Pool.js
 */
extern class Pool extends EventEmitter<Pool>
{
    public var config:PoolActualConfig;

    public function getConnection(callback:MysqlError->PoolConnection->Void):Void;

    public function acquireConnection(connection:PoolConnection, callback:MysqlError->PoolConnection->Void):Void;

    public function releaseConnection(connection:PoolConnection):Void;

    /**
     * Close the connection.
     * 
     * Any queued data (eg queries) will be sent first.
     * If there are any fatal errors, the connection will be immediately closed.
     * 
     * @param callback Handler for any fatal error.
     */
    public function end(?callback:MysqlError->Void):Void;

    public function query(sql:EitherType<String, QueryOptions>, ?values:Dynamic, ?callback:QueryCallback):Query;

    /**
     * Escape a value for SQL.
     * @param value The value to escape.
     * @param stringifyObjects Setting if objects should be stringified.
     * @param timeZone Setting for time zone to use for Date conversion.
     * @return Escaped string value.
     */
    public function escape(value:Dynamic, stringifyObjects:Bool = false, timeZone:String = "local"):String;

    /**
     * Escape an identifier for SQL.
     * @param value The value to escape.
     * @param forbidQualified Setting to treat '.' as part of identifier.
     * @return Escaped string value.
     */
    public function escapeId(value:String, forbidQualified:Bool = false):String;
}