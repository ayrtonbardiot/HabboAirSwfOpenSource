// by nota

//com.sulake.habbo.friendlist.domain.FriendCategories

package com.sulake.habbo.friendlist.domain
{
    import flash.utils.Dictionary;
    import _-JS._SafeStr_404;
    import _-JS._SafeStr_1600;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-JS._SafeStr_1545;
    import com.sulake.habbo.friendlist.Util;
    import com.sulake.habbo.friendlist._SafeStr_3132;
    import _-JS.*;
    import _-wm.*;

    public class FriendCategories 
    {

        private var _SafeStr_4654:_SafeStr_3144;
        private var _SafeStr_3921:Array = [];
        private var _SafeStr_5260:Dictionary = new Dictionary();

        public function FriendCategories(_arg_1:_SafeStr_3144)
        {
            _SafeStr_4654 = _arg_1;
        }

        public function addFriend(_arg_1:Friend):FriendCategory
        {
            var _local_2:int = ((_arg_1.online) ? _arg_1.categoryId : -1);
            var _local_3:FriendCategory = findCategory(_local_2);
            if (_local_3 != null)
            {
                _local_3.addFriend(_arg_1);
                _SafeStr_5260[_arg_1.id] = _arg_1;
                return (_local_3);
            };
            _SafeStr_14.log((((("No category " + _local_2) + " found for friend ") + _arg_1.id) + ". Ignoring"));
            return (null);
        }

        public function getSelectedFriends():Array
        {
            var _local_1:Array = [];
            for each (var _local_2:FriendCategory in _SafeStr_3921)
            {
                _local_2.getSelectedFriends(_local_1);
            };
            return (_local_1);
        }

        public function getSelectedFriend():Friend
        {
            var _local_1:Array = getSelectedFriends();
            return ((_local_1.length == 1) ? _local_1[0] : null);
        }

        public function getAllFriends():Dictionary
        {
            return (_SafeStr_5260);
        }

        public function getFriendCount(_arg_1:Boolean, _arg_2:Boolean=false):int
        {
            var _local_3:int;
            for each (var _local_4:FriendCategory in _SafeStr_3921)
            {
                _local_3 = (_local_3 + _local_4.getFriendCount(_arg_1, _arg_2));
            };
            return (_local_3);
        }

        public function getCategories():Array
        {
            return (_SafeStr_3921);
        }

        public function addCategory(_arg_1:FriendCategory):void
        {
            _SafeStr_3921.push(_arg_1);
        }

        public function findFriend(_arg_1:int):Friend
        {
            return (_SafeStr_5260[_arg_1]);
        }

        public function findCategory(_arg_1:int):FriendCategory
        {
            for each (var _local_2:FriendCategory in _SafeStr_3921)
            {
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function onFriendListUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_8:Boolean;
            var _local_3:Boolean;
            var _local_5:* = null;
            _SafeStr_14.log("Received friend list update");
            var _local_9:int;
            try
            {
                _local_2 = (_arg_1 as _SafeStr_404).getParser();
                _local_9 = 1;
                updateCategories(_local_2.cats);
                _local_9 = 2;
                for each (var _local_4:int in _local_2.removedFriendIds)
                {
                    removeFriend(_local_4, true);
                };
                _local_9 = 3;
                for each (var _local_7:_SafeStr_1600 in _local_2.updatedFriends)
                {
                    _SafeStr_14.log(((((((("Got UPDATE: " + _local_7.id) + ", ") + _local_7.online) + ", ") + _local_7.name) + ", ") + _local_7.followingAllowed));
                    _SafeStr_4654.messenger.setFollowingAllowed(_local_7.id, ((_local_7.followingAllowed) && (_local_7.online)));
                    _local_8 = isFriendOnline(_local_7.id);
                    if (((_local_8) && (!(_local_7.online))))
                    {
                        _SafeStr_4654.messenger.setOnlineStatus(_local_7.id, _local_7.online);
                    };
                    if (((!(_local_8)) && (_local_7.online)))
                    {
                        _SafeStr_4654.messenger.setOnlineStatus(_local_7.id, _local_7.online);
                        _SafeStr_4654.view.setNewMessageArrived();
                    };
                    _local_3 = removeFriend(_local_7.id, true);
                    _local_5 = new Friend(_local_7);
                    _local_5.selected = _local_3;
                    addFriend(_local_5);
                };
                _local_9 = 4;
                for each (var _local_6:_SafeStr_1600 in _local_2.addedFriends)
                {
                    _SafeStr_14.log(((("Got INSERT: " + _local_6.id) + ", ") + _local_6.name));
                    removeFriend(_local_6.id, true);
                    addFriend(new Friend(_local_6));
                };
                _local_9 = 5;
                this._SafeStr_4654.view.refreshList();
                _local_9 = 6;
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("FriendCategories", (("onFriendListUpdate crashed, status = " + _local_9) + "!"));
                throw (e);
            };
        }

        private function updateCategories(_arg_1:Array):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            flushReceivedStatus();
            findCategory(-1).received = true;
            findCategory(0).received = true;
            for each (var _local_5:_SafeStr_1545 in _arg_1)
            {
                _local_4 = findCategory(_local_5.id);
                if (_local_4 != null)
                {
                    _local_4.received = true;
                    if (_local_4.name != _local_5.name)
                    {
                        _local_4.name = _local_5.name;
                    };
                }
                else
                {
                    _local_3 = new FriendCategory(_local_5.id, _local_5.name);
                    _local_3.received = true;
                    addCategory(_local_3);
                };
            };
            for each (var _local_2:FriendCategory in getCategoriesNotReceived())
            {
                if (_local_2.friends.length <= 0)
                {
                    Util.remove(_SafeStr_3921, _local_2);
                    _local_2.dispose();
                };
            };
        }

        private function removeFriend(_arg_1:int, _arg_2:Boolean):Boolean
        {
            var _local_4:* = null;
            if (_arg_2)
            {
                _SafeStr_5260[_arg_1] = null;
            };
            var _local_5:Boolean;
            for each (var _local_3:FriendCategory in _SafeStr_3921)
            {
                _local_4 = _local_3.removeFriend(_arg_1);
                if (_local_4 != null)
                {
                    _local_5 = _local_4.selected;
                    if (_arg_2)
                    {
                        _local_4.dispose();
                    };
                };
            };
            return (_local_5);
        }

        private function flushReceivedStatus():void
        {
            for each (var _local_1:FriendCategory in _SafeStr_3921)
            {
                _local_1.received = false;
            };
        }

        private function getCategoriesNotReceived():Array
        {
            var _local_1:Array = [];
            for each (var _local_2:FriendCategory in _SafeStr_3921)
            {
                if (!_local_2.received)
                {
                    _local_1.push(_local_2);
                };
            };
            return (_local_1);
        }

        private function isFriendOnline(_arg_1:int):Boolean
        {
            var _local_2:Friend = findFriend(_arg_1);
            return ((_local_2 == null) ? false : _local_2.online);
        }

        public function getFriendNames():Array
        {
            if (_SafeStr_5260 == null)
            {
                return ([]);
            };
            var _local_1:Array = [];
            for each (var _local_2:Friend in _SafeStr_5260)
            {
                if (_local_2 != null)
                {
                    _local_1.push(_local_2.name);
                };
            };
            return (_local_1);
        }

        public function get view():_SafeStr_3132
        {
            return (this._SafeStr_4654.view);
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_1097 = "_-RI" (String#22937, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1545 = "_-h1b" (String#29991, DoABC#4)
// _SafeStr_1600 = "_-Cu" (String#6879, DoABC#4)
// _SafeStr_3132 = "_-31A" (String#9784, DoABC#4)
// _SafeStr_3144 = "_-w1q" (String#12646, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_404 = "_-M1U" (String#6652, DoABC#4)
// _SafeStr_4654 = "_-U1P" (String#3068, DoABC#4)
// _SafeStr_5260 = "_-jB" (String#8644, DoABC#4)


