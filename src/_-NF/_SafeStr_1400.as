// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1400

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1400 implements IMessageParser 
    {

        protected var _SafeStr_4145:_SafeStr_24;


        public function flush():Boolean
        {
            if (_SafeStr_4145)
            {
                _SafeStr_4145.dispose();
                _SafeStr_4145 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_5:int;
            var _local_4:int = _arg_1.readInteger();
            _SafeStr_4145 = new _SafeStr_24();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = _arg_1.readInteger();
                _local_2 = _arg_1.readString();
                _SafeStr_4145.add(_local_3, _local_2);
                _local_5++;
            };
            return (true);
        }

        public function get badges():_SafeStr_24
        {
            var _local_1:int;
            var _local_2:_SafeStr_24 = new _SafeStr_24();
            _local_1 = 0;
            while (_local_1 < _SafeStr_4145.length)
            {
                _local_2.add(_SafeStr_4145.getKey(_local_1), _SafeStr_4145.getWithIndex(_local_1));
                _local_1++;
            };
            return (_local_2);
        }


    }
}//package _-NF

// _SafeStr_1400 = "_-41L" (String#6809, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4145 = "_-ZY" (String#8943, DoABC#3)


