package mysql.lib.protocol.packets;

/**
 * Result from an insert, update, or delete statement.
 */
typedef OkPacket =
{
    var fieldCount:Int;

    /**
     * The number of affected rows from an insert, update, or delete statement.
     */
    var affectedRows:Int;

    /**
     * The insert id after inserting a row into a table with an auto increment
     * primary key.
     */
    var insertId:Int;

    @:optional var serverStatus:Int;

    @:optional var warningCount:Int;
    
    /**
     * The server result message from an insert, update, or delete statement.
     */
    var message:String;

    /**
     * The number of changed rows from an update statement.
     * 
     * "changedRows" differs from "affectedRows" in that it does not count
     * updated rows whose values were not changed.
     */
    var changedRows:Int;
    
    var protocol41:Bool;
}