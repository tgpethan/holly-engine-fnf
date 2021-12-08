package;

import flixel.group.FlxGroup;
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
import flixel.util.FlxTimer;
import lime.app.Application;

using StringTools;

class LuaScreen extends MusicBeatState
{
	private var screenLuaFile:LuaFile;
	public static var currentScreenAdd:Dynamic;
	public static var currentScreenElementArray:Array<Dynamic>;
	public static var currentScreenIndex:Int;
	public static var currentScreenActiveElement:Int;
	public static var setCamFollowEnable:Bool = false;
	public static var camFollowLerpValue:Float = 0.06;
	public static var screenGroups:Map<String, FlxGroup>;

	static var camFollow:FlxObject;

	override function create()
	{
		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		screenLuaFile = new LuaFile("screens/introScreen");
		currentScreenAdd = add;
		currentScreenElementArray = new Array<Dynamic>();
		currentScreenIndex = 0;
		screenGroups = new Map<String, FlxGroup>();

		screenLuaFile.pushCallback("createGroup", CreateGroup);
		screenLuaFile.pushCallback("addToGroup", AddToGroup);
		screenLuaFile.pushCallback("clearGroup", ClearGroup);

		screenLuaFile.pushCallback("createImage", CreateImage);
		screenLuaFile.pushCallback("createText", CreateText);
		screenLuaFile.pushCallback("createAlphabet", CreateAlphabet);

		screenLuaFile.pushCallback("setGraphicSize", SetGraphicSize);

		screenLuaFile.pushCallback("getPosition", GetPosition);
		screenLuaFile.pushCallback("getCenterPosition", GetCenterPosition);
		screenLuaFile.pushCallback("getX", GetX);
		screenLuaFile.pushCallback("getY", GetY);
		screenLuaFile.pushCallback("getWidth", GetWidth);
		screenLuaFile.pushCallback("getHeight", GetHeight);

		//screenLuaFile.pushCallback

		screenLuaFile.pushCallback("setCamFollowPos", SetCamFollowPos);
		screenLuaFile.pushCallback("enableCamFollow", EnableCamFollow);
		screenLuaFile.pushCallback("setActive", SetActiveElement);
		screenLuaFile.pushCallback("playMusic", PlayMusic);
		screenLuaFile.pushCallback("fadeInMusic", FadeInMusic);
		screenLuaFile.pushCallback("add", LuaAdd);

		screenLuaFile.pushNumber("curStep", curStep);
		screenLuaFile.pushNumber("curBeat", curBeat);

		screenLuaFile.pushNumber("mouseX", FlxG.mouse.x);
		screenLuaFile.pushNumber("mouseY", FlxG.mouse.y);

		screenLuaFile.executeLuaFunction("create", []);

		if (setCamFollowEnable)
		{
			FlxG.camera.follow(camFollow, null, HESaveData.multiFromFrameLimiter(0.06));
		}

		super.create();
	}

	override function update(elapsed:Float)
	{
		// Update song pos
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		screenLuaFile.executeLuaFunction("update", [elapsed]);

		super.update(elapsed);
	}

	override function stepHit()
	{
		screenLuaFile.executeLuaFunction("stepHit", []);

		super.stepHit();
	}

	override function beatHit()
	{
		screenLuaFile.executeLuaFunction("beatHit", []);

		super.beatHit();
	}

	// EXTREME LUA MESS BEGIN!
	public static function CreateGroup(groupName:String)
	{
		var flxGroup:FlxGroup = new FlxGroup();
		screenGroups[groupName] = flxGroup;
	}

	public static function AddToGroup(groupName:String, eltId:Int)
	{
		screenGroups[groupName].add(currentScreenElementArray[eltId]);
	}

	public static function ClearGroup(groupName:String)
	{
		screenGroups[groupName].forEach(function(item)
		{
			item.kill();
		});
		screenGroups[groupName].clear();
	}

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

	public static function CreateAlphabet(x:Int, y:Int, text:String, bold:Bool = false, typed:Bool = false)
	{
		trace(x, y);
		var alphaIntance:Alphabet = new Alphabet(x, y, text, bold, typed);
		currentScreenElementArray.push(alphaIntance);
		currentScreenActiveElement = currentScreenIndex;
		currentScreenIndex++;

		return currentScreenActiveElement;
	}

