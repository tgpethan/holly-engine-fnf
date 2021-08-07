package;

class HECharacterStore
{
	public static var nameToInternalID:Map<String, Int> = [];
	public static var characterNames:Array<String> = [];
	public static var characters:Array<Character> = [];

	public static function init()
	{
		var luaInstance:LuaFile = new LuaFile("characters");

		// Add functions in lua :)
		luaInstance.pushCallback("createCharacter", createCharacter);
		luaInstance.pushCallback("addByPrefix", addByPrefix);
		luaInstance.pushCallback("addByIndices", addByIndices);
		luaInstance.pushCallback("addOffset", addOffset);

		// Exec dat function
		luaInstance.executeLuaFunction("init", []);
	}

	public static function getCharacterByName(characterName:String):Character
	{
		return characters[nameToInternalID[characterName]];
	}

	public static function createCharacter(characterName:String)
	{
		var characterID:Int = characters.length;

		characterNames.push(characterName);
		nameToInternalID[characterName] = characterID;
		characters.push(new Character(0, 0, characterName));
		trace('created character "$characterName", id: $characterID');

		trace("returning");
		return characterID;
	}

	public static function addByPrefix(characterID:Int, name:String, prefix:String, frameRate:Int, looped:Bool = true, flipX:Bool = false, flipY:Bool = false)
	{
		characters[characterID].animation.addByPrefix(name, prefix, frameRate, looped, flipX, flipY);
	}

	public static function addByIndices(characterID:Int, name:String, prefix:String, indices:Array<Int>, postfix:String, frameRate:Int = 30, looped:Bool = true, flipX:Bool = false, flipY:Bool = false)
	{
		characters[characterID].animation.addByIndices(name, prefix, indices, postfix, frameRate, looped, flipX, flipY);
	}

	public static function addOffset(characterID:Int, name:String, x:Float = 0, y:Float = 0)
	{
		characters[characterID].addOffset(name, x, y);
	}
}