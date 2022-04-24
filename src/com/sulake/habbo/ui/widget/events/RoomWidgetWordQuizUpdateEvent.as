// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetWordQuizUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils._SafeStr_24;

    public class RoomWidgetWordQuizUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8915:String = "RWPUW_NEW_QUESTION";
        public static const FINISHED:String = "RWPUW_QUESION_FINSIHED";
        public static const _SafeStr_8916:String = "RWPUW_QUESTION_ANSWERED";

        private var _SafeStr_3820:int = -1;
        private var _SafeStr_4612:String = null;
        private var _SafeStr_4400:int = -1;
        private var _SafeStr_4613:int = -1;
        private var _duration:int = -1;
        private var _question:Dictionary = null;
        private var _SafeStr_4128:int = -1;
        private var _SafeStr_4525:String;
        private var _SafeStr_4614:_SafeStr_24;

        public function RoomWidgetWordQuizUpdateEvent(_arg_1:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            _SafeStr_3820 = _arg_1;
            super(_arg_2, _arg_3, _arg_4);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get pollType():String
        {
            return (_SafeStr_4612);
        }

        public function set pollType(_arg_1:String):void
        {
            _SafeStr_4612 = _arg_1;
        }

        public function get pollId():int
        {
            return (_SafeStr_4400);
        }

        public function set pollId(_arg_1:int):void
        {
            _SafeStr_4400 = _arg_1;
        }

        public function get questionId():int
        {
            return (_SafeStr_4613);
        }

        public function set questionId(_arg_1:int):void
        {
            _SafeStr_4613 = _arg_1;
        }

        public function get duration():int
        {
            return (_duration);
        }

        public function set duration(_arg_1:int):void
        {
            _duration = _arg_1;
        }

        public function get question():Dictionary
        {
            return (_question);
        }

        public function set question(_arg_1:Dictionary):void
        {
            _question = _arg_1;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function set userId(_arg_1:int):void
        {
            _SafeStr_4128 = _arg_1;
        }

        public function get value():String
        {
            return (_SafeStr_4525);
        }

        public function set value(_arg_1:String):void
        {
            _SafeStr_4525 = _arg_1;
        }

        public function get answerCounts():_SafeStr_24
        {
            return (_SafeStr_4614);
        }

        public function set answerCounts(_arg_1:_SafeStr_24):void
        {
            _SafeStr_4614 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4400 = "_-w7" (String#5765, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_4612 = "_-HU" (String#9076, DoABC#4)
// _SafeStr_4613 = "_-SG" (String#5952, DoABC#4)
// _SafeStr_4614 = "_-J10" (String#9170, DoABC#4)
// _SafeStr_8915 = "_-2K" (String#29650, DoABC#4)
// _SafeStr_8916 = "_-t1L" (String#31519, DoABC#4)


