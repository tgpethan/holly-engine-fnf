package;

class HESongWeekStorage
{
	public static var weekMetadata:Array<WeekMetadata> = [];
	public static var songMetadata:Array<SongMetadata> = [];

	public static function init()
	{
		var luaInstance:LuaFile = new LuaFile("weeksAndSongs");

		// Add functions in lua :)
		luaInstance.pushCallback("addWeek", addWeek);
		luaInstance.pushCallback("addSong", addSong);

		// Exec dat function
		luaInstance.executeLuaFunction("init", []);
	}

	public static function addWeek(weekID:Int, weekText:String, weekCharacters:Array<String>)
	{
		// Add 0 - 2 since we want to just ignore the other stuff
		var weekChars:Array<String> = [];
		for (i in 0...3) weekChars.push(weekCharacters[i]);

		weekMetadata.push(new WeekMetadata(weekID, weekText, weekChars));
		trace('Added week $weekID');
	}

	public static function addSong(weekID:Int, song:String, songCharacter:String)
	{
		songMetadata.push(new SongMetadata(song, weekID, songCharacter));
		trace('Added song $song');
	}
}

class WeekMetadata
{
	public var weekID:Int = 0;
	public var weekText:String = "";
	public var weekCharacters:Array<String> = [];
	public var weekSongs:Array<SongMetadata> = [];

	public function new(weekID:Int, weekText:String, weekCharacters:Array<String>)
	{
		this.weekID = weekID;
		this.weekText = weekText;
		this.weekCharacters = weekCharacters;
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";

	public function new(song:String, week:Int, songCharacter:String)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
	}
}