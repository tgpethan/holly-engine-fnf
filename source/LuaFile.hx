package;

// YESSS I GOT LUAJIT WORKING ON LINUX
// I'm working on something for html5 exports
#if cpp
import llua.Convert;
import llua.Lua;
import llua.LuaL;
import llua.State;
#end

class LuaFile
{
	private var luaState:State;

	public function new(luaFile:String)
	{
		// Open new lua state
		trace("Creating new lua state!");
		luaState = LuaL.newstate();
		LuaL.openlibs(luaState);

		// Yo we made the lua state print that version(s)
		trace("Lua version: " + Lua.version());
        trace("LuaJIT version: " + Lua.versionJIT());
		Lua.init_callbacks(luaState);

		// do the file
		var resultCode:Int = LuaL.dofile(luaState, Paths.lua(luaFile));
		var resultError:String = Lua.tostring(luaState, resultCode);

		// non-zero code = we fucking died
		// TODO: Add error messages lol
	}

	public function pushNumber(varName:String, number:Float)
	{
		Lua.pushnumber(luaState, number);
		Lua.setglobal(luaState, varName);
	}

	public function pushCallback(luaFunctionName:String, callback:Dynamic)
	{
		Lua_helper.add_callback(luaState, luaFunctionName, callback);
	}

	public function executeLuaFunction(luaFunctionName:String, args:Array<Dynamic>, ?type:String):Dynamic
	{
		Lua.getglobal(luaState, luaFunctionName);

		for (value in args)
		{
			Convert.toLua(luaState, value);
		}

		var execResult:Int = Lua.pcall(luaState, args.length, 1, 0);
		var errorString:String = Lua.tostring(luaState, execResult);

		// TODO: Add error messages lol

		return convert(execResult, type);
	}

	// taken from kade engine i'm sorry kadedev please don't kill me ;-;
	private function convert(v:Any, type:String):Dynamic {
		if (Std.is(v, String) && type != null)
		{
			var v:String = v;
			if (type.substr(0, 4) == 'array')
			{
				if (type.substr(4) == 'float')
				{
					var array:Array<String> = v.split(',');
					var array2:Array<Float> = new Array();

					for (vars in array)
					{
						array2.push(Std.parseFloat(vars));
					}

					return array2;
				}
				else if (type.substr(4) == 'int')
				{
					var array:Array<String> = v.split(',');
					var array2:Array<Int> = new Array();

					for (vars in array)
					{
						array2.push(Std.parseInt(vars));
					}

					return array2;
				}
				else
				{
					var array:Array<String> = v.split(',');
					return array;
				}
			}
			else if (type == 'float')
			{
				return Std.parseFloat(v);
			}
			else if (type == 'int')
			{
				return Std.parseInt(v);
			}
			else if (type == 'bool')
			{
				if (v == 'true')
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return v;
			}
		}
		else
		{
			return v;
		}
	}
}