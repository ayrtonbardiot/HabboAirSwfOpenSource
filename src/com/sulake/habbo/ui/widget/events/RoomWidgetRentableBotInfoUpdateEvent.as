// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRentableBotInfoUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const RENTABLE_BOT:String = "RWRBIUE_RENTABLE_BOT";
        public static const DEFAULT_BOT_BADGE_ID:String = "RENTABLE_BOT";

        private var _name:String = "";
        private var _SafeStr_4880:String = "";
        private var _SafeStr_5864:int = 0;
        private var _SafeStr_3819:String = "";
        private var _SafeStr_4145:Array = [];
        private var _SafeStr_5877:int = 0;
        private var _SafeStr_5878:int = 0;
        private var _SafeStr_5226:int;
        private var _ownerName:String;
        private var _SafeStr_5869:Boolean = false;
        private var _SafeStr_5871:Boolean = false;
        private var _SafeStr_5870:int = 0;
        private var _botSkills:Array;

        public function RoomWidgetRentableBotInfoUpdateEvent(_arg_1:Boolean=false, _arg_2:Boolean=false)
        {
            super("RWRBIUE_RENTABLE_BOT", _arg_1, _arg_2);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function set motto(_arg_1:String):void
        {
            _SafeStr_4880 = _arg_1;
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function set webID(_arg_1:int):void
        {
            _SafeStr_5864 = _arg_1;
        }

        public function get webID():int
        {
            return (_SafeStr_5864);
        }

        public function set figure(_arg_1:String):void
        {
            _SafeStr_3819 = _arg_1;
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function set badges(_arg_1:Array):void
        {
            _SafeStr_4145 = _arg_1;
        }

        public function get badges():Array
        {
            return (_SafeStr_4145);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function set ownerId(_arg_1:int):void
        {
            _SafeStr_5226 = _arg_1;
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function set ownerName(_arg_1:String):void
        {
            _ownerName = _arg_1;
        }

        public function set amIOwner(_arg_1:Boolean):void
        {
            _SafeStr_5869 = _arg_1;
        }

        public function get amIOwner():Boolean
        {
            return (_SafeStr_5869);
        }

        public function set myRoomControllerLevel(_arg_1:int):void
        {
            _SafeStr_5870 = _arg_1;
        }

        public function get myRoomControllerLevel():int
        {
            return (_SafeStr_5870);
        }

        public function set amIAnyRoomController(_arg_1:Boolean):void
        {
            _SafeStr_5871 = _arg_1;
        }

        public function get amIAnyRoomController():Boolean
        {
            return (_SafeStr_5871);
        }

        public function set carryItem(_arg_1:int):void
        {
            _SafeStr_5877 = _arg_1;
        }

        public function get carryItem():int
        {
            return (_SafeStr_5877);
        }

        public function set userRoomId(_arg_1:int):void
        {
            _SafeStr_5878 = _arg_1;
        }

        public function get userRoomId():int
        {
            return (_SafeStr_5878);
        }

        public function get botSkills():Array
        {
            return (_botSkills);
        }

        public function set botSkills(_arg_1:Array):void
        {
            _botSkills = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)
// _SafeStr_4880 = "_-v1" (String#3385, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5864 = "_-123" (String#6265, DoABC#4)
// _SafeStr_5869 = "_-WY" (String#3551, DoABC#4)
// _SafeStr_5870 = "_-Q1M" (String#5250, DoABC#4)
// _SafeStr_5871 = "_-Yy" (String#3530, DoABC#4)
// _SafeStr_5877 = "_-ir" (String#4622, DoABC#4)
// _SafeStr_5878 = "_-E1r" (String#4881, DoABC#4)


