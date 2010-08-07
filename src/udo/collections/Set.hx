/**
 * ...
 * @author Franco Ponticelli
 */

package udo.collections;

class Set<T>
{
	var _v : Array<T>;
	public function new()
	{
		_v = [];
	}
	
	public function add(v : T) : Void
	{
		_v.remove(v);
		_v.push(v);
	}
	
	public function remove(v : T) : Bool
	{
		return _v.remove(v);
	}
	
	public function exists(v : T) : Bool
	{
		for (t in _v)
			if (t == v)
				return true;
		return false;
	}
	
	public function iterator()
	{
		return _v.iterator();
	}
	
	public function array()
	{
		return _v.copy();
	}
	
	public function toString()
	{
		return "{" + _v.join(", ") + "}";
	}
}