// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPollMessage extends RoomWidgetMessage 
    {

        public static const START:String = "RWPM_START";
        public static const REJECT:String = "RWPM_REJECT";
        public static const ANSWER:String = "RWPM_ANSWER";

        private var _SafeStr_3820:int = -1;
        private var _SafeStr_4613:int = 0;
        private var _answers:Array = null;

        public function RoomWidgetPollMessage(_arg_1:String, _arg_2:int)
        {
            _SafeStr_3820 = _arg_2;
            super(_arg_1);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get questionId():int
        {
            return (_SafeStr_4613);
        }

        public function set questionId(_arg_1:int):void
        {
            _SafeStr_4613 = _arg_1;
        }

        public function get answers():Array
        {
            return (_answers);
        }

        public function set answers(_arg_1:Array):void
        {
            _answers = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4613 = "_-SG" (String#5952, DoABC#4)


