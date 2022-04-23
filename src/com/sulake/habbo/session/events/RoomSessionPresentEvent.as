// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPresentEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPresentEvent extends RoomSessionEvent 
    {

        public static const ROOM_SESSION_PRESENT_OPENED:String = "RSPE_PRESENT_OPENED";

        private var _SafeStr_4862:int = 0;
        private var _SafeStr_4110:String = "";
        private var _SafeStr_4838:String;
        private var _SafeStr_4951:int = 0;
        private var _SafeStr_4953:String = "";
        private var _placedInRoom:Boolean;
        private var _petFigureString:String;

        public function RoomSessionPresentEvent(_arg_1:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:String, _arg_8:Boolean, _arg_9:String, _arg_10:Boolean=false, _arg_11:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_10, _arg_11);
            _SafeStr_4862 = _arg_3;
            _SafeStr_4110 = _arg_4;
            _SafeStr_4838 = _arg_5;
            _SafeStr_4951 = _arg_6;
            _SafeStr_4953 = _arg_7;
            _placedInRoom = _arg_8;
            _petFigureString = _arg_9;
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }

        public function get itemType():String
        {
            return (_SafeStr_4110);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get placedItemId():int
        {
            return (_SafeStr_4951);
        }

        public function get placedInRoom():Boolean
        {
            return (_placedInRoom);
        }

        public function get placedItemType():String
        {
            return (_SafeStr_4953);
        }

        public function get petFigureString():String
        {
            return (_petFigureString);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)
// _SafeStr_4838 = "_-T1g" (String#4465, DoABC#4)
// _SafeStr_4862 = "_-Q1H" (String#2645, DoABC#4)
// _SafeStr_4951 = "_-A7" (String#2579, DoABC#4)
// _SafeStr_4953 = "_-s13" (String#3835, DoABC#4)


