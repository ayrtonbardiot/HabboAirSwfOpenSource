// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.domain.AvatarSearchDeps

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;
    import com.sulake.habbo.friendlist.ISearchView;

    public class AvatarSearchDeps implements _SafeStr_3131 
    {

        private var _friendList:HabboFriendList;

        public function AvatarSearchDeps(_arg_1:HabboFriendList)
        {
            _friendList = _arg_1;
        }

        public function get view():ISearchView
        {
            return (_friendList.tabs.findTab(3).tabView as ISearchView);
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_3131 = "_-32l" (String#11540, DoABC#4)


