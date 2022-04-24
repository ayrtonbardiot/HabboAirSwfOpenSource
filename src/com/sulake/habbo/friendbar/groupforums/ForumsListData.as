// by nota

//com.sulake.habbo.friendbar.groupforums.ForumsListData

package com.sulake.habbo.friendbar.groupforums
{
    import _-Wi._SafeStr_1461;
    import _-Wi._SafeStr_1644;

    public class ForumsListData 
    {

        private var _SafeStr_6468:int;
        private var _totalAmount:int;
        private var _SafeStr_5170:int;
        private var _forums:Array;

        public function ForumsListData(_arg_1:_SafeStr_1461)
        {
            _SafeStr_6468 = _arg_1.listCode;
            _totalAmount = _arg_1.totalAmount;
            _SafeStr_5170 = _arg_1.startIndex;
            _forums = _arg_1.forums;
        }

        public function get listCode():int
        {
            return (_SafeStr_6468);
        }

        public function get totalAmount():int
        {
            return (_totalAmount);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get forums():Array
        {
            return (_forums);
        }

        public function get unreadForumsCount():int
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:int;
            _local_3 = 0;
            while (_local_3 < _forums.length)
            {
                _local_1 = _forums[_local_3];
                if (_local_1.unreadMessages > 0)
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function getForumData(_arg_1:int):_SafeStr_1644
        {
            for each (var _local_2:_SafeStr_1644 in _forums)
            {
                if (_local_2.groupId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function updateUnreadMessages(_arg_1:_SafeStr_1644, _arg_2:int):void
        {
            var _local_3:_SafeStr_1644 = getForumData(_arg_1.groupId);
            if (_local_3 != null)
            {
                _local_3.updateFrom(_arg_1);
                _local_3.lastReadMessageId = _arg_2;
            };
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1461 = "_-I1M" (String#31548, DoABC#4)
// _SafeStr_1644 = "_-mW" (String#4106, DoABC#4)
// _SafeStr_5170 = "_-x1C" (String#2797, DoABC#4)
// _SafeStr_6468 = "_-XH" (String#19305, DoABC#4)


