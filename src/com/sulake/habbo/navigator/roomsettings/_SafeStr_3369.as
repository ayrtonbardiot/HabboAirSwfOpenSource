// by nota

//com.sulake.habbo.navigator.roomsettings._SafeStr_3369

package com.sulake.habbo.navigator.roomsettings
{
    import flash.utils.Dictionary;
    import _-JS._SafeStr_373;
    import _-wm._SafeStr_1420;
    import _-JS._SafeStr_1600;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-JS._SafeStr_404;
    import _-wm._SafeStr_1097;

    public class _SafeStr_3369 
    {

        private var _SafeStr_6341:Dictionary = new Dictionary();
        private var _SafeStr_4162:Array;


        public function onFriendsListFragment(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1420 = (_arg_1 as _SafeStr_373).getParser();
            if (_local_2 == null)
            {
                return;
            };
            for each (var _local_3:_SafeStr_1600 in _local_2.friendFragment)
            {
                _SafeStr_6341[_local_3.id] = _local_3.name;
            };
        }

        public function onFriendListUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1097 = (_arg_1 as _SafeStr_404).getParser();
            for each (var _local_3:int in _local_2.removedFriendIds)
            {
                _SafeStr_6341[_local_3] = null;
            };
            for each (var _local_4:_SafeStr_1600 in _local_2.addedFriends)
            {
                _SafeStr_6341[_local_4.id] = _local_4.name;
            };
            _SafeStr_4162 = (((_local_2.removedFriendIds.length > 0) || (_local_2.addedFriends.length > 0)) ? null : _SafeStr_4162);
        }

        public function get list():Array
        {
            var _local_3:int;
            var _local_2:* = null;
            if (_SafeStr_4162 == null)
            {
                _SafeStr_4162 = [];
                for (var _local_1:String in _SafeStr_6341)
                {
                    _local_3 = _local_1;
                    _local_2 = _SafeStr_6341[_local_3];
                    if (_local_2 != null)
                    {
                        _SafeStr_4162.push(new FriendEntryData(_local_3, _local_2));
                    };
                };
                _SafeStr_4162.sortOn("userName", 1);
            };
            return (_SafeStr_4162);
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_1097 = "_-RI" (String#22937, DoABC#4)
// _SafeStr_1420 = "_-Yu" (String#29554, DoABC#4)
// _SafeStr_1600 = "_-Cu" (String#6879, DoABC#4)
// _SafeStr_3369 = "_-eH" (String#10998, DoABC#4)
// _SafeStr_373 = "_-U1c" (String#6702, DoABC#4)
// _SafeStr_404 = "_-M1U" (String#6652, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_6341 = "_-f3" (String#10195, DoABC#4)


