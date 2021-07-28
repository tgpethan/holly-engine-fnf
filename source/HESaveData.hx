package;

import openfl.Lib;
import flixel.FlxG;

class HESaveData
{
    public static function init()
    {
        // Frame limiter
        if (FlxG.save.data.frameLimiter == null)
            FlxG.save.data.frameLimiter = 120;
        else
        {
            // Make sure bricking isn't possible
            if (FlxG.save.data.frameLimiter < 30 || FlxG.save.data.frameLimiter > 500)
                FlxG.save.data.frameLimiter = 120;
        }

        // Show FPS
        if (FlxG.save.data.showFPS == null)
            FlxG.save.data.showFPS = false;

        // VOLUME SAVING! YEAH!!
        if (FlxG.save.data.volume == null)
            FlxG.save.data.volume = 1.0;

        // Finished, set game stuff.
        
        // Set sound & show tray
        FlxG.sound.volume = FlxG.save.data.volume;
        FlxG.sound.showSoundTray();

        // Set and save volume when it is changed
        FlxG.sound.volumeHandler = function(vol:Float)
        {
            FlxG.save.data.volume = vol;
            FlxG.save.flush();
        }

        var mainRef:Main = cast(Lib.current.getChildAt(0), Main);

        // Set fps show state
        mainRef.setFPSVisibility(FlxG.save.data.showFPS);

        // Set FPS Max
        mainRef.setMaxFPS(FlxG.save.data.frameLimiter);
    }

    public static function multiFromFrameLimiter(val:Float):Float
    {
        return val * (60 / FlxG.save.data.frameLimiter);
    }
}