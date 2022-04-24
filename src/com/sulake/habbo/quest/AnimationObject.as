// by nota

//com.sulake.habbo.quest.AnimationObject

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import flash.display.BitmapData;

    public /*dynamic*/ interface AnimationObject extends _SafeStr_13 
    {

        function getPosition(_arg_1:int):Point;
        function getBitmap(_arg_1:int):BitmapData;
        function isFinished(_arg_1:int):Boolean;
        function onAnimationStart():void;

    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)


