package;

class HECharacterStore
{
	public static var nameToInternalID:Map<String, Int> = [];
	public static var characterNames:Array<String> = [];
	public static var characters:Array<LuaCharacter> = [];
	static var activeCharacterID:Int = -1;

	public static function init()
	{
		var luaInstance:LuaFile = new LuaFile("characters");

		// Add functions in lua :)
		luaInstance.pushCallback("setActiveCharacter", setActiveCharacter);
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
		trace('created character "$characterName"');
		
		return characterID;
	}

	public static function setActiveCharacter(characterID:Int)
	{
		activeCharacterID = characterID;
	}

	public static function addByPrefix(name:String, prefix:String, frameRate:Int, looped:Bool = true, flipX:Bool = false, flipY:Bool = false)
	{
		characters[activeCharacterID].animations.push(["prefix", name, prefix, frameRate, looped, flipX, flipY]);
	}

	// God I hate this function
	public static function addByIndices(name:String, prefix:String, stringIndices:String, more:Array<Dynamic>)
	{
		// This is supremely stupid
		// I had to make an array to shove everything else in cause it couldn't handle all the params lmao
		var splitIndices:Array<String> = stringIndices.split(", ");
		var indices:Array<Int> = new Array<Int>();

		for (ind in splitIndices)
			indices.push(Std.parseInt(ind));

		// WHT TH FUC AM DOInG??!?
		characters[activeCharacterID].animations.push(["indices", name, prefix, indices, more[0] == null ? "" : more[0], more[1] == null ? 30 : more[1], more[2] == null ? true : more[2], more[3] == null ? false : more[3], more[4] == null ? false : more[4]]);
	}

	public static function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		characters[activeCharacterID].animOffsets.push([name, x, y]);
	}

	public static function setDefaultAnimation(animName:String)
	{
		characters[activeCharacterID].defaultAnimation = animName;
	}

	public static function setFlipX(b:Bool)
	{
		characters[activeCharacterID].flipX = b;
	}

	public static function setFlipY(b:Bool)
	{
		characters[activeCharacterID].flipY = b;
	}
}

class LuaCharacter
{
	public var animOffsets:Array<Dynamic> = new Array<Dynamic>();
	public var animations:Array<Dynamic> = new Array<Dynamic>();
	public var defaultAnimation:String = "idle";

	public var name:String;

	public var flipX:Bool = false;
	public var flipY:Bool = false;

	public function new(characterName:String)
	{
		name = characterName;
	}
}