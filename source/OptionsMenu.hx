package;

import Controls.Control;
import openfl.Lib;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import Options.Option;
import Options.NumberOption;
import Options.BoolOption;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	var lastScreenSelected:Int = 0;

	var controlsStrings:Array<String> = [
		"Global Settings",
		"Gameplay Settings"
	];

	var daOptions:Array<Array<Option>> = [
		[
			new NumberOption("Frame Limiter", "Changes the frame rate that FNF is limited to",
			function() { return FlxG.save.data.frameLimiter; },
			function() {
				
			}),
			new BoolOption("Show FPS", "Shows or hides the framerate",
			function() { return FlxG.save.data.showFPS; },
			function() {
				FlxG.save.data.showFPS = !FlxG.save.data.showFPS;
				cast(Lib.current.getChildAt(0), Main).setFPSVisibility(FlxG.save.data.showFPS);
			})
		],
		[]
	];

	private var grpControls:FlxTypedGroup<Alphabet>;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var inSubMenu:Bool = false;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...controlsStrings.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;
			grpControls.add(controlLabel);
		}

		// Options alphabet asignments
		for (i in 0...daOptions.length)
		{
			for (i1 in 0...daOptions[i].length)
			{
				var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, daOptions[i][i1].optionsString(), true, false);
				controlLabel.isMenuItem = true;
				controlLabel.targetY = i;
				daOptions[i][i1].optionAlphabet = controlLabel;
				//grpOptions.add(controlLabel);
			}
		}

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			//changeBinding();

			if (!inSubMenu) {
				lastScreenSelected = curSelected;
				curSelected = 0;
				inSubMenu = true;

				for (item in grpControls.members)
				{
					item.visible = false;
				}

				for (i in 0...daOptions[lastScreenSelected].length)
				{
					grpOptions.add(daOptions[lastScreenSelected][i].optionAlphabet);
					//grpOptions.add(controlLabel);
				}

				changeSelection();
			}
			else
			{
				var option = daOptions[lastScreenSelected][curSelected];
				option.action();

				trace(option.optionsString() + " : " + option.getValue());

				option.optionAlphabet.changeDaText(option.optionsString());
			}
		}
		if (controls.BACK)
		{
			if (inSubMenu) {
				for (item in grpControls.members)
				{
					item.visible = true;
				}
				inSubMenu = false;
				grpOptions.clear();
				changeSelection();
			}
			else FlxG.switchState(new MainMenuState());
			FlxG.save.flush();
		}
		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);
	}

	function waitingInput():Void
	{
		if (FlxG.keys.getIsDown().length > 0)
		{
			PlayerSettings.player1.controls.replaceBinding(Control.LEFT, Keys, FlxG.keys.getIsDown()[0].ID, null);
		}
		// PlayerSettings.player1.controls.replaceBinding(Control)
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		var group:Array<Alphabet> = grpControls.members;
		if (inSubMenu) group = grpOptions.members;

		for (item in group)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}
