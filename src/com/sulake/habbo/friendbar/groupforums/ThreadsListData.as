// by nota

//com.sulake.habbo.friendbar.groupforums.ThreadsListData

package com.sulake.habbo.friendbar.groupforums
{
    import flash.utils.Dictionary;
    import _-Wi._SafeStr_1633;

    public class ThreadsListData 
    {

        public static const PAGE_SIZE:int = 20;

        private var _SafeStr_6275:int;
        private var _SafeStr_5170:int;
        private var _SafeStr_6276:Array;
        private var _SafeStr_6274:Dictionary;

        public function ThreadsListData(_arg_1:int, _arg_2:int, _arg_3:Array)
        {
            var _local_4:int;
            var _local_5:* = null;
            super();
            _SafeStr_6275 = _arg_1;
            _SafeStr_5170 = _arg_2;
            _SafeStr_6276 = _arg_3;
            _SafeStr_6274 = new Dictionary();
            _local_4 = 0;
            while (_local_4 < _arg_3.length)
            {
                _local_5 = _arg_3[_local_4];
                _SafeStr_6274[_local_5.threadId] = _local_5;
                _local_4++;
            };
        }

        public function get totalThreads():int
        {
            return (_SafeStr_6275);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get threads():Array
        {
            return (_SafeStr_6276);
        }

        public function get threadsById():Dictionary
        {
            return (_SafeStr_6274);
        }

        public function get size():int
        {
            return (_SafeStr_6276.length);
        }

        public function updateThread(_arg_1:_SafeStr_1633):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            threadsById[_arg_1.threadId] = _arg_1;
            _local_3 = 0;
            while (_local_3 < threads.length)
            {
                _local_2 = threads[_local_3];
                if (_local_2.threadId == _arg_1.threadId)
                {
                    threads[_local_3] = _arg_1;
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1633 = "_-XN" (String#3408, DoABC#4)
// _SafeStr_5170 = "_-x1C" (String#2797, DoABC#4)
// _SafeStr_6274 = "_-E2" (String#13865, DoABC#4)
// _SafeStr_6275 = "_-n1O" (String#20950, DoABC#4)
// _SafeStr_6276 = "_-Ba" (String#14073, DoABC#4)


