// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPlayListEditorNowPlayingEvent extends RoomWidgetUpdateEvent 
    {

        public static const USER_PLAY_SONG:String = "RWPLENPE_USER_PLAY_SONG";
        public static const USER_STOP_SONG:String = "RWPLENPW_USER_STOP_SONG";
        public static const _SafeStr_8930:String = "RWPLENPE_SONG_CHANGED";

        private var _SafeStr_3820:int;
        private var _position:int;
        private var _priority:int;

        public function RoomWidgetPlayListEditorNowPlayingEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_3820 = _arg_2;
            _position = _arg_3;
            _priority = _arg_4;
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
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_8930 = "_-h1l" (String#30012, DoABC#4)


