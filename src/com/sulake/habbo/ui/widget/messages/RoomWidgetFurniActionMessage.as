// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetFurniActionMessage extends RoomWidgetMessage 
    {

        public static const ROTATE:String = "RWFUAM_ROTATE";
        public static const MOVE:String = "RWFAM_MOVE";
        public static const _SafeStr_9052:String = "RWFAM_PICKUP";
        public static const _SafeStr_9053:String = "RWFAM_EJECT";
        public static const USE:String = "RWFAM_USE";
        public static const SAVE_STUFF_DATA:String = "RWFAM_SAVE_STUFF_DATA";

        private var _SafeStr_4318:int = 0;
        private var _SafeStr_6778:int = 0;
        private var _offerId:int;
        private var _SafeStr_6779:String;

        public function RoomWidgetFurniActionMessage(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int=-1, _arg_5:String=null)
        {
            super(_arg_1);
            _SafeStr_4318 = _arg_2;
            _SafeStr_6778 = _arg_3;
            _offerId = _arg_4;
            _SafeStr_6779 = _arg_5;
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }

        public function get furniCategory():int
        {
            return (_SafeStr_6778);
        }

        public function get objectData():String
        {
            return (_SafeStr_6779);
        }

        public function get offerId():int
        {
            return (_offerId);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)
// _SafeStr_6778 = "_-DT" (String#22663, DoABC#4)
// _SafeStr_6779 = "_-bZ" (String#19015, DoABC#4)
// _SafeStr_9052 = "_-S4" (String#39285, DoABC#4)
// _SafeStr_9053 = "_-814" (String#33402, DoABC#4)


