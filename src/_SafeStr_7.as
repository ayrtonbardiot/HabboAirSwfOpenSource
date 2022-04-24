// by nota

//_SafeStr_7

package 
{
    import flash.display.Sprite;
    import flash.utils.ByteArray;
    import flash.utils.Endian;

    public class _SafeStr_7 extends Sprite 
    {

        private static var _SafeStr_3529:Class = _SafeStr_9;
        private static var _SafeStr_3530:Class;
        private static var _SafeStr_3531:Class;
        private static var _SafeStr_3535:Array;
        private static var _SafeStr_3534:Array;
        private static var _SafeStr_3537:Boolean = false;
        private static var _SafeStr_3539:int;

        {
            while ((_SafeStr_3530 = _SafeStr_11), (_SafeStr_3531 = _SafeStr_8), (_SafeStr_3535 = new Array()), true)
            {
                _SafeStr_3534 = new Array();
                break;
            };
        }


        private static function _SafeStr_3538():void
        {
            var _local_1:ByteArray = (new _SafeStr_3529() as ByteArray);
            var _local_2:ByteArray = (new _SafeStr_3530() as ByteArray);
            var _local_3:ByteArray = (new _SafeStr_3531() as ByteArray);
            _local_3.endian = Endian.LITTLE_ENDIAN;
            _SafeStr_3539 = _local_3.readInt();
            var _local_4:int = _local_2.readByte();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _SafeStr_3532(_local_2);
                _local_5++;
            };
            _local_4 = _local_1.readInt();
            var _local_6:int;
            while (_local_6 < _local_4)
            {
                while (_SafeStr_3533(_local_1, _SafeStr_3534[(_local_6 % _SafeStr_3534.length)]), true)
                {
                    _local_6++;
                    break;
                };
            };
            _SafeStr_3537 = true;
        }

        private static function _SafeStr_3533(_arg_1:ByteArray, _arg_2:ByteArray):void
        {
            var _local_3:int = _arg_1.readInt();
            var _local_4:ByteArray = new ByteArray();
            _arg_1.readBytes(_local_4, 0, _local_3);
            var _local_5:_SafeStr_10 = new _SafeStr_10(_arg_2);
            _local_5._SafeStr_3536(_local_4);
            _local_4.position = 0;
            _SafeStr_3535.push(_local_4.readUTFBytes(_local_4.length));
        }

        private static function _SafeStr_3532(_arg_1:ByteArray):void
        {
            var _local_2:ByteArray = new ByteArray();
            _arg_1.readBytes(_local_2, 0, 16);
            _local_2.position = 0;
            _SafeStr_3534.push(_local_2);
        }

        public static function _SafeStr_3528(_arg_1:int):String
        {
            if (!_SafeStr_3537)
            {
                _SafeStr_3538();
            };
            return (_SafeStr_3535[(_arg_1 ^ _SafeStr_3539)]);
        }


    }
}//package 

// _SafeStr_10 = "_a_-_-_" (String#3, DoABC#2)
// _SafeStr_11 = "_a_-_" (String#16, DoABC#2)
// _SafeStr_3528 = "_a_--_--" (String#54, DoABC#2)
// _SafeStr_3529 = "_a_--_-" (String#25, DoABC#2)
// _SafeStr_3530 = "_a_--_" (String#26, DoABC#2)
// _SafeStr_3531 = "_a_-__" (String#24, DoABC#2)
// _SafeStr_3532 = "_a_-__-_" (String#34, DoABC#2)
// _SafeStr_3533 = "_a_--__" (String#37, DoABC#2)
// _SafeStr_3534 = "_a_----" (String#18, DoABC#2)
// _SafeStr_3535 = "_a_-____" (String#23, DoABC#2)
// _SafeStr_3536 = "_a_---_" (String#43, DoABC#2)
// _SafeStr_3537 = "_a_-___-" (String#20, DoABC#2)
// _SafeStr_3538 = "_a_-_--" (String#36, DoABC#2)
// _SafeStr_3539 = "_a_--" (String#33, DoABC#2)
// _SafeStr_7 = "_a_-_---" (String#12, DoABC#2)
// _SafeStr_8 = "_a_---" (String#17, DoABC#2)
// _SafeStr_9 = "_a_-_-__" (String#19, DoABC#2)


