// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.avatarinfo._SafeStr_3363

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;

    public class _SafeStr_3363 
    {

        private var _SafeStr_5868:Boolean = false;
        private var _SafeStr_5872:Boolean = false;
        private var _canTradeReason:int = 0;
        private var _SafeStr_5873:Boolean = false;
        private var _SafeStr_5874:Boolean = false;
        private var _SafeStr_5875:Boolean = false;
        private var _SafeStr_5867:Boolean = false;
        private var _SafeStr_5869:Boolean = false;
        private var _SafeStr_5871:Boolean = false;
        private var _SafeStr_3832:int = 0;
        private var _SafeStr_6273:Boolean = false;
        private var _SafeStr_5537:Boolean = false;
        private var _isGuildRoom:Boolean = false;
        private var _SafeStr_6092:int = 0;
        private var _SafeStr_5870:int = 0;
        private var _SafeStr_5876:int = 0;
        private var _SafeStr_5879:Boolean = false;
        private var _isAmbassador:Boolean = false;


        public function get isIgnored():Boolean
        {
            return (_SafeStr_5868);
        }

        public function get canTrade():Boolean
        {
            return (_SafeStr_5872);
        }

        public function get canTradeReason():int
        {
            return (_canTradeReason);
        }

        public function get canBeKicked():Boolean
        {
            return (_SafeStr_5873);
        }

        public function get canBeBanned():Boolean
        {
            return (_SafeStr_5874);
        }

        public function get canBeAskedAsFriend():Boolean
        {
            return (_SafeStr_5867);
        }

        public function get amIOwner():Boolean
        {
            return (_SafeStr_5869);
        }

        public function get amIAnyRoomController():Boolean
        {
            return (_SafeStr_5871);
        }

        public function get respectLeft():int
        {
            return (_SafeStr_3832);
        }

        public function get isOwnUser():Boolean
        {
            return (_SafeStr_6273);
        }

        public function get allowNameChange():Boolean
        {
            return (_SafeStr_5537);
        }

        public function get isGuildRoom():Boolean
        {
            return (_isGuildRoom);
        }

        public function get carryItemType():int
        {
            return (_SafeStr_6092);
        }

        public function get myRoomControllerLevel():int
        {
            return (_SafeStr_5870);
        }

        public function get targetRoomControllerLevel():int
        {
            return (_SafeStr_5876);
        }

        public function set isIgnored(_arg_1:Boolean):void
        {
            _SafeStr_5868 = _arg_1;
        }

        public function set canTrade(_arg_1:Boolean):void
        {
            _SafeStr_5872 = _arg_1;
        }

        public function set canTradeReason(_arg_1:int):void
        {
            _canTradeReason = _arg_1;
        }

        public function set canBeKicked(_arg_1:Boolean):void
        {
            _SafeStr_5873 = _arg_1;
        }

        public function set canBeBanned(_arg_1:Boolean):void
        {
            _SafeStr_5874 = _arg_1;
        }

        public function get canBeMuted():Boolean
        {
            return (_SafeStr_5875);
        }

        public function set canBeMuted(_arg_1:Boolean):void
        {
            _SafeStr_5875 = _arg_1;
        }

        public function set canBeAskedAsFriend(_arg_1:Boolean):void
        {
            _SafeStr_5867 = _arg_1;
        }

        public function set amIOwner(_arg_1:Boolean):void
        {
            _SafeStr_5869 = _arg_1;
        }

        public function set amIAnyRoomController(_arg_1:Boolean):void
        {
            _SafeStr_5871 = _arg_1;
        }

        public function set respectLeft(_arg_1:int):void
        {
            _SafeStr_3832 = _arg_1;
        }

        public function set isOwnUser(_arg_1:Boolean):void
        {
            _SafeStr_6273 = _arg_1;
        }

        public function set allowNameChange(_arg_1:Boolean):void
        {
            _SafeStr_5537 = _arg_1;
        }

        public function set isGuildRoom(_arg_1:Boolean):void
        {
            _isGuildRoom = _arg_1;
        }

        public function set carryItemType(_arg_1:int):void
        {
            _SafeStr_6092 = _arg_1;
        }

        public function set myRoomControllerLevel(_arg_1:int):void
        {
            _SafeStr_5870 = _arg_1;
        }

        public function set targetRoomControllerLevel(_arg_1:int):void
        {
            _SafeStr_5876 = _arg_1;
        }

        public function get isFriend():Boolean
        {
            return (_SafeStr_5879);
        }

        public function get isAmbassador():Boolean
        {
            return (_isAmbassador);
        }

        public function populate(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            _SafeStr_5871 = _arg_1.amIAnyRoomController;
            _SafeStr_5870 = _arg_1.myRoomControllerLevel;
            _SafeStr_5869 = _arg_1.amIOwner;
            _SafeStr_5867 = _arg_1.canBeAskedAsFriend;
            _SafeStr_5873 = _arg_1.canBeKicked;
            _SafeStr_5874 = _arg_1.canBeBanned;
            _SafeStr_5875 = _arg_1.canBeMuted;
            _SafeStr_5872 = _arg_1.canTrade;
            _canTradeReason = _arg_1.canTradeReason;
            _SafeStr_5868 = _arg_1.isIgnored;
            _SafeStr_3832 = _arg_1.respectLeft;
            _SafeStr_6273 = (_arg_1.type == "RWUIUE_OWN_USER");
            _SafeStr_5537 = _arg_1.allowNameChange;
            _isGuildRoom = _arg_1.isGuildRoom;
            _SafeStr_5876 = _arg_1.targetRoomControllerLevel;
            _SafeStr_6092 = _arg_1.carryItem;
            _SafeStr_5879 = _arg_1.isFriend;
            _isAmbassador = _arg_1.amIAnAmbassador;
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_3363 = "_-bv" (String#6134, DoABC#4)
// _SafeStr_3832 = "_-11B" (String#3672, DoABC#4)
// _SafeStr_5537 = "_-wn" (String#3638, DoABC#4)
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
// _SafeStr_5879 = "_-5m" (String#9220, DoABC#4)
// _SafeStr_6092 = "_-D7" (String#7144, DoABC#4)
// _SafeStr_6273 = "_-mu" (String#11614, DoABC#4)


