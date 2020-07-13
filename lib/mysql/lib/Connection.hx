package mysql.lib;

import haxe.Constraints.Function;
import haxe.extern.Rest;
import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import mysql.lib.ConnectionConfig.ConnectionOptions;
import mysql.lib.protocol.sequences.Query;

/**
 * Enumeration of events emitted by all `Pool` instances.
 */
@:enum abstract ConnectionEvent<T:Function>(Event<T>) to Event<T>
{
    /**
     * Callback: `function():Void;`
     */
    var DRAIN:ConnectionEvent<Void->Void> = "drain";

    /**
     * Callback: `function():Void;`
     */
    var CONNECT:ConnectionEvent<Void->Void> = "connect";

    /**
     * Set handler to be run when the connection is closed.
     * 
     * Callback: `function(?error:MysqlError):Void;`
     */
    var END:ConnectionEvent<MysqlError->Void> = "end";

    /**
     * Callback: `function(fields:Array<Dynamic>):Void;`
     */
    var FIELDS:ConnectionEvent<Array<Dynamic>->Void> = "fields";

    /**
     * Set handler to be run when a a fatal error occurs.
     * 
     * Callback: `function(error:MysqlError):Void;`
     */
    var ERROR:ConnectionEvent<MysqlError->Void> = "error";

    /**
     * Set handler to be run when a callback has been queued to wait for an
     * available connection.
     * 
     * Callback: `function(?error:MysqlError):Void;`
     */
    var ENQUEUE:ConnectionEvent<Null<MysqlError>->Void> = "enqueue";
}

/**
 * Source code: https://github.com/mysqljs/mysql/blob/master/lib/Connection.js
 */
extern class Connection extends EventEmitter<Connection>
{
    public var config:ConnectionConfig;

    public var state:ConnectionState;

    public var threadId:Null<Int>;

    public function createQuery(sql:EitherType<String, QueryOptions>, ?values:Dynamic, ?callback:QueryCallback):Query;

    public function query(sql:EitherType<String, QueryOptions>, ?values:Dynamic, ?callback:QueryCallback):Query;

    @:overload(function(options:Dynamic, ?callback:MysqlError->Rest<Dynamic>->Void):Void{})
    public function connect(?callback:MysqlError->Rest<Dynamic>->Void):Void;

    @:overload(function(options:ConnectionOptions, ?callback:MysqlError->Void):Void{})
    public function changeUser(callback:MysqlError->Void):Void;

    @:overload(function(?options:QueryOptions, ?callback:MysqlError->Void):Void{})
    public function beginTransaction(callback:MysqlError->Void):Void;

    @:overload(function(?options:QueryOptions, ?callback:MysqlError->Void):Void{})
    public function commit(callback:MysqlError->Void):Void;

    @:overload(function(?options:QueryOptions, ?callback:MysqlError->Void):Void{})
    public function rollback(callback:MysqlError->Void):Void;

    @:overload(function(?options:QueryOptions, ?callback:MysqlError->Void):Void{})
    public function ping(callback:MysqlError->Void):Void;

    @:overload(function(?options:QueryOptions, ?callback:MysqlError->Void):Void{})
    public function statistics(callback:MysqlError->Void):Void;

    @:overload(function(options:Dynamic, callback:Null<MysqlError>->Void):Void{})
    public function end(?callback:Null<MysqlError>->Void):Void;

    /**
     * Close the connection immediately, without waiting for any queued data (eg
     * queries) to be sent. No further events or callbacks will be triggered.
     */
    public function destroy():Void;

    /**
     * Pause the connection. No more 'result' events will fire until resume() is
     * called.
     */
    public function pause():Void;

    /**
     * Resume the connection.
     */
    public function resume():Void;

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

    /**
     * Format SQL and replacement values into a SQL string.
     * @param sql The SQL for the query.
     * @param values Any values to insert into placeholders in sql.
     * @param stringifyObjects Setting if objects should be stringified.
     * @param timeZone Setting for time zone to use for Date conversion.
     * @return Formatted SQL string.
     */
    public function format(sql:String, values:Array<Dynamic>, stringifyObjects:Bool = false, timeZone:String = "local"):String;
}

@:enum abstract ConnectionState(String) to String
{
    var CONNECTED = "connected";
    var AUTHENTICATED = "authenticated";
    var DISCONNECTED = "disconnected";
    var PROTOCOL_ERROR = "protocol_error";
}