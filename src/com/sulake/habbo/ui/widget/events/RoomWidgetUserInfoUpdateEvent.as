// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const OWN_USER:String = "RWUIUE_OWN_USER";
        public static const BOT:String = "RWUIUE_BOT";
        public static const PEER:String = "RWUIUE_PEER";
        public static const TRADE_REASON_OK:int = 0;
        public static const TRADE_REASON_SHUTDOWN:int = 2;
        public static const TRADE_REASON_NO_TRADINGROOM:int = 3;
        public static const DEFAULT_BOT_BADGE_ID:String = "BOT";

        private var _name:String = "";
        private var _SafeStr_4880:String = "";
        private var _achievementScore:int;
        private var _SafeStr_5864:int = 0;
        private var _SafeStr_5865:int = 0;
        private var _SafeStr_5420:int;
        private var _SafeStr_3819:String = "";
        private var _SafeStr_4145:Array = [];
        private var _groupId:int = 0;
        private var _groupName:String = "";
        private var _SafeStr_5866:String = "";
        private var _SafeStr_5877:int = 0;
        private var _SafeStr_5878:int = 0;
        private var _SafeStr_5024:Boolean = false;
        private var _realName:String = "";
        private var _SafeStr_5537:Boolean = false;
        private var _SafeStr_5869:Boolean = false;
        private var _SafeStr_5871:Boolean = false;
        private var _SafeStr_5870:int = 0;
        private var _SafeStr_5867:Boolean = false;
        private var _SafeStr_5873:Boolean = false;
        private var _SafeStr_5874:Boolean = false;
        private var _SafeStr_5875:Boolean = false;
        private var _SafeStr_3832:int = 0;
        private var _SafeStr_5868:Boolean = false;
        private var _isGuildRoom:Boolean = false;
        private var _SafeStr_5872:Boolean = false;
        private var _canTradeReason:int = 0;
        private var _SafeStr_5876:int = 0;
        private var _SafeStr_5879:Boolean = false;
        private var _isAmbassador:Boolean = false;

        public function RoomWidgetUserInfoUpdateEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
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

        public function set achievementScore(_arg_1:int):void
        {
            _achievementScore = _arg_1;
        }

        public function get achievementScore():int
        {
            return (_achievementScore);
        }

        public function set webID(_arg_1:int):void
        {
            _SafeStr_5864 = _arg_1;
        }

        public function get webID():int
        {
            return (_SafeStr_5864);
        }

        public function set xp(_arg_1:int):void
        {
            _SafeStr_5865 = _arg_1;
        }

        public function get xp():int
        {
            return (_SafeStr_5865);
        }

        public function set userType(_arg_1:int):void
        {
            _SafeStr_5420 = _arg_1;
        }

        public function get userType():int
        {
            return (_SafeStr_5420);
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

        public function set groupId(_arg_1:int):void
        {
            _groupId = _arg_1;
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function set groupName(_arg_1:String):void
        {
            _groupName = _arg_1;
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function set groupBadgeId(_arg_1:String):void
        {
            _SafeStr_5866 = _arg_1;
        }

        public function get groupBadgeId():String
        {
            return (_SafeStr_5866);
        }

        public function set canBeAskedAsFriend(_arg_1:Boolean):void
        {
            _SafeStr_5867 = _arg_1;
        }

        public function get canBeAskedAsFriend():Boolean
        {
            return (_SafeStr_5867);
        }

        public function set respectLeft(_arg_1:int):void
        {
            _SafeStr_3832 = _arg_1;
        }

        public function get respectLeft():int
        {
            return (_SafeStr_3832);
        }

        public function set isIgnored(_arg_1:Boolean):void
        {
            _SafeStr_5868 = _arg_1;
        }

        public function get isIgnored():Boolean
        {
            return (_SafeStr_5868);
        }

        public function set amIOwner(_arg_1:Boolean):void
        {
            _SafeStr_5869 = _arg_1;
        }

        public function get amIOwner():Boolean
        {
            return (_SafeStr_5869);
        }

        public function set isGuildRoom(_arg_1:Boolean):void
        {
            _isGuildRoom = _arg_1;
        }

        public function get isGuildRoom():Boolean
        {
            return (_isGuildRoom);
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

        public function set canTrade(_arg_1:Boolean):void
        {
            _SafeStr_5872 = _arg_1;
        }

        public function get canTrade():Boolean
        {
            return (_SafeStr_5872);
        }

        public function set canTradeReason(_arg_1:int):void
        {
            _canTradeReason = _arg_1;
        }

        public function get canTradeReason():int
        {
            return (_canTradeReason);
        }

        public function set canBeKicked(_arg_1:Boolean):void
        {
            _SafeStr_5873 = _arg_1;
        }

        public function get canBeKicked():Boolean
        {
            return (_SafeStr_5873);
        }

        public function set canBeBanned(_arg_1:Boolean):void
        {
            _SafeStr_5874 = _arg_1;
        }

        public function get canBeBanned():Boolean
        {
            return (_SafeStr_5874);
        }

        public function get canBeMuted():Boolean
        {
            return (_SafeStr_5875);
        }

        public function set canBeMuted(_arg_1:Boolean):void
        {
            _SafeStr_5875 = _arg_1;
        }

        public function set targetRoomControllerLevel(_arg_1:int):void
        {
            _SafeStr_5876 = _arg_1;
        }

        public function get targetRoomControllerLevel():int
        {
            return (_SafeStr_5876);
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

        public function set isSpectatorMode(_arg_1:Boolean):void
        {
            _SafeStr_5024 = _arg_1;
        }

        public function get isSpectatorMode():Boolean
        {
            return (_SafeStr_5024);
        }

        public function set realName(_arg_1:String):void
        {
            _realName = _arg_1;
        }

        public function get realName():String
        {
            return (_realName);
        }

        public function set allowNameChange(_arg_1:Boolean):void
        {
            _SafeStr_5537 = _arg_1;
        }

        public function get allowNameChange():Boolean
        {
            return (_SafeStr_5537);
        }

        public function get isFriend():Boolean
        {
            return (_SafeStr_5879);
        }

        public function set isFriend(_arg_1:Boolean):void
        {
            _SafeStr_5879 = _arg_1;
        }

        public function get amIAnAmbassador():Boolean
        {
            return (_isAmbassador);
        }

        public function set amIAnAmbassador(_arg_1:Boolean):void
        {
            _isAmbassador = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3832 = "_-11B" (String#3672, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)
// _SafeStr_4880 = "_-v1" (String#3385, DoABC#4)
// _SafeStr_5024 = "_-jC" (String#7259, DoABC#4)
// _SafeStr_5420 = "_-S13" (String#2704, DoABC#4)
// _SafeStr_5537 = "_-wn" (String#3638, DoABC#4)
// _SafeStr_5864 = "_-123" (String#6265, DoABC#4)
// _SafeStr_5865 = "_-32C" (String#19622, DoABC#4)
// _SafeStr_5866 = "_-F9" (String#9297, DoABC#4)
// _SafeStr_5867 = "_-O1k" (String#7684, DoABC#4)
// _SafeStr_5868 = "_-v1J" (String#5256, DoABC#4)
// _SafeStr_5869 = "_-WY" (String#3551, DoABC#4)
// _SafeStr_5870 = "_-Q1M" (String#5250, DoABC#4)
// _SafeStr_5871 = "_-Yy" (String#3530, DoABC#4)
// _SafeStr_5872 = "_-81C" (String#7529, DoABC#4)
// _SafeStr_5873 = "_-KG" (String#7087, DoABC#4)
// _SafeStr_5874 = "_-F1m" (String#7117, DoABC#4)
// _SafeStr_5875 = "_-p1f" (String#7740, DoABC#4)
// _SafeStr_5876 = "_-21Z" (String#7728, DoABC#4)
// _SafeStr_5877 = "_-ir" (String#4622, DoABC#4)
// _SafeStr_5878 = "_-E1r" (String#4881, DoABC#4)
// _SafeStr_5879 = "_-5m" (String#9220, DoABC#4)


