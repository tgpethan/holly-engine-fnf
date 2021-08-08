package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.system.FlxSound;

using StringTools;

class FreeplayState extends MusicBeatState
{
	var curSelected:Int = 0;
	var curDifficulty:Int = 1;

	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	var usualMusicVolume:Bool = true;

	private var grpSongs:FlxTypedGroup<Alphabet>;

	private var iconArray:Array<HealthIcon> = [];

	var blackOverlay:FlxSprite;
	var bg:FlxSprite;

	var rightItems:FlxTypedGroup<FlxSprite>;

	var stopSpamming:Bool = false;

	override function create()
	{
		// LOAD MUSIC

		// LOAD CHARACTERS

		FlxG.camera.zoom = 14;

		bg = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		add(bg);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...HESongWeekStorage.songMetadata.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, HESongWeekStorage.songMetadata[i].songName, true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			var icon:HealthIcon = new HealthIcon(HESongWeekStorage.songMetadata[i].songCharacter);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);
		}

		rightItems = new FlxTypedGroup<FlxSprite>();
		add(rightItems);

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);

		var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 6, 0).makeGraphic(Std.int(FlxG.width * 0.35) + 50, 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		rightItems.add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		rightItems.add(diffText);

		rightItems.add(scoreText);

		blackOverlay = new FlxSprite(-50, -50).makeGraphic(FlxG.width + 50, FlxG.height + 50, FlxColor.BLACK);
		blackOverlay.alpha = 1;
		add(blackOverlay);

		FlxTween.tween(FlxG.camera, { zoom: 1 }, 2, { ease: FlxEase.backIn });
		FlxTween.tween(blackOverlay, { alpha: 0 }, 2, { ease: FlxEase.quadInOut });

		changeSelection();
		changeDiff();

		grpSongs.forEach(function(spr:FlxSprite)
		{
			spr.alpha = 0;
		});
		for (spr in iconArray)
		{
			spr.alpha = 0;
		}

		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			for (i in 0...iconArray.length)
			{
				FlxTween.tween(iconArray[i], { alpha: (curSelected == i ? 1 : 0.6) }, 0.6 + (0.10 * (i + 1)), {
					ease: FlxEase.quadInOut
				});
			}
	
			var bullShit:Int = 0;
			for (item in grpSongs.members)
			{
				item.targetY = bullShit - curSelected;
				bullShit++;
	
				item.alpha = 0.6;
				// item.setGraphicSize(Std.int(item.width * 0.8));

				FlxTween.tween(item, { alpha: (item.targetY == 0 ? 1 : 0.6) }, 0.6 + (0.10 * bullShit), {
					ease: FlxEase.quadInOut
				});
			}
		});

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7 && usualMusicVolume)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, HESaveData.multiFromFrameLimiter(0.4)));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;

		scoreText.text = "PERSONAL BEST:" + lerpScore;

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;

		if (!stopSpamming)
		{
			if (upP)
			{
				changeSelection(-1);
			}
			if (downP)
			{
				changeSelection(1);
			}
	
			if (controls.LEFT_P)
				changeDiff(-1);
			if (controls.RIGHT_P)
				changeDiff(1);
	
			if (controls.BACK)
			{
				FlxG.sound.music.fadeOut(0, 1.9);
				
				exitTransitions(function() {
					FlxG.sound.music.stop();
					FlxG.switchState(new MainMenuState());
				});
			}
	
			if (accepted)
			{
				var poop:String = Highscore.formatSong(HESongWeekStorage.songMetadata[curSelected].songName.toLowerCase(), curDifficulty);
	
				trace(poop);
	
				usualMusicVolume = false;
				stopSpamming = true;
				FlxG.sound.music.volume = 0;
				FlxG.sound.music.stop();

				var shootSound:FlxSound = FlxG.sound.play(Paths.sound('titleShoot'));
	
				PlayState.SONG = Song.loadFromJson(poop, HESongWeekStorage.songMetadata[curSelected].songName.toLowerCase());
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = curDifficulty;
	
				PlayState.storyWeek = HESongWeekStorage.songMetadata[curSelected].week;
				trace('CUR WEEK' + PlayState.storyWeek);
	
				exitTransitions(function() {});
				new FlxTimer().start(5, function(tmr:FlxTimer)
				{
					shootSound.fadeOut(1, 0);
					new FlxTimer().start(2, function(tmr:FlxTimer)
					{
						LoadingState.loadAndSwitchState(new PlayState());
					});
				});
			}
		}
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 2;
		if (curDifficulty > 2)
			curDifficulty = 0;

		#if !switch
		intendedScore = Highscore.getScore(HESongWeekStorage.songMetadata[curSelected].songName, curDifficulty);
		#end

		switch (curDifficulty)
		{
			case 0:
				diffText.text = "EASY";
			case 1:
				diffText.text = 'NORMAL';
			case 2:
				diffText.text = "HARD";
		}
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = HESongWeekStorage.songMetadata.length - 1;
		if (curSelected >= HESongWeekStorage.songMetadata.length)
			curSelected = 0;

		#if !switch
		intendedScore = Highscore.getScore(HESongWeekStorage.songMetadata[curSelected].songName, curDifficulty);
		#end

		#if PRELOAD_ALL
		FlxG.sound.playMusic(Paths.inst(HESongWeekStorage.songMetadata[curSelected].songName), 0);
		#end

		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;
			
			if (item.targetY == 0) item.alpha = 1;
			else item.alpha = 0.6;
		}
	}

	function exitTransitions(callback:Void -> Void)
	{
		// Delay until the tweens have finished
		new FlxTimer().start(0.6, function(tmr:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, { zoom: 14 }, 2, { ease: FlxEase.expoIn });
			FlxTween.tween(bg, { angle: 180 }, 2, { ease: FlxEase.expoIn });
			FlxTween.tween(blackOverlay, { alpha: 1 }, 2, {
				ease: FlxEase.quadInOut,
				onComplete: function(twn:FlxTween)
				{
					callback();
				}
			});
		});

		// Slide off right
		rightItems.forEach(function(spr:FlxSprite)
		{
			FlxTween.tween(spr, { x: FlxG.width + 600 }, 0.6, {
				ease: FlxEase.backIn,
				onComplete: function(twn:FlxTween)
				{
					spr.kill();
				}
			});
		});
		rightItems.forEach(function(spr:FlxSprite)
		{
			FlxTween.tween(spr, { alpha: 0 }, 0.6, {
				ease: FlxEase.quadInOut,
				onComplete: function(twn:FlxTween)
				{
					spr.kill();
				}
			});
		});
		
		// Slide off left
		grpSongs.forEach(function(spr:FlxSprite)
		{
			FlxTween.tween(spr, { x: -600 }, 0.6, {
				ease: FlxEase.backIn,
				onComplete: function(twn:FlxTween)
				{
					spr.kill();
				}
			});
		});
		grpSongs.forEach(function(spr:FlxSprite)
		{
			FlxTween.tween(spr, { alpha: 0 }, 0.6, {
				ease: FlxEase.quadInOut,
				onComplete: function(twn:FlxTween)
				{
					spr.kill();
				}
			});
		});

		for (spr in iconArray)
		{
			FlxTween.tween(spr, { alpha: 0 }, 0.6, {
				ease: FlxEase.quadInOut,
				onComplete: function (twn:FlxTween)
				{
					spr.kill();
				}
			});
		}
	}
}