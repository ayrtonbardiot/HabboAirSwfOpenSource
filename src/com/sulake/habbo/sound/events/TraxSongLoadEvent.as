// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.events.TraxSongLoadEvent

package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class TraxSongLoadEvent extends Event 
    {

        public static const TRAX_LOAD_COMPLETE:String = "TSLE_TRAX_LOAD_COMPLETE";
        public static const TRAX_LOAD_FAILED:String = "TSLE_TRAX_LOAD_FAILED";

        private var _SafeStr_3820:int;

        public function TraxSongLoadEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_3820 = _arg_2;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }


    }
}//package com.sulake.habbo.sound.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)


