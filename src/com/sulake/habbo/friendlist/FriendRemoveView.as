// by nota

//com.sulake.habbo.friendlist.FriendRemoveView

package com.sulake.habbo.friendlist
{
    import com.sulake.habbo.friendlist.domain.Friend;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3133;
    import _-Po._SafeStr_234;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class FriendRemoveView extends AlertView 
    {

        private var _selected:Array;

        public function FriendRemoveView(_arg_1:HabboFriendList)
        {
            super(_arg_1, "friend_remove_confirm");
            _selected = _arg_1.categories.getSelectedFriends();
        }

        override public function dispose():void
        {
            _selected = null;
            super.dispose();
        }

        override internal function setupContent(_arg_1:_SafeStr_3133):void
        {
            _arg_1.findChildByName("cancel").procedure = onClose;
            _arg_1.findChildByName("ok").procedure = onRemove;
            var _local_4:Array = [];
            for each (var _local_2:Friend in _selected)
            {
                _local_4.push(_local_2.name);
            };
            var _local_5:String = Util.arrayToString(_local_4);
            var _local_3:Dictionary = new Dictionary();
            friendList.registerParameter("friendlist.removefriendconfirm.userlist", "user_names", _local_5);
        }

        private function onRemove(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Remove Ok clicked");
            var _local_3:_SafeStr_234 = new _SafeStr_234();
            for each (var _local_4:Friend in _selected)
            {
                _local_3.addRemovedFriend(_local_4.id);
            };
            friendList.send(_local_3);
            dispose();
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_234 = "_-W11" (String#12306, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


