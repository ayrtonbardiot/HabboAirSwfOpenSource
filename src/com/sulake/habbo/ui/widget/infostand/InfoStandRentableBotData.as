// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotData

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;

    public class InfoStandRentableBotData 
    {

        private var _SafeStr_4128:int = 0;
        private var _name:String = "";
        private var _SafeStr_4145:Array = [];
        private var _SafeStr_5877:int = 0;
        private var _SafeStr_5878:int = 0;
        private var _SafeStr_5869:Boolean;
        private var _SafeStr_5871:Boolean;
        private var _botSkills:Array;


        public function set userId(_arg_1:int):void
        {
            _SafeStr_4128 = _arg_1;
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function set badges(_arg_1:Array):void
        {
            _SafeStr_4145 = _arg_1;
        }

        public function set carryItem(_arg_1:int):void
        {
            _SafeStr_5877 = _arg_1;
        }

        public function set userRoomId(_arg_1:int):void
        {
            _SafeStr_5878 = _arg_1;
        }

        public function set amIOwner(_arg_1:Boolean):void
        {
            _SafeStr_5869 = _arg_1;
        }

        public function set amIAnyRoomController(_arg_1:Boolean):void
        {
            _SafeStr_5871 = _arg_1;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get badges():Array
        {
            return (_SafeStr_4145.slice());
        }

        public function get carryItem():int
        {
            return (_SafeStr_5877);
        }

        public function get userRoomId():int
        {
            return (_SafeStr_5878);
        }

        public function get amIOwner():Boolean
        {
            return (_SafeStr_5869);
        }

        public function get amIAnyRoomController():Boolean
        {
            return (_SafeStr_5871);
        }

        public function get botSkills():Array
        {
            return (_botSkills);
        }

        public function set botSkills(_arg_1:Array):void
        {
            _botSkills = _arg_1;
        }

        public function setData(_arg_1:RoomWidgetRentableBotInfoUpdateEvent):void
        {
            userId = _arg_1.webID;
            name = _arg_1.name;
            badges = _arg_1.badges;
            carryItem = _arg_1.carryItem;
            userRoomId = _arg_1.userRoomId;
            amIOwner = _arg_1.amIOwner;
            amIAnyRoomController = _arg_1.amIAnyRoomController;
            botSkills = _arg_1.botSkills;
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)
// _SafeStr_5869 = "_-WY" (String#3551, DoABC#4)
// _SafeStr_5871 = "_-Yy" (String#3530, DoABC#4)
// _SafeStr_5877 = "_-ir" (String#4622, DoABC#4)
// _SafeStr_5878 = "_-E1r" (String#4881, DoABC#4)


