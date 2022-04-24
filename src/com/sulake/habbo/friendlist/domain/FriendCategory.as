// by nota

//com.sulake.habbo.friendlist.domain.FriendCategory

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendlist.Util;

    public class FriendCategory implements _SafeStr_13 
    {

        public static const PAGE_SIZE:int = 100;
        public static const CATID_ONLINE:int = 0;
        public static const CATID_OFFLINE:int = -1;

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _open:Boolean;
        private var _SafeStr_4782:Array = [];
        private var _SafeStr_4783:Boolean;
        private var _disposed:Boolean;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4784:int;

        public function FriendCategory(_arg_1:int, _arg_2:String)
        {
            _SafeStr_3820 = _arg_1;
            _name = _arg_2;
            _open = (!(_SafeStr_3820 == -1));
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_3882 = null;
        }

        public function addFriend(_arg_1:Friend):void
        {
            removeFriend(_arg_1.id);
            _SafeStr_4782.push(_arg_1);
            _SafeStr_4782.sortOn(["pocketHabboUser", "name"], [(0x10 | 0x02), 1]);
        }

        public function getSelectedFriends(_arg_1:Array):void
        {
            for each (var _local_2:Friend in _SafeStr_4782)
            {
                if (_local_2.selected)
                {
                    _arg_1.push(_local_2);
                };
            };
        }

        public function getFriend(_arg_1:int):Friend
        {
            for each (var _local_2:Friend in _SafeStr_4782)
            {
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getFriendCount(_arg_1:Boolean, _arg_2:Boolean=false):int
        {
            var _local_3:int;
            for each (var _local_4:Friend in _SafeStr_4782)
            {
                if ((((!(_arg_1)) || (_local_4.online)) && ((!(_arg_2)) || (_local_4.followingAllowed))))
                {
                    _local_3 = (_local_3 + 1);
                };
            };
            return (_local_3);
        }

        public function removeFriend(_arg_1:int):Friend
        {
            var _local_2:Friend = getFriend(_arg_1);
            if (_local_2 != null)
            {
                Util.remove(_SafeStr_4782, _local_2);
                return (_local_2);
            };
            return (null);
        }

        private function checkPageIndex():void
        {
            if (this._SafeStr_4784 >= this.getPageCount())
            {
                this._SafeStr_4784 = Math.max(0, (this.getPageCount() - 1));
            };
        }

        public function getPageCount():int
        {
            return (Math.ceil((this._SafeStr_4782.length / 100)));
        }

        public function getStartFriendIndex():int
        {
            checkPageIndex();
            return (this._SafeStr_4784 * 100);
        }

        public function getEndFriendIndex():int
        {
            checkPageIndex();
            return (Math.min(((this._SafeStr_4784 + 1) * 100), this._SafeStr_4782.length));
        }

        public function setOpen(_arg_1:Boolean):void
        {
            _open = _arg_1;
            if (!_arg_1)
            {
                for each (var _local_2:Friend in _SafeStr_4782)
                {
                    _local_2.selected = false;
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get received():Boolean
        {
            return (_SafeStr_4783);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get friends():Array
        {
            return (_SafeStr_4782);
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function get open():Boolean
        {
            return (_open);
        }

        public function get pageIndex():int
        {
            return (_SafeStr_4784);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_3882 = _arg_1;
        }

        public function set received(_arg_1:Boolean):void
        {
            _SafeStr_4783 = _arg_1;
        }

        public function set pageIndex(_arg_1:int):void
        {
            _SafeStr_4784 = _arg_1;
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4782 = "_-N1y" (String#3015, DoABC#4)
// _SafeStr_4783 = "_-Pr" (String#18739, DoABC#4)
// _SafeStr_4784 = "_-vz" (String#9486, DoABC#4)


