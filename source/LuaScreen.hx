package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;

using StringTools;

class LuaScreen extends MusicBeatState
{
	private var screenLuaFile:LuaFile;
	public static var currentScreenAdd:Dynamic;
	public static var currentScreenElementArray:Array<Dynamic>;
	public static var currentScreenIndex:Int;
	public static var currentScreenActiveElement:Int;

	var camFollow:FlxObject;

	public static function CreateImage(text:String, x:Int, y:Int)
	{
		var bg:FlxSprite = new FlxSprite(x, y).loadGraphic(Paths.image(text));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		//bg.setGraphicSize(Std.int(bg.width));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		currentScreenElementArray.push(bg);
		currentScreenActiveElement = currentScreenIndex;
		currentScreenIndex++;

		return currentScreenActiveElement;
	}

	public static function CreateText(text:String, x:Int, y:Int, size:Int = 12)
	{
		var text:FlxText = new FlxText(x, y, 0, text, size);
		text.scrollFactor.set();
		text.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		currentScreenElementArray.push(text);
		currentScreenActiveElement = currentScreenIndex;
		currentScreenIndex++;

		return currentScreenActiveElement;
	}

	public static function SetGraphicSize(width:Int = 1, height:Int = 1)
	{
		var elt = currentScreenElementArray[currentScreenActiveElement];
		elt.setGraphicSize(width, height);
	}

	public static function GetWidth(eltId:Int)
	{
		return currentScreenElementArray[eltId].width;
	}

	public static function GetHeight(eltId:Int)
	{
		return currentScreenElementArray[eltId].height;
	}

	public static function SetActiveElement(eltId:Int)
	{
		currentScreenActiveElement = eltId;
	}

	public static function LuaAdd(eltId:Int)
	{
		currentScreenAdd(currentScreenElementArray[eltId]);
	}

	override function create()
	{
		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		screenLuaFile = new LuaFile("screens/introScreen");
		currentScreenAdd = add;
		currentScreenElementArray = new Array<Dynamic>();
		currentScreenIndex = 0;

		screenLuaFile.pushCallback("createImage", CreateImage);
		screenLuaFile.pushCallback("createText", CreateText);

		screenLuaFile.pushCallback("setGraphicSize", SetGraphicSize);

		screenLuaFile.pushCallback("getWidth", GetWidth);
		screenLuaFile.pushCallback("getHeight", GetHeight);

		screenLuaFile.pushCallback("setActive", SetActiveElement);
		screenLuaFile.pushCallback("add", LuaAdd);

		screenLuaFile.executeLuaFunction("create", []);

		super.create();
	}

	override function update(elapsed:Float)
	{
		screenLuaFile.executeLuaFunction("update", [elapsed]);

		camFollow.setPosition(camFollow.x, camFollow.y + 1);

		super.update(elapsed);
	}
}
