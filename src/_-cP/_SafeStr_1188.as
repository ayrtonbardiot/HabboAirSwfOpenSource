// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-cP._SafeStr_1188

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1188 implements IMessageParser 
    {

        private var _SafeStr_5144:_SafeStr_24;

        public function _SafeStr_1188()
        {
            _SafeStr_5144 = new _SafeStr_24();
        }

        public function get songDiskCount():int
        {
            return (_SafeStr_5144.length);
        }

        public function getDiskId(_arg_1:int):int
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_5144.length)))
            {
                return (_SafeStr_5144.getKey(_arg_1));
            };
            return (-1);
        }

        public function getSongId(_arg_1:int):int
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_5144.length)))
            {
                return (_SafeStr_5144.getWithIndex(_arg_1));
            };
            return (-1);
        }

        public function flush():Boolean
        {
            _SafeStr_5144.reset();
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = _arg_1.readInteger();
                _local_5 = _arg_1.readInteger();
                _SafeStr_5144.add(_local_4, _local_5);
                _local_3++;
            };
            return (true);
        }


    }
}//package _-cP

// _SafeStr_1188 = "_-x1u" (String#10542, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_5144 = "_-f1l" (String#9346, DoABC#3)


