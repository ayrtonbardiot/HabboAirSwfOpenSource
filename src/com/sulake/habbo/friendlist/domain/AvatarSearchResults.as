// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.domain.AvatarSearchResults

package com.sulake.habbo.friendlist.domain
{
    import flash.utils.Dictionary;
    import _-JS._SafeStr_1604;

    public class AvatarSearchResults 
    {

        private var _SafeStr_4654:_SafeStr_3131;
        private var _SafeStr_4782:Array;
        private var _others:Array;
        private var _SafeStr_4905:Dictionary = new Dictionary();

        public function AvatarSearchResults(_arg_1:_SafeStr_3131)
        {
            _SafeStr_4654 = _arg_1;
        }

        public function getResult(_arg_1:int):_SafeStr_1604
        {
            for each (var _local_3:_SafeStr_1604 in _SafeStr_4782)
            {
                if (_local_3.avatarId == _arg_1)
                {
                    return (_local_3);
                };
            };
            for each (var _local_2:_SafeStr_1604 in _others)
            {
                if (_local_2.avatarId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function searchReceived(_arg_1:Array, _arg_2:Array):void
        {
            _SafeStr_4782 = _arg_1;
            _others = _arg_2;
            _SafeStr_4654.view.refreshList();
        }

        public function get friends():Array
        {
            return (_SafeStr_4782);
        }

        public function get others():Array
        {
            return (_others);
        }

        public function setFriendRequestSent(_arg_1:int):void
        {
            _SafeStr_4905[_arg_1] = "yes";
        }

        public function isFriendRequestSent(_arg_1:int):Boolean
        {
            return (!(_SafeStr_4905[_arg_1] == null));
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_1604 = "_-S10" (String#10463, DoABC#4)
// _SafeStr_3131 = "_-32l" (String#11540, DoABC#4)
// _SafeStr_4654 = "_-U1P" (String#3068, DoABC#4)
// _SafeStr_4782 = "_-N1y" (String#3015, DoABC#4)
// _SafeStr_4905 = "_-12I" (String#14757, DoABC#4)


