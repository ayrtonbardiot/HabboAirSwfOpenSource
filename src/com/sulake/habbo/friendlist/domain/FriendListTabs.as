// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.domain.FriendListTabs

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.FriendsView;
    import com.sulake.habbo.friendlist._SafeStr_3370;
    import com.sulake.habbo.friendlist.SearchView;
    import com.sulake.habbo.friendlist.*;

    public class FriendListTabs 
    {

        private var _SafeStr_4654:_SafeStr_3257;
        private var _SafeStr_3742:Array = [];
        private var _SafeStr_5210:FriendListTab;
        private var _SafeStr_5209:int = 200;
        private var _SafeStr_5208:int = 200;
        private var _windowWidth:int = 200;

        public function FriendListTabs(_arg_1:_SafeStr_3257)
        {
            _SafeStr_4654 = _arg_1;
            _SafeStr_3742.push(new FriendListTab(_SafeStr_4654.getFriendList(), 1, new FriendsView(), "${friendlist.friends}", "friends_footer", "hdr_friends"));
            _SafeStr_3742.push(new FriendListTab(_SafeStr_4654.getFriendList(), 2, new _SafeStr_3370(), "${friendlist.tab.friendrequests}", "friend_requests_footer", "hdr_friend_requests"));
            _SafeStr_3742.push(new FriendListTab(_SafeStr_4654.getFriendList(), 3, new SearchView(), "${generic.search}", "search_footer", "hdr_search"));
            toggleSelected(null);
        }

        public function getTabs():Array
        {
            return (_SafeStr_3742);
        }

        public function findTab(_arg_1:int):FriendListTab
        {
            for each (var _local_2:FriendListTab in _SafeStr_3742)
            {
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function clearSelections():void
        {
            for each (var _local_1:FriendListTab in _SafeStr_3742)
            {
                _local_1.setSelected(false);
            };
        }

        public function findSelectedTab():FriendListTab
        {
            for each (var _local_1:FriendListTab in _SafeStr_3742)
            {
                if (_local_1.selected)
                {
                    return (_local_1);
                };
            };
            return (null);
        }

        public function toggleSelected(_arg_1:FriendListTab):void
        {
            var _local_2:FriendListTab = findSelectedTab();
            if (_local_2 == null)
            {
                _SafeStr_5209 = _SafeStr_5208;
                setSelected(determineDisplayedTab(_arg_1), true);
            }
            else
            {
                if (((_local_2 == _arg_1) || (_arg_1 == null)))
                {
                    _SafeStr_5208 = _SafeStr_5209;
                    _SafeStr_5209 = 0;
                    clearSelections();
                }
                else
                {
                    setSelected(determineDisplayedTab(_arg_1), true);
                };
            };
        }

        private function setSelected(_arg_1:FriendListTab, _arg_2:Boolean):void
        {
            var _local_3:FriendListTab = findSelectedTab();
            clearSelections();
            _arg_1.setSelected(_arg_2);
            if (_arg_2)
            {
                _SafeStr_5210 = _arg_1;
            };
        }

        private function determineDisplayedTab(_arg_1:FriendListTab):FriendListTab
        {
            if (_arg_1 != null)
            {
                return (_arg_1);
            };
            if (_SafeStr_5210 != null)
            {
                return (_SafeStr_5210);
            };
            return (_SafeStr_3742[0]);
        }

        public function get tabContentHeight():int
        {
            return (_SafeStr_5209);
        }

        public function get windowWidth():int
        {
            return (_windowWidth);
        }

        public function get tabContentWidth():int
        {
            return (_windowWidth - 2);
        }

        public function set tabContentHeight(_arg_1:int):void
        {
            _SafeStr_5209 = _arg_1;
        }

        public function set windowWidth(_arg_1:int):void
        {
            _windowWidth = _arg_1;
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_3257 = "_-1w" (String#13045, DoABC#4)
// _SafeStr_3370 = "_-91g" (String#15021, DoABC#4)
// _SafeStr_3742 = "_-p7" (String#1631, DoABC#4)
// _SafeStr_4654 = "_-U1P" (String#3068, DoABC#4)
// _SafeStr_5208 = "_-Nf" (String#18666, DoABC#4)
// _SafeStr_5209 = "_-pN" (String#8593, DoABC#4)
// _SafeStr_5210 = "_-Q1O" (String#14218, DoABC#4)


