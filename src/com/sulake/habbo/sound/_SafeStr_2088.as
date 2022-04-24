// by nota

//com.sulake.habbo.sound._SafeStr_2088

package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface _SafeStr_2088 extends IUnknown 
    {

        function set genericVolume(_arg_1:Number):void;
        function set traxVolume(_arg_1:Number):void;
        function set furniVolume(_arg_1:Number):void;
        function get genericVolume():Number;
        function get traxVolume():Number;
        function get furniVolume():Number;
        function get musicController():_SafeStr_3169;
        function playSound(_arg_1:String, _arg_2:int=0):void;
        function stopSound(_arg_1:String):void;
        function playSoundAtPitch(_arg_1:String, _arg_2:Number):_SafeStr_3135;
        function loadTraxSong(_arg_1:int, _arg_2:String):_SafeStr_3135;
        function mute(_arg_1:Boolean):void;
        function previewVolume(_arg_1:Number, _arg_2:Number, _arg_3:Number):void;
        function get events():IEventDispatcher;

    }
}//package com.sulake.habbo.sound

// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_3135 = "_-Je" (String#3060, DoABC#4)
// _SafeStr_3169 = "_-KZ" (String#5121, DoABC#4)