	public static function SetGraphicSize(width:Int = 1, height:Int = 2147483647)
	{
		var elt = currentScreenElementArray[currentScreenActiveElement];
		if (height == 2147483647)
		{
			elt.setGraphicSize(width, elt.height);
		}
		else
		{
			elt.setGraphicSize(width, height);
		}
	}

	public static function GetX(eltId:Int = -1)
	{
		if (eltId == -1)
		{
			return currentScreenElementArray[currentScreenActiveElement].x;
		}
		else
		{
			return currentScreenElementArray[eltId].x;
		}
	}

	public static function GetY(eltId:Int = -1)
	{
		if (eltId == -1)
		{
			return currentScreenElementArray[currentScreenActiveElement].y;
		}
		else
		{
			return currentScreenElementArray[eltId].y;
		}
	}

	public static function GetWidth(eltId:Int = -1)
	{
		if (eltId == -1)
		{
			return currentScreenElementArray[currentScreenActiveElement].width;
		}
		else
		{
			return currentScreenElementArray[eltId].width;
		}
	}

	public static function GetHeight(eltId:Int = -1)
	{
		if (eltId == -1)
		{
			return currentScreenElementArray[currentScreenActiveElement].height;
		}
		else
		{
			return currentScreenElementArray[eltId].height;
		}
	}

	public static function GetPosition(eltId:Int = -1):Array<Int>
	{
		if (eltId == -1)
		{
			var elt = currentScreenElementArray[currentScreenActiveElement];
			return [elt.x, elt.y];
		}
		else
		{
			return [currentScreenElementArray[eltId].x, currentScreenElementArray[eltId].y];
		}
	}

	public static function GetCenterPosition(eltId:Int = -1):Array<Int>
	{
		if (eltId == -1)
		{
			var elt = currentScreenElementArray[currentScreenActiveElement].getGraphicMidpoint();
			return [elt.x, elt.y];
		}
		else
		{
			var elt = currentScreenElementArray[eltId].getGraphicMidpoint();
			return [elt.x, elt.y];
		}
	}

	// Many dumbs were had here, I'm gonna die.

	public static function SetPosition(eltId:Int, x:Int, y:Int = 2147483647)
	{
		// If y is null we don't have an eltId therefore eltId is x and x is y
		if (y == 2147483647)
		{
			currentScreenElementArray[currentScreenActiveElement].setPosition(eltId, x);
		}
		else
		{
			currentScreenElementArray[eltId].setPosition(x, y);
		}
	}

	public static function SetX(eltId:Int, x:Int = 2147483647)
	{
		// If x is null we don't have an eltId therefore eltId is the x value
		if (x == 2147483647)
		{
			currentScreenElementArray[currentScreenActiveElement].x = eltId;
		}
		else
		{
			currentScreenElementArray[eltId].x = x;
		}
	}

	public static function SetY(eltId:Int, y:Int = 2147483647)
	{
		// If y is null we don't have an eltId therefore eltId is the y value
		if (y == 2147483647)
		{
			currentScreenElementArray[currentScreenActiveElement].y = eltId;
		}
		else
		{
			currentScreenElementArray[eltId].y = y;
		}
	}

	public static function SetActiveElement(eltId:Int)
	{
		currentScreenActiveElement = eltId;
	}

	public static function SetCamFollowPos(x:Int, y:Int)
	{
		camFollow.setPosition(x, y);
	}

	public static function EnableCamFollow(lerp:Int = -1)
	{
		setCamFollowEnable = true;
		if (lerp != -1) {
			camFollowLerpValue = lerp;
		}
	}

	public static function PlayMusic(fileName:String, volume:Float = 1)
	{
		trace("playing track " + Paths.music(fileName));
		FlxG.sound.playMusic(Paths.music(fileName), volume);
	}

	public static function FadeInMusic(duration:Float = 1, from:Float = 0, to:Float = 1)
	{
		FlxG.sound.music.fadeIn(duration, from, to);
	}

	public static function SetBPM(bpm:Float)
	{
		Conductor.changeBPM(Std.int(bpm));
	}

	public static function LuaAdd(eltId:Int)
	{
		currentScreenAdd(currentScreenElementArray[eltId]);
	}
}
