// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetSelectOutfitMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage 
    {

        public static const SELECT_OUTFIT:String = "select_outfit";

        private var _SafeStr_6774:int;

        public function RoomWidgetSelectOutfitMessage(_arg_1:int)
        {
            super("select_outfit");
            _SafeStr_6774 = _arg_1;
        }

        public function get outfitId():int
        {
            return (_SafeStr_6774);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_6774 = "_-p1x" (String#22749, DoABC#4)


