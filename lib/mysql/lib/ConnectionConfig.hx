package mysql.lib;

import haxe.extern.EitherType;
import mysql.lib.protocol.constants.Types;

typedef ConnectionConfig =
{
    >ConnectionOptions,

    /**
     * The hostname of the database you are connecting to.
     * 
     * Default: `localhost`
     */
    @:optional var host:String;

    /**
     * The port number to connect to.
     * 
     * Default: `3306`
     */
    @:optional var port:Int;

    /**
     * The source IP address to use for TCP connection.
     */
    @:optional var localAddress:String;

    /**
     * The path to a unix domain socket to connect to.
     * 
     * When used host and port are ignored.
     */
    @:optional var socketPath:String;

    /**
     * The timezone used to store local dates.
     * 
     * Default: `local`
     */
    @:optional var timezone:String;

    /**
     * The milliseconds before a timeout occurs during the initial connection to the MySQL server.
     * 
     * Default: 10 seconds.
     */
    @:optional var connectTimeout:Int;

    /**
     * Stringify objects instead of converting to values.
     * 
     * Default: `false`
     */
    @:optional var stringifyObjects:Bool;

    /**
     * Allow connecting to MySQL instances that ask for the old (insecure) authentication method.
     * 
     * Default: `false`
     */
    @:optional var insecureAuth:Bool;

    /**
     * Determines if column values should be converted to native JavaScript types.
     * 
     * It is not recommended (and may go away / change in the future) to disable type
     * casting, but you can currently do so on either the connection or query level.
     *
     * You can also specify a `function (field:Dynamic, next:Void->Void):Dynamic` to
     * do the type casting yourself.
     * 
     * **WARNING:** YOU MUST INVOKE the parser using one of these three field functions
     * in your custom typeCast callback. They can only be called once.
     *
     * ```
     * field.string()
     * field.buffer()
     * field.geometry()
     * ```
     * are aliases for
     * ```
     * parser.parseLengthCodedString()
     * parser.parseLengthCodedBuffer()
     * parser.parseGeometryValue()
     * ```
     * 
     * You can find which field function you need to use by looking at: `RowDataPacket.prototype._typeCast`
     * 
     * Default: `true`
     */
    @:optional var typeCast:TypeCast;

    /**
     * A custom query format function.
     */
    @:optional var queryFormat:String->Dynamic->String;

    /**
     * When dealing with big numbers (BIGINT and DECIMAL columns) in the database,
     * you should enable this option.
     * 
     * Default: `false`
     */
    @:optional var supportBigNumbers:Bool;

    /**
     * Enabling both supportBigNumbers and bigNumberStrings forces big numbers
     * (BIGINT and DECIMAL columns) to be always returned as JavaScript String objects.
     * Enabling supportBigNumbers but leaving bigNumberStrings disabled will return big
     * numbers as String objects only when they cannot be accurately represented with
     * [JavaScript Number objects] (http://ecma262-5.com/ELS5_HTML.htm#Section_8.5)
     * (which happens when they exceed the [-2^53, +2^53] range), otherwise they will be
     * returned as Number objects.
     * 
     * This option is ignored if supportBigNumbers is disabled.
     * 
     * Default: `false`
     */
    @:optional var bigNumberStrings:Bool;

    /**
     * Force date types (TIMESTAMP, DATETIME, DATE) to be returned as strings rather then
     * inflated into JavaScript Date objects. Can be true/false or an array of type names
     * to keep as strings.
     * 
     * Default: `false`
     */
    @:optional var dateStrings:EitherType<Bool, Array<DateType>>;

    /**
     * This will print all incoming and outgoing packets on stdout.
     * 
     * You can also restrict debugging to packet types by passing an array of types
     * (strings) to debug.
     *
     * Default: `false`
     */
    @:optional var debug:EitherType<Bool, EitherType<Array<String>, Array<Types>>>;

    /**
     * Generates stack traces on errors to include call site of library entrance ("long
     * stack traces").
     * 
     * Slight performance penalty for most calls.
     * 
     * Default: `true`
     */
    @:optional var trace:Bool;

    /**
     * Allow multiple mysql statements per query.
     * 
     * Be careful with this, it exposes you to SQL injection attacks.
     * 
     * Default: `false`
     */
    @:optional var multipleStatements:Bool;
 
    /**
     * List of connection flags to use other than the default ones.
     * It is also possible to blacklist default ones.
     */
    @:optional var flags:EitherType<String, Array<String>>;
    
    /**
     * Object with ssl parameters or a string containing name of ssl profile.
     */
    @:optional var ssl:EitherType<String, SSLParams>;
}

typedef ConnectionOptions =
{
    /**
     * The MySQL user to authenticate as.
     */
    @:optional var user:String;

    /**
     * The password of that MySQL user.
     */
    @:optional var password:String;

    /**
     * Name of the database to use for this connection.
     */
    @:optional var database:String;

    /**
     * The charset for the connection.
     * 
     * This is called "collation" in the SQL-level of MySQL (like `utf8_general_ci`).
     * If a SQL-level charset is specified (like `utf8mb4`) then the default collation
     * for that charset is used.
     * 
     * Default: `UTF8_GENERAL_CI`
     */
    @:optional var charset:String;

    /**
     * Number of milliseconds.
     */
    @:optional var timeout:Int;
}

/**
 * Object with ssl parameters.
 */
typedef SSLParams =
{
    >js.node.tls.SecureContext.SecureContextOptions,

    /**
     * Default `true`
     */
    @:optional var rejectUnauthorized:Bool;
}

/**
 * Date types.
 */
@:enum abstract DateType(String) to String
{
    var TIMESTAMP = "TIMESTAMP";
    var DATETIME = "DATETIME";
    var DATE = "DATE";
}