package mysql.lib;

typedef PoolConfig =
{
    >PoolSpecificConfig,
    >ConnectionConfig,
}

typedef PoolActualConfig = 
{
    >PoolSpecificConfig,

    var connectionConfig:ConnectionConfig;
}

typedef PoolSpecificConfig =
{
    /**
     * The milliseconds before a timeout occurs during the connection acquisition.
     * This is slightly different from connectTimeout, because acquiring a pool
     * connection does not always involve making a connection.
     * 
     * Default: 10 seconds.
     */
    @:optional var acquireTimeout:Int;

    /**
     * Determines the pool's action when no connections are available and the limit
     * has been reached.
     * - If `true`, the pool will queue the connection request and call it when one
     *   becomes available.
     * - If `false`, the pool will immediately call back with an error.
     * 
     * Default: `true`
     */
    @:optional var waitForConnections:Bool;

    /**
     * The maximum number of connections to create at once.
     * 
     * Default: `10`
     */
    @:optional var connectionLimit:Int;

    /**
     * The maximum number of connection requests the pool will queue before returning
     * an error from getConnection. If set to `0`, there is no limit to the number of
     * queued connection requests.
     * 
     * Default: `0`
     */
    @:optional var queueLimit:Int;
}