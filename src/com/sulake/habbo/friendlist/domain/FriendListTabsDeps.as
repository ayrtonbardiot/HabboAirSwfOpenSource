// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.domain.FriendListTabsDeps

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;

    public class FriendListTabsDeps implements _SafeStr_3257 
    {

        private var _friendList:HabboFriendList;

        public function FriendListTabsDeps(_arg_1:HabboFriendList)
        {
            _friendList = _arg_1;
        }

        public function getFriendList():HabboFriendList
        {
            return (_friendList);
        }

        public function getWindowHeight():int
        {
            return (_friendList.view.mainWindow.height);
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_3257 = "_-1w" (String#13045, DoABC#4)


