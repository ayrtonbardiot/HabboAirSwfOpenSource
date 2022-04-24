// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPollUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const OFFER:String = "RWPUW_OFFER";
        public static const ERROR:String = "RWPUW_ERROR";
        public static const CONTENT:String = "RWPUW_CONTENT";

        private var _SafeStr_3820:int = -1;
        private var _SafeStr_4005:String;
        private var _headline:String;
        private var _SafeStr_4713:int = 0;
        private var _startMessage:String = "";
        private var _endMessage:String = "";
        private var _questionArray:Array = null;
        private var _SafeStr_6388:String = "";
        private var _SafeStr_4714:Boolean = false;

        public function RoomWidgetPollUpdateEvent(_arg_1:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            _SafeStr_3820 = _arg_1;
            super(_arg_2, _arg_3, _arg_4);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get summary():String
        {
            return (_SafeStr_4005);
        }

        public function set summary(_arg_1:String):void
        {
            _SafeStr_4005 = _arg_1;
        }

        public function get headline():String
        {
            return (_headline);
        }

        public function set headline(_arg_1:String):void
        {
            _headline = _arg_1;
        }

        public function get numQuestions():int
        {
            return (_SafeStr_4713);
        }

        public function set numQuestions(_arg_1:int):void
        {
            _SafeStr_4713 = _arg_1;
        }

        public function get startMessage():String
        {
            return (_startMessage);
        }

        public function set startMessage(_arg_1:String):void
        {
            _startMessage = _arg_1;
        }

        public function get endMessage():String
        {
            return (_endMessage);
        }

        public function set endMessage(_arg_1:String):void
        {
            _endMessage = _arg_1;
        }

        public function get questionArray():Array
        {
            return (_questionArray);
        }

        public function set questionArray(_arg_1:Array):void
        {
            _questionArray = _arg_1;
        }

        public function get pollType():String
        {
            return (_SafeStr_6388);
        }

        public function set pollType(_arg_1:String):void
        {
            _SafeStr_6388 = _arg_1;
        }

        public function get npsPoll():Boolean
        {
            return (_SafeStr_4714);
        }

        public function set npsPoll(_arg_1:Boolean):void
        {
            _SafeStr_4714 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4005 = "_-Rc" (String#5627, DoABC#4)
// _SafeStr_4713 = "_-jI" (String#9245, DoABC#4)
// _SafeStr_4714 = "_-l1g" (String#5508, DoABC#4)
// _SafeStr_6388 = "_-I9" (String#22557, DoABC#4)


