// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1324

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1324 implements IMessageParser 
    {

        private static const _SafeStr_7109:int = 0x4000;
        private static const _SafeStr_7110:int = 16383;

        private var _SafeStr_3740:Vector.<int>;
        private var _width:int = 0;
        private var _SafeStr_4234:int = 0;


        public static function decodeTileHeight(_arg_1:int):Number
        {
            return ((_arg_1 < 0) ? -1 : ((_arg_1 & 0x3FFF) / 0x0100));
        }

        public static function decodeIsStackingBlocked(_arg_1:int):Boolean
        {
            return (_arg_1 & 0x4000);
        }

        public static function decodeIsRoomTile(_arg_1:int):Boolean
        {
            return (_arg_1 >= 0);
        }


        public function get width():int
        {
            return (_width);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }

        public function getTileHeight(_arg_1:int, _arg_2:int):Number
        {
            if (((((_arg_1 < 0) || (_arg_1 >= _width)) || (_arg_2 < 0)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (-1);
            };
            return (decodeTileHeight(_SafeStr_3740[((_arg_2 * _width) + _arg_1)]));
        }

        public function getStackingBlocked(_arg_1:int, _arg_2:int):Boolean
        {
            if (((((_arg_1 < 0) || (_arg_1 >= _width)) || (_arg_2 < 0)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (true);
            };
            return (decodeIsStackingBlocked(_SafeStr_3740[((_arg_2 * _width) + _arg_1)]));
        }

        public function isRoomTile(_arg_1:int, _arg_2:int):Boolean
        {
            if (((((_arg_1 < 0) || (_arg_1 >= _width)) || (_arg_2 < 0)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (false);
            };
            return (decodeIsRoomTile(_SafeStr_3740[((_arg_2 * _width) + _arg_1)]));
        }

        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            _width = 0;
            _SafeStr_4234 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            if (_arg_1 == null)
            {
                return (false);
            };
            _width = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _SafeStr_4234 = (_local_3 / _width);
            _SafeStr_3740 = new Vector.<int>(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_3740[_local_2] = _arg_1.readShort();
                _local_2++;
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1324 = "_-zy" (String#10702, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_4234 = "_-z1j" (String#10673, DoABC#3)
// _SafeStr_7109 = "_-31w" (String#6734, DoABC#3)
// _SafeStr_7110 = "_-e1n" (String#9285, DoABC#3)


