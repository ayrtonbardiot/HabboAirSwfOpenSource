// by nota

//com.sulake.habbo.friendlist.domain.FriendRequestsDeps

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;
    import com.sulake.habbo.friendlist._SafeStr_3112;

    public class FriendRequestsDeps implements _SafeStr_3147 
    {

        private var _friendList:HabboFriendList;

        public function FriendRequestsDeps(_arg_1:HabboFriendList)
        {
            _friendList = _arg_1;
        }

        public function get view():_SafeStr_3112
        {
            return (_friendList.tabs.findTab(2).tabView as _SafeStr_3112);
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_3112 = "_-S1u" (String#5103, DoABC#4)
// _SafeStr_3147 = "_-U1d" (String#13284, DoABC#4)


