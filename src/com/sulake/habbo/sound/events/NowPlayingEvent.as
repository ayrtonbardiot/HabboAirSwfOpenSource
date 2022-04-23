// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.events.NowPlayingEvent

package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class NowPlayingEvent extends Event 
    {

        public static const USER_PLAY_SONG:String = "NPE_USER_PLAY_SONG";
        public static const USER_STOP_SONG:String = "NPW_USER_STOP_SONG";
        public static const _SafeStr_8930:String = "NPE_SONG_CHANGED";

        private var _SafeStr_3820:int;
        private var _position:int;
        private var _priority:int;

        public function NowPlayingEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_3820 = _arg_3;
            _position = _arg_4;
            _priority = _arg_2;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get position():int
        {
            return (_position);
        }

        public function get priority():int
        {
            return (_priority);
        }


    }
}//package com.sulake.habbo.sound.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_8930 = "_-h1l" (String#30012, DoABC#4)


