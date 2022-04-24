// by nota

//com.sulake.habbo.navigator.domain.NavigatorData

package com.sulake.habbo.navigator.domain
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import _-Ja._SafeStr_1556;
    import _-Ja._SafeStr_1574;
    import _-Ja._SafeStr_1569;
    import flash.utils.Dictionary;
    import _-Ja._SafeStr_1549;
    import _-Ja._SafeStr_1583;
    import com.sulake.habbo.navigator.roomsettings._SafeStr_3369;
    import _-Ja._SafeStr_1559;
    import _-61T._SafeStr_1254;
    import _-Ja._SafeStr_1621;
    import _-Ja._SafeStr_1634;
    import _-Ja._SafeStr_1557;
    import _-Ja._SafeStr_1642;
    import _-Ja._SafeStr_1629;
    import _-Ja._SafeStr_1551;
    import _-31H._SafeStr_1486;
    import com.sulake.habbo.navigator.*;
    import _-Ja.*;
    import _-31H.*;

    public class NavigatorData 
    {

        private static const MAX_HISTORY_LENGTH:int = 10;

        private var _navigator:HabboNavigator;
        private var _lastMsg:_SafeStr_1556;
        private var _SafeStr_4728:_SafeStr_1574;
        private var _SafeStr_4730:Boolean;
        private var _SafeStr_4731:Boolean;
        private var _SafeStr_4727:Boolean;
        private var _SafeStr_3894:int;
        private var _SafeStr_3911:int;
        private var _enteredGuestRoom:_SafeStr_1569;
        private var _SafeStr_4732:Boolean;
        private var _SafeStr_4733:int;
        private var _hotRoomPopupOpen:Boolean;
        private var _SafeStr_4734:int;
        private var _SafeStr_4737:Boolean;
        private var _SafeStr_4740:Array = [];
        private var _SafeStr_4741:Array = [];
        private var _SafeStr_4742:Array = [];
        private var _SafeStr_4743:Array = [];
        private var _SafeStr_4746:int;
        private var _SafeStr_4745:int;
        private var _SafeStr_4744:Dictionary = new Dictionary();
        private var _SafeStr_8656:Boolean;
        private var _SafeStr_4735:int;
        private var _SafeStr_4736:Boolean;
        private var _SafeStr_4739:Boolean;
        private var _SafeStr_4738:int = 0;
        private var _SafeStr_4729:_SafeStr_1549;
        private var _promotedRooms:_SafeStr_1583;
        private var _friendList:_SafeStr_3369 = new _SafeStr_3369();
        private var _SafeStr_4747:RoomSessionTags;
        private var _SafeStr_4748:_SafeStr_1559;

        public function NavigatorData(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
        }

        public function get canAddFavourite():Boolean
        {
            return ((!(_enteredGuestRoom == null)) && (!(_SafeStr_4727)));
        }

        public function get canEditRoomSettings():Boolean
        {
            return ((!(_enteredGuestRoom == null)) && ((_SafeStr_4727) || (_navigator.sessionData.hasSecurity(5))));
        }

        public function onRoomEnter(_arg_1:_SafeStr_1254):void
        {
            _enteredGuestRoom = null;
            _SafeStr_4727 = false;
            _SafeStr_4727 = _arg_1.owner;
            _SafeStr_3894 = _arg_1.guestRoomId;
        }

        public function onRoomExit():void
        {
            if (_SafeStr_4728 != null)
            {
                _SafeStr_4728.dispose();
                _SafeStr_4728 = null;
            };
            if (_enteredGuestRoom != null)
            {
                _enteredGuestRoom.dispose();
                _enteredGuestRoom = null;
            };
            _SafeStr_4727 = false;
        }

        public function set enteredRoom(_arg_1:_SafeStr_1569):void
        {
            if (_enteredGuestRoom != null)
            {
                _enteredGuestRoom.dispose();
            };
            _enteredGuestRoom = _arg_1;
        }

        public function set roomEventData(_arg_1:_SafeStr_1574):void
        {
            if (_SafeStr_4728 != null)
            {
                _SafeStr_4728.dispose();
            };
            _SafeStr_4728 = _arg_1;
        }

        public function get popularTagsArrived():Boolean
        {
            return ((!(_lastMsg == null)) && (!((_lastMsg as _SafeStr_1621) == null)));
        }

        public function get guestRoomSearchArrived():Boolean
        {
            return ((!(_lastMsg == null)) && (!((_lastMsg as _SafeStr_1634) == null)));
        }

        public function get officialRoomsArrived():Boolean
        {
            return ((!(_lastMsg == null)) && (!((_lastMsg as _SafeStr_1557) == null)));
        }

        public function get categoriesWithUserCountArrived():Boolean
        {
            return ((!(_lastMsg == null)) && (!((_lastMsg as _SafeStr_1642) == null)));
        }

        public function set guestRoomSearchResults(_arg_1:_SafeStr_1634):void
        {
            disposeCurrentMsg();
            _lastMsg = _arg_1;
            _SafeStr_4729 = _arg_1.ad;
            _SafeStr_8656 = false;
        }

        public function set popularTags(_arg_1:_SafeStr_1621):void
        {
            disposeCurrentMsg();
            _lastMsg = _arg_1;
            _SafeStr_8656 = false;
        }

        public function set officialRooms(_arg_1:_SafeStr_1557):void
        {
            disposeCurrentMsg();
            _lastMsg = _arg_1;
            _SafeStr_8656 = false;
        }

        public function set categoriesWithVisitorData(_arg_1:_SafeStr_1642):void
        {
            disposeCurrentMsg();
            _lastMsg = _arg_1;
            _SafeStr_8656 = false;
        }

        private function disposeCurrentMsg():void
        {
            if (_lastMsg == null)
            {
                return;
            };
            _lastMsg.dispose();
            _lastMsg = null;
        }

        public function set adRoom(_arg_1:_SafeStr_1549):void
        {
            _SafeStr_4729 = _arg_1;
        }

        public function set promotedRooms(_arg_1:_SafeStr_1583):void
        {
            _promotedRooms = _arg_1;
        }

        public function get adRoom():_SafeStr_1549
        {
            return (_SafeStr_4729);
        }

        public function get guestRoomSearchResults():_SafeStr_1634
        {
            return (_lastMsg as _SafeStr_1634);
        }

        public function get popularTags():_SafeStr_1621
        {
            return (_lastMsg as _SafeStr_1621);
        }

        public function get officialRooms():_SafeStr_1557
        {
            return (_lastMsg as _SafeStr_1557);
        }

        public function get categoriesWithVisitorData():_SafeStr_1642
        {
            return (_lastMsg as _SafeStr_1642);
        }

        public function get promotedRooms():_SafeStr_1583
        {
            return (_promotedRooms);
        }

        public function get roomEventData():_SafeStr_1574
        {
            return (_SafeStr_4728);
        }

        public function get avatarId():int
        {
            return (_SafeStr_3911);
        }

        public function get eventMod():Boolean
        {
            return (_SafeStr_4730);
        }

        public function get roomPicker():Boolean
        {
            return (_SafeStr_4731);
        }

        public function get currentRoomOwner():Boolean
        {
            return (_SafeStr_4727);
        }

        public function get enteredGuestRoom():_SafeStr_1569
        {
            return (_enteredGuestRoom);
        }

        public function get hcMember():Boolean
        {
            return (_SafeStr_4732);
        }

        public function get createdFlatId():int
        {
            return (_SafeStr_4733);
        }

        public function get homeRoomId():int
        {
            return (_SafeStr_4734);
        }

        public function get hotRoomPopupOpen():Boolean
        {
            return (_hotRoomPopupOpen);
        }

        public function get currentRoomRating():int
        {
            return (_SafeStr_4735);
        }

        public function get canRate():Boolean
        {
            return (_SafeStr_4736);
        }

        public function get settingsReceived():Boolean
        {
            return (_SafeStr_4737);
        }

        public function get adIndex():int
        {
            return (_SafeStr_4738);
        }

        public function get currentRoomIsStaffPick():Boolean
        {
            return (_SafeStr_4739);
        }

        public function get currentRoomId():int
        {
            return (_SafeStr_3894);
        }

        public function set avatarId(_arg_1:int):void
        {
            _SafeStr_3911 = _arg_1;
        }

        public function set createdFlatId(_arg_1:int):void
        {
            _SafeStr_4733 = _arg_1;
        }

        public function set hcMember(_arg_1:Boolean):void
        {
            _SafeStr_4732 = _arg_1;
        }

        public function set eventMod(_arg_1:Boolean):void
        {
            _SafeStr_4730 = _arg_1;
        }

        public function set roomPicker(_arg_1:Boolean):void
        {
            _SafeStr_4731 = _arg_1;
        }

        public function set hotRoomPopupOpen(_arg_1:Boolean):void
        {
            _hotRoomPopupOpen = _arg_1;
        }

        public function set homeRoomId(_arg_1:int):void
        {
            _SafeStr_4734 = _arg_1;
        }

        public function set currentRoomRating(_arg_1:int):void
        {
            _SafeStr_4735 = _arg_1;
        }

        public function set canRate(_arg_1:Boolean):void
        {
            _SafeStr_4736 = _arg_1;
        }

        public function set settingsReceived(_arg_1:Boolean):void
        {
            _SafeStr_4737 = _arg_1;
        }

        public function set adIndex(_arg_1:int):void
        {
            _SafeStr_4738 = _arg_1;
        }

        public function set currentRoomIsStaffPick(_arg_1:Boolean):void
        {
            _SafeStr_4739 = _arg_1;
        }

        public function set categories(_arg_1:Array):void
        {
            _SafeStr_4740 = _arg_1;
            _SafeStr_4741 = [];
            for each (var _local_2:_SafeStr_1629 in _SafeStr_4740)
            {
                if (_local_2.visible)
                {
                    _SafeStr_4741.push(_local_2);
                };
            };
        }

        public function get allCategories():Array
        {
            return (_SafeStr_4740);
        }

        public function get visibleCategories():Array
        {
            return (_SafeStr_4741);
        }

        public function getCategoryById(_arg_1:int):_SafeStr_1629
        {
            for each (var _local_2:_SafeStr_1629 in _SafeStr_4740)
            {
                if (_local_2.nodeId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function set eventCategories(_arg_1:Array):void
        {
            _SafeStr_4742 = _arg_1;
            _SafeStr_4743 = [];
            for each (var _local_2:_SafeStr_1551 in _SafeStr_4742)
            {
                if (_local_2.visible)
                {
                    _SafeStr_4743.push(_local_2);
                };
            };
        }

        public function get allEventCategories():Array
        {
            return (_SafeStr_4742);
        }

        public function get visibleEventCategories():Array
        {
            return (_SafeStr_4743);
        }

        public function getEventCategoryById(_arg_1:int):_SafeStr_1551
        {
            for each (var _local_2:_SafeStr_1551 in _SafeStr_4740)
            {
                if (_local_2.categoryId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function onFavourites(_arg_1:_SafeStr_1486):void
        {
            this._SafeStr_4746 = _arg_1.limit;
            this._SafeStr_4745 = _arg_1.favouriteRoomIds.length;
            this._SafeStr_4744 = new Dictionary();
            for each (var _local_2:int in _arg_1.favouriteRoomIds)
            {
                this._SafeStr_4744[_local_2] = "yes";
            };
        }

        public function favouriteChanged(_arg_1:int, _arg_2:Boolean):void
        {
            _SafeStr_4744[_arg_1] = ((_arg_2) ? "yes" : null);
            _SafeStr_4745 = (_SafeStr_4745 + ((_arg_2) ? 1 : -1));
        }

        public function isCurrentRoomFavourite():Boolean
        {
            var _local_1:int = _enteredGuestRoom.flatId;
            return (!(_SafeStr_4744[_local_1] == null));
        }

        public function isCurrentRoomHome():Boolean
        {
            if (_enteredGuestRoom == null)
            {
                return (false);
            };
            var _local_1:int = _enteredGuestRoom.flatId;
            return (this._SafeStr_4734 == _local_1);
        }

        public function isRoomFavourite(_arg_1:int):Boolean
        {
            return (!(_SafeStr_4744[_arg_1] == null));
        }

        public function isFavouritesFull():Boolean
        {
            return (_SafeStr_4745 >= _SafeStr_4746);
        }

        public function isRoomHome(_arg_1:int):Boolean
        {
            return (_arg_1 == _SafeStr_4734);
        }

        public function startLoading():void
        {
            this._SafeStr_8656 = true;
        }

        public function isLoading():Boolean
        {
            return (this._SafeStr_8656);
        }

        public function get friendList():_SafeStr_3369
        {
            return (_friendList);
        }

        public function getAndResetSessionTags():RoomSessionTags
        {
            var _local_1:RoomSessionTags = _SafeStr_4747;
            _SafeStr_4747 = null;
            return (_local_1);
        }

        public function set roomSessionTags(_arg_1:RoomSessionTags):void
        {
            _SafeStr_4747 = _arg_1;
        }

        public function get competitionRoomsData():_SafeStr_1559
        {
            return (_SafeStr_4748);
        }

        public function set competitionRoomsData(_arg_1:_SafeStr_1559):void
        {
            _SafeStr_4748 = _arg_1;
        }


    }
}//package com.sulake.habbo.navigator.domain

// _SafeStr_1254 = "_-i1B" (String#10192, DoABC#4)
// _SafeStr_1486 = "_-3O" (String#24369, DoABC#4)
// _SafeStr_1549 = "_-jk" (String#3003, DoABC#4)
// _SafeStr_1551 = "_-J1A" (String#15646, DoABC#4)
// _SafeStr_1556 = "_-P1B" (String#41280, DoABC#4)
// _SafeStr_1557 = "_-l1x" (String#21612, DoABC#4)
// _SafeStr_1559 = "_-S7" (String#12977, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1574 = "_-e1X" (String#10654, DoABC#4)
// _SafeStr_1583 = "_-51v" (String#23475, DoABC#4)
// _SafeStr_1621 = "_-MK" (String#13817, DoABC#4)
// _SafeStr_1629 = "_-K0" (String#4251, DoABC#4)
// _SafeStr_1634 = "_-I1T" (String#11183, DoABC#4)
// _SafeStr_1642 = "_-U0" (String#18772, DoABC#4)
// _SafeStr_3369 = "_-eH" (String#10998, DoABC#4)
// _SafeStr_3894 = "_-O9" (String#1104, DoABC#4)
// _SafeStr_3911 = "_-mj" (String#4093, DoABC#4)
// _SafeStr_4727 = "_-s1H" (String#7797, DoABC#4)
// _SafeStr_4728 = "_-Q15" (String#7424, DoABC#4)
// _SafeStr_4729 = "_-X1G" (String#11825, DoABC#4)
// _SafeStr_4730 = "_-I1w" (String#18826, DoABC#4)
// _SafeStr_4731 = "_-z1h" (String#19475, DoABC#4)
// _SafeStr_4732 = "_-oT" (String#18175, DoABC#4)
// _SafeStr_4733 = "_-P1X" (String#21119, DoABC#4)
// _SafeStr_4734 = "_-fp" (String#13816, DoABC#4)
// _SafeStr_4735 = "_-Yn" (String#19298, DoABC#4)
// _SafeStr_4736 = "_-A5" (String#22673, DoABC#4)
// _SafeStr_4737 = "_-IH" (String#18864, DoABC#4)
// _SafeStr_4738 = "_-V5" (String#19233, DoABC#4)
// _SafeStr_4739 = "_-gD" (String#19104, DoABC#4)
// _SafeStr_4740 = "_-71U" (String#4977, DoABC#4)
// _SafeStr_4741 = "_-a1L" (String#11267, DoABC#4)
// _SafeStr_4742 = "_-Q1W" (String#11309, DoABC#4)
// _SafeStr_4743 = "_-D1m" (String#10905, DoABC#4)
// _SafeStr_4744 = "_-31O" (String#8980, DoABC#4)
// _SafeStr_4745 = "_-Kq" (String#13520, DoABC#4)
// _SafeStr_4746 = "_-ec" (String#24365, DoABC#4)
// _SafeStr_4747 = "_-4t" (String#12984, DoABC#4)
// _SafeStr_4748 = "_-Kj" (String#18790, DoABC#4)
// _SafeStr_8656 = "_-Pj" (String#6685, DoABC#4)


