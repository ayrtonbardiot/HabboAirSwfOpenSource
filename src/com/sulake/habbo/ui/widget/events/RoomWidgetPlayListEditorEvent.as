// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPlayListEditorEvent extends RoomWidgetUpdateEvent 
    {

        public static const SHOW_PLAYLIST_EDITOR:String = "RWPLEE_SHOW_PLAYLIST_EDITOR";
        public static const _SafeStr_8999:String = "RWPLEE_HIDE_PLAYLIST_EDITOR";
        public static const INVENTORY_UPDATED:String = "RWPLEE_INVENTORY_UPDATED";
        public static const SONG_DISK_INVENTORY_UPDATED:String = "RWPLEE_SONG_DISK_INVENTORY_UPDATED";
        public static const PLAY_LIST_UPDATED:String = "RWPLEE_PLAY_LIST_UPDATED";
        public static const PLAY_LIST_FULL:String = "RWPLEE_PLAY_LIST_FULL";

        private var _SafeStr_4318:int;

        public function RoomWidgetPlayListEditorEvent(_arg_1:String, _arg_2:int=-1, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_4318 = _arg_2;
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)
// _SafeStr_8999 = "_-21X" (String#34263, DoABC#4)


