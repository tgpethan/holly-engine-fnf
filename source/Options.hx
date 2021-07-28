package;

import flixel.FlxG;

class Option
{
	var optionName:String;
	var description:String;
	var getValue:Void -> Dynamic;
	public var action:Void -> Void;
	public var optionAlphabet:Alphabet;
	public function new(name:String = "", desc:String = "", getValue:Void -> Bool, action:Void -> Void)
	{
		optionName = name;
		description = desc;
		this.action = action;
		this.getValue = getValue;
	}

	public function optionsString():String
	{
		return optionName;
	}
}

class BoolOption extends Option
{
	public override function optionsString():String
	{
		return optionName + ": " + (getValue() ? "on" : "off");
	}
}

class NumberOption extends Option
{
	public override function optionsString():String
	{
		return optionName + ": " + getValue();
	}
}