// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetSongUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const SONG_PLAYING_CHANGED:String = "RWSUE_PLAYING_CHANGED";
        public static const SONG_DATA_RECEIVED:String = "RWSUE_DATA_RECEIVED";

        private var _SafeStr_4222:int;
        private var _songName:String;
        private var _SafeStr_5488:String;

        public function RoomWidgetSongUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_4222 = _arg_2;
            _songName = _arg_3;
            _SafeStr_5488 = _arg_4;
        }

        public function get songId():int
        {
            return (_SafeStr_4222);
        }

        public function get songName():String
        {
            return (_songName);
        }

        public function get songAuthor():String
        {
            return (_SafeStr_5488);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_5488 = "_-T1" (String#10165, DoABC#4)


