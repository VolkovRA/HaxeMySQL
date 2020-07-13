package mysql.lib;

import haxe.extern.EitherType;
import js.node.buffer.Buffer;
import mysql.lib.protocol.constants.Types;

/**
 * Type cast method.
 */
typedef TypeCast = EitherType<Bool, TypeCastFunc>;

/**
 * Some type cast function.
 */
typedef TypeCastFunc = TypeCastFuncParams->TypeCastFuncNext->Dynamic;

/**
 * Options to type cast function.
 */
typedef TypeCastFuncParams = {
    >UntypedFieldInfo,

    var type:String;
    var length:Int;
    var string:Void->String;
    var buffer:Void->Buffer;
    var geometry:Void->Null<GeometryType>;
}

/**
 * Next callback.
 */
typedef TypeCastFuncNext = Void->Void;

typedef FieldInfo =
{
    >UntypedFieldInfo,
    var type:Types;
}

typedef UntypedFieldInfo =
{
    var catalog:String;
    var db:String;
    var table:String;
    var orgTable:String;
    var name:String;
    var orgName:String;
    var charsetNr:Int;
    var length:Int;
    var flags:Int;
    var decimals:Float;
    var zeroFill:Bool;
    var protocol41:Bool;
    //@:optional var default:String; // <-- Haxe conflict with this name
}

typedef GeometryType = Array<Dynamic>;