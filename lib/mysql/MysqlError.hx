package mysql;

import js.lib.Error;

/**
 * MySQL Error.
 */
extern class MysqlError extends Error
{
    /**
     * Either a MySQL server error (e.g. 'ER_ACCESS_DENIED_ERROR'),
     * a node.js error (e.g. 'ECONNREFUSED') or an internal error
     * (e.g. 'PROTOCOL_CONNECTION_LOST').
     */
    public var code:String;

    /**
     * The error number for the error code
     */
    public var errno:Int;

    /**
     * The sql state marker.
     */
    @:optional var sqlStateMarker:String;

    /**
     * The sql state.
     */
    @:optional var sqlState:String;

    /**
     * The field count.
     */
    @:optional var fieldCount:Int;

    /**
     * Boolean, indicating if this error is terminal to the connection object.
     */
    var fatal:Bool;

    /**
     * SQL of failed query.
     */
    @:optional var sql:String;

    /**
     * Error message from MySQL.
     */
    @:optional var sqlMessage:String;
} 