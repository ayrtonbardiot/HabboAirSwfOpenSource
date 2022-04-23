// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.domain.FriendCategoriesDeps

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;
    import com.sulake.habbo.friendlist._SafeStr_3132;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.notifications._SafeStr_2081;

    public class FriendCategoriesDeps implements _SafeStr_3144 
    {

        private var _friendList:HabboFriendList;

        public function FriendCategoriesDeps(_arg_1:HabboFriendList)
        {
            this._friendList = _arg_1;
        }

        public function get view():_SafeStr_3132
        {
            return (_friendList.tabs.findTab(1).tabView as _SafeStr_3132);
        }

        public function get messenger():_SafeStr_1700
        {
            return (this._friendList.messenger);
        }

        public function get notifications():_SafeStr_2081
        {
            return (this._friendList.notifications);
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_2081 = "_-TA" (String#4559, DoABC#4)
// _SafeStr_3132 = "_-31A" (String#9784, DoABC#4)
// _SafeStr_3144 = "_-w1q" (String#12646, DoABC#4)


