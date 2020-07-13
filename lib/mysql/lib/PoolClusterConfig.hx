package mysql.lib;

typedef PoolClusterConfig =
{
    /**
     * If true, PoolCluster will attempt to reconnect when connection fails.
     * 
     * Default: `true`
     */
    @:optional var canRetry:Bool;

    /**
     * If connection fails, node's errorCount increases. When errorCount is greater than removeNodeErrorCount,
     * remove a node in the PoolCluster.
     * 
     * Default: `5`
     */
    @:optional var removeNodeErrorCount:Int;

    /**
     * If connection fails, specifies the number of milliseconds before another connection attempt will be made.
     * If set to `0`, then node will be removed instead and never re-used.
     * 
     * Default: `0`
     */
    @:optional var restoreNodeTimeout:Int;

    /**
     * The default selector. 
     * - `RR` - Select one alternately. (Round-Robin)
     * - `RANDOM` - Select the node by random function.
     * - `ORDER` - Select the first node available unconditionally.
     * 
     * Default: `RR`
     */
    @:optional var defaultSelector:String;
}