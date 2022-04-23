// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent 
    {

        public static const USER_FIGURE:String = "RSUBE_FIGURE";

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_3819:String = "";
        private var _SafeStr_3834:String = "";
        private var _customInfo:String = "";
        private var _achievementScore:int;

        public function RoomSessionUserFigureUpdateEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super("RSUBE_FIGURE", _arg_1, _arg_7, _arg_8);
            _SafeStr_4128 = _arg_2;
            _SafeStr_3819 = _arg_3;
            _SafeStr_3834 = _arg_4;
            _customInfo = _arg_5;
            _achievementScore = _arg_6;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get customInfo():String
        {
            return (_customInfo);
        }

        public function get achievementScore():int
        {
            return (_achievementScore);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)


