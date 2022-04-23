// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound._SafeStr_3348

package com.sulake.habbo.sound
{
    import com.sulake.core.runtime._SafeStr_13;

    public /*dynamic*/ interface _SafeStr_3348 extends _SafeStr_13 
    {

        function get priority():int;
        function get length():int;
        function get playPosition():int;
        function get nowPlayingSongId():int;
        function get isPlaying():Boolean;
        function getEntry(_arg_1:int):ISongInfo;
        function requestPlayList():void;

    }
}//package com.sulake.habbo.sound

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)


