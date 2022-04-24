// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandUserData

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;

    public class InfoStandUserData 
    {

        private var _SafeStr_4128:int = 0;
        private var _userName:String = "";
        private var _SafeStr_4145:Array = [];
        private var _groupId:int = 0;
        private var _groupName:String = "";
        private var _SafeStr_5866:String = "";
        private var _SafeStr_3832:int = 0;
        private var _SafeStr_5877:int = 0;
        private var _SafeStr_5878:int = 0;
        private var _SafeStr_4028:String;
        private var _SafeStr_3824:int = 0;


        public function set userId(_arg_1:int):void
        {
            _SafeStr_4128 = _arg_1;
        }

        public function set userName(_arg_1:String):void
        {
            _userName = _arg_1;
        }

        public function set badges(_arg_1:Array):void
        {
            _SafeStr_4145 = _arg_1;
        }

        public function set groupId(_arg_1:int):void
        {
            _groupId = _arg_1;
        }

        public function set groupName(_arg_1:String):void
        {
            _groupName = _arg_1;
        }

        public function set groupBadgeId(_arg_1:String):void
        {
            _SafeStr_5866 = _arg_1;
        }

        public function set respectLeft(_arg_1:int):void
        {
            _SafeStr_3832 = _arg_1;
        }

        public function set carryItem(_arg_1:int):void
        {
            _SafeStr_5877 = _arg_1;
        }

        public function set userRoomId(_arg_1:int):void
        {
            _SafeStr_5878 = _arg_1;
        }

        public function set type(_arg_1:String):void
        {
            _SafeStr_4028 = _arg_1;
        }

        public function set petRespectLeft(_arg_1:int):void
        {
            _SafeStr_3824 = _arg_1;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get badges():Array
        {
            return (_SafeStr_4145.slice());
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function get groupBadgeId():String
        {
            return (_SafeStr_5866);
        }

        public function get respectLeft():int
        {
            return (_SafeStr_3832);
        }

        public function get carryItem():int
        {
            return (_SafeStr_5877);
        }

        public function get userRoomId():int
        {
            return (_SafeStr_5878);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get petRespectLeft():int
        {
            return (_SafeStr_3824);
        }

        public function isBot():Boolean
        {
            return (type == "RWUIUE_BOT");
        }

        public function setData(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            userId = _arg_1.webID;
            userName = _arg_1.name;
            badges = _arg_1.badges;
            groupId = _arg_1.groupId;
            groupName = _arg_1.groupName;
            groupBadgeId = _arg_1.groupBadgeId;
            respectLeft = _arg_1.respectLeft;
            carryItem = _arg_1.carryItem;
            userRoomId = _arg_1.userRoomId;
            type = _arg_1.type;
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_3824 = "_-p1O" (String#3982, DoABC#4)
// _SafeStr_3832 = "_-11B" (String#3672, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)
// _SafeStr_5866 = "_-F9" (String#9297, DoABC#4)
// _SafeStr_5877 = "_-ir" (String#4622, DoABC#4)
// _SafeStr_5878 = "_-E1r" (String#4881, DoABC#4)


