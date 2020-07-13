package mysql.lib;

import haxe.Constraints.Function;
import js.node.events.EventEmitter;

/**
 * Enumeration of events emitted by all `PoolCluster` instances.
 */
@:enum abstract PoolClusterEvent<T:Function>(Event<T>) to Event<T>
{
    /**
     * Set handler to be run when a node is removed.
     * 
     * Callback: `function(nodeId:String):Void;`
     */
    var REMOVE:PoolClusterEvent<String->Void> = "remove";

    /**
     * Set handler to be run when a node is goes offline.
     * 
     * Callback: `function(nodeId:String):Void;`
     */
    var OFFLINE:PoolClusterEvent<String->Void> = "offline";
}

extern class PoolCluster extends EventEmitter<PoolCluster>
{
    public var config:PoolClusterConfig;

    @:overload(function(id:String, config:PoolConfig):Void{})
    public function add(config:PoolConfig):Void;

    /**
     * Close the connection.
     * 
     * Any queued data (eg queries) will be sent first.
     * If there are any fatal errors, the connection will be immediately closed.
     * 
     * @param callback Handler for any fatal error.
     */
    public function end(callback:MysqlError->Void):Void;

    @:overload(function(pattern:String, ?selector:String):Pool{})
    public function of(?pattern:Null<Bool>, selector:String):Pool;

    /**
     * Remove all pools which match pattern.
     */
    public function remove(pattern:String):Void;

    @:overload(function(pattern:String, callback:MysqlError->PoolConnection->Void):Void{})
    @:overload(function(pattern:String, selector:String, callback:MysqlError->PoolConnection->Void):Void{})
    public function getConnection(callback:MysqlError->PoolConnection->Void):Void;
}