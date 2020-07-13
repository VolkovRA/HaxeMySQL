package mysql.lib.protocol.constants;

/**
 * MySQL type constants.
 */
@:enum abstract Types(Int) to Int
{
    /**
     * Aka `DECIMAL` (http://dev.mysql.com/doc/refman/5.0/en/precision-math-decimal-changes.html)
     */
    var DECIMAL = 0x00;

    /**
     * Aka `TINYINT`, 1 byte.
     */
    var TINY = 0x01;

    /**
     * Aka `SMALLINT`, 2 bytes.
     */
    var SHORT = 0x02;

    /**
     * Aka `INT`, 4 bytes.
     */
    var LONG = 0x03;

    /**
     * Aka `FLOAT`, 4-8 bytes.
     */
    var FLOAT = 0x04;

    /**
     * Aka `DOUBLE`, 8 bytes.
     */
    var DOUBLE = 0x05;

    /**
     * `NULL` (used for prepared statements, I think)
     */
    var NULL = 0x06;

    /**
     * Aka `TIMESTAMP`.
     */
    var TIMESTAMP = 0x07;

    /**
     * Aka `BIGINT`, 8 bytes.
     */
    var LONGLONG = 0x08;

    /**
     * Aka `MEDIUMINT`, 3 bytes.
     */
    var INT24 = 0x09;

    /**
     * Aka `DATE`.
     */
    var DATE = 0x0a;

    /**
     * Aka `TIME`.
     */
    var TIME = 0x0b;

    /**
     * Aka `DATETIME`.
     */
    var DATETIME = 0x0c;

    /**
     * Aka `YEAR`, 1 byte (don't ask)
     */
    var YEAR = 0x0d;

    /**
     * Aka ?
     */
    var NEWDATE = 0x0e;

    /**
     * Aka `VARCHAR` (?)
     */
    var VARCHAR = 0x0f;

    /**
     * Aka `BIT`, 1-8 byte.
     */
    var BIT = 0x10;

    /**
     * Aka `TIMESTAMP` with fractional seconds.
     */
    var TIMESTAMP2 = 0x11;

    /**
     * Aka `DATETIME` with fractional seconds.
     */
    var DATETIME2 = 0x12;

    /**
     * Aka `TIME` with fractional seconds.
     */
    var TIME2 = 0x13;

    /**
     * Aka `JSON`.
     */
    var JSON = 0xf5;

    /**
     * Aka `DECIMAL`.
     */
    var NEWDECIMAL = 0xf6;

    /**
     * Aka `ENUM`.
     */
    var ENUM = 0xf7;

    /**
     * Aka `SET`.
     */
    var SET = 0xf8;

    /**
     * Aka `TINYBLOB`, `TINYTEXT`.
     */
    var TINY_BLOB = 0xf9;

    /**
     * Aka `MEDIUMBLOB`, `MEDIUMTEXT`.
     */
    var MEDIUM_BLOB = 0xfa;

    /**
     * Aka `LONGBLOG`, `LONGTEXT`.
     */
    var LONG_BLOB = 0xfb;

    /**
     * Aka `BLOB`, `TEXT`.
     */
    var BLOB = 0xfc;

    /**
     * Aka `VARCHAR`, `VARBINARY`.
     */
    var VAR_STRING = 0xfd;

    /**
     * Aka `CHAR`, `BINARY`.
     */
    var STRING = 0xfe;

    /**
     * Aka `GEOMETRY`.
     */
    var GEOMETRY = 0xff;
}