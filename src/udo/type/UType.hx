package udo.type;

import Type;

class UType
{
	inline public static function className(o : Dynamic)
	{
		return fullName(o).split('.').pop();
	}
	
	inline public static function fullName(o : Dynamic)
	{
		return Type.getClassName(Type.getClass(o));
	}
	
	public static function typeName(o : Dynamic) : String
	{
		return switch(Type.typeof(o))
		{
			case TNull    : "null";
			case TInt     : "Int";
			case TFloat   : "Float";
			case TBool    : "Bool";
			case TFunction: "function";
			case TClass(c): Type.getClassName(c);
			case TEnum(e) : Type.getEnumName(e);
			case TObject  : "Object";
			case TUnknown : "Unknown";
		}
	}
	
	public static inline function isAnonymous(v : Dynamic) : Bool
	{
		return Reflect.isObject(v) && null == Type.getClass(v);
	}
	
	static public inline function as<T1, T2>(value : T1, type : Class<T2>) : T2
	{
		return (Std.is(value, type) ? cast value : null);
	}
	
	static public inline function of<T>(type : Class<T>, value : Dynamic) : Null<T>
	{
		return (Std.is(value, type) ? cast value : null);
	}
	
	public static function sameAs(a : Dynamic, b : Dynamic) : Bool
	{
		if (null == a && b == null) return true;
		if (null == a || b == null) return false;
		var tb = Type.typeof(b);
		switch(tb)
		{
			case TClass(c):
				return Std.is(a, c);
			case TEnum(e):
				return Std.is(a, e);
			default:
				return Type.typeof(a) == tb;
		}
	}
}