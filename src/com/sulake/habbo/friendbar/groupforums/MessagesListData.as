// by nota

//com.sulake.habbo.friendbar.groupforums.MessagesListData

package com.sulake.habbo.friendbar.groupforums
{
    import flash.utils.Dictionary;

    public class MessagesListData 
    {

        private var _SafeStr_5640:int;
        private var _SafeStr_5170:int;
        private var _SafeStr_5641:int;
        private var _SafeStr_5642:Array;
        private var _SafeStr_5639:Dictionary;

        public function MessagesListData(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Array):void
        {
            var _local_5:int;
            var _local_6:* = null;
            super();
            _SafeStr_5640 = _arg_1;
            _SafeStr_5170 = _arg_3;
            _SafeStr_5641 = _arg_2;
            _SafeStr_5642 = _arg_4;
            _SafeStr_5639 = new Dictionary();
            _local_5 = 0;
            while (_local_5 < _arg_4.length)
            {
                _local_6 = _arg_4[_local_5];
                _SafeStr_5639[_local_6.messageId] = _local_6;
                _local_5++;
            };
        }

        public function get threadId():int
        {
            return (_SafeStr_5640);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get totalMessages():int
        {
            return (_SafeStr_5641);
        }

        public function get messages():Array
        {
            return (_SafeStr_5642);
        }

        public function get messagesById():Dictionary
        {
            return (_SafeStr_5639);
        }

        public function get size():int
        {
            return (_SafeStr_5642.length);
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1560 = "_-x4" (String#4460, DoABC#4)
// _SafeStr_5170 = "_-x1C" (String#2797, DoABC#4)
// _SafeStr_5639 = "_-71w" (String#14660, DoABC#4)
// _SafeStr_5640 = "_-lE" (String#3862, DoABC#4)
// _SafeStr_5641 = "_-9u" (String#22618, DoABC#4)
// _SafeStr_5642 = "_-oE" (String#8607, DoABC#4)


