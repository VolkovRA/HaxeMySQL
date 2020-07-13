package mysql.lib;

extern class PoolConnection extends Connection
{
    public function release():Void;

    /**
     * Close the connection. Any queued data (eg queries) will be sent first. If
     * there are any fatal errors, the connection will be immediately closed.
     * @param callback Handler for any fatal error.
     */
    public function end(?callback:MysqlError->Void):Void;

    /**
     * Close the connection immediately, without waiting for any queued data (eg
     * queries) to be sent. No further events or callbacks will be triggered.
     */
    public function destroy():Void;
}