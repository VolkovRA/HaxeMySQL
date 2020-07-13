package mysql.lib.protocol.sequences;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import js.node.stream.Readable;
import mysql.lib.TypeCast;

/**
 * Enumeration of events emitted by all `Query` instances.
 */
@:enum abstract QueryEvent<T:Function>(Event<T>) to Event<T>
{
    /**
     * Callback: `function(row:Dynamic, index:Int):Void;`
     */
    var RESULT:QueryEvent<Dynamic->Int->Void> = "result";

    /**
     * Callback: `function(error:MysqlError):Void;`
     */
    var ERROR:QueryEvent<MysqlError->Void> = "error";

    /**
     * Callback: `function(fields:Array<FieldInfo>, index:Int):Void;`
     */
    var FIELDS:QueryEvent<Array<FieldInfo>->Int->Void> = "fields";

    /**
     * Callback: `function(packet:Dynamic):Void;`
     */
    var PACKET:QueryEvent<Dynamic->Void> = "packet";

    /**
     * Callback: `function():Void;`
     */
    var END:QueryEvent<Void->Void> = "end";
}

/**
 * Source code: https://github.com/mysqljs/mysql/blob/master/lib/protocol/sequences/Query.js
 */
extern class Query extends EventEmitter<Query>
{
    /**
     * Template query.
     */
    public var sql:String;

    /**
     * Values for template query.
     */
    public var values:Null<Array<String>>;

    /**
     * Default: `true`
     */
    public var typeCast:Null<TypeCast>;

    /**
     * Default: `false`
     */
    public var nestedTables:Bool;

    /**
     * Emits a query packet to start the query.
     */
    public function start():Void;

    /**
     * Determines the packet class to use given the first byte of the packet.
     * @param byte The first byte of the packet.
     * @param parser The packet parser.
     */
    public function determinePacket(byte:Int, parser:Dynamic):Dynamic;

    public var OkPacket:PacketCallback;
    public var ErrorPacket:PacketCallback;
    public var ResultSetHeaderPacket:PacketCallback;
    public var FieldPacket:PacketCallback;
    public var EofPacket:PacketCallback;

    public function RowDataPacket(packet:Dynamic, parser:Dynamic, connection:Connection):Void;

    /**
     * Creates a Readable stream with the given options.
     * @param options The options for the stream. (see readable-stream package)
     */
    public function stream(?options:ReadableNewOptions):Readable<Dynamic>;
}

/**
 * This function related to Query: `function(packet:Dynamic):Void;`.
 */
typedef PacketCallback = Dynamic->Void;

typedef QueryOptions =
{
    /**
     * The SQL for the query.
     */
    var sql:String;

    /**
     * Values for template query.
     */
    @:optional var values:Dynamic;

    /**
     * Every operation takes an optional inactivity timeout option.
     * 
     * This allows you to specify appropriate timeouts for operations. It is
     * important to note that these timeouts are not part of the MySQL protocol,
     * and rather timeout operations through the client. This means that when a
     * timeout is reached, the connection it occurred on will be destroyed and
     * no further operations can be performed.
     */
    @:optional var timeout:Int;

    /**
     * Either a boolean or string. If true, tables will be nested objects. If string (e.g. '_'), tables will be
     * nested as tableName_fieldName
     */
    @:optional var nestTables:EitherType<Bool, String>;

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
}

/**
 * This is a function: `function(?err:MysqlError, ?results:Dynamic, ?fields:Array<FieldInfo>):Void;`
 */
typedef QueryCallback = Null<MysqlError>->Null<Dynamic>->Null<Array<FieldInfo>>->Void;