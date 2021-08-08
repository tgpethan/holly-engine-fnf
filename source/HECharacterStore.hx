package;

class HECharacterStore
{
	public static var nameToInternalID:Map<String, Int> = [];
	public static var characterNames:Array<String> = [];
	public static var characters:Array<LuaCharacter> = [];

	public static function init()
	{
		var luaInstance:LuaFile = new LuaFile("characters");

		// Add functions in lua :)
		luaInstance.pushCallback("createCharacter", createCharacter);
		luaInstance.pushCallback("addByPrefix", addByPrefix);
		luaInstance.pushCallback("addByIndices", addByIndices);
		luaInstance.pushCallback("addOffset", addOffset);
		luaInstance.pushCallback("setDefaultAnimation", setDefaultAnimation);

		luaInstance.pushCallback("setFlipX", setFlipX);
		luaInstance.pushCallback("setFlipY", setFlipY);

		// Exec dat function
		luaInstance.executeLuaFunction("init", []);
	}

	public static function getLuaCharacterByName(characterName:String):LuaCharacter
	{
		return characters[nameToInternalID[characterName]];
	}

	public static function createCharacter(characterName:String)
	{
		var characterID:Int = characters.length;

		characterNames.push(characterName);
		nameToInternalID[characterName] = characterID;
		characters.push(new LuaCharacter(characterName));
		trace('created character "$characterName", id: $characterID');

		trace("returning");
		return characterID;
	}

	public static function addByPrefix(characterID:Int, name:String, prefix:String, frameRate:Int, looped:Bool = true, flipX:Bool = false, flipY:Bool = false)
	{
		characters[characterID].animations.push(["prefix", name, prefix, frameRate, looped, flipX, flipY]);
	}

	public static function addByIndices(characterID:Int, name:String, prefix:String, stringIndices:String, more:Array<Dynamic>)
	{
		// This is supremely stupid
		// I had to make an array to shove everything else in cause it couldn't handle all the params lmao
		var splitIndices:Array<String> = stringIndices.split(", ");
		var indices:Array<Int> = new Array<Int>();

		for (ind in splitIndices)
			indices.push(Std.parseInt(ind));

		// WHT TH FUC AM DOIG??!?
		characters[characterID].animations.push(["indices", name, prefix, indices, more[0] == null ? "" : more[0], more[1] == null ? 30 : more[1], more[2] == null ? true : more[2], more[3] == null ? false : more[3], more[4] == null ? false : more[4]]);
	}

	public static function addOffset(characterID:Int, name:String, x:Float = 0, y:Float = 0)
	{
		characters[characterID].animOffsets.push([name, x, y]);
	}

	public static function setDefaultAnimation(characterID:Int, animName:String)
	{
		characters[characterID].defaultAnimation = animName;
	}

	public static function setFlipX(characterID:Int, b:Bool)
	{
		characters[characterID].flipX = b;
	}

	public static function setFlipY(characterID:Int, b:Bool)
	{
		characters[characterID].flipY = b;
	}
}

class LuaCharacter
{
	public var animOffsets:Array<Dynamic> = new Array<Dynamic>();

	public var animations:Array<Dynamic> = new Array<Dynamic>();

	public var name:String;

	public var flipX:Bool = false;
	public var flipY:Bool = false;

	public var defaultAnimation:String = "idle";

	public function new(characterName:String)
	{
		name = characterName;
	}
}