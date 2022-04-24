// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1459

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1459 implements IMessageParser 
    {

        private var _SafeStr_8477:_SafeStr_24;
        private var _SafeStr_8478:_SafeStr_24;


        public function get urgentData():_SafeStr_24
        {
            return (_SafeStr_8477);
        }

        public function get normalData():_SafeStr_24
        {
            return (_SafeStr_8478);
        }

        public function flush():Boolean
        {
            if (_SafeStr_8477 != null)
            {
                _SafeStr_8477.dispose();
            };
            _SafeStr_8477 = null;
            if (_SafeStr_8478 != null)
            {
                _SafeStr_8478.dispose();
            };
            _SafeStr_8478 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_5:* = null;
            var _local_4:int;
            var _local_3:int;
            _SafeStr_8477 = new _SafeStr_24();
            _SafeStr_8478 = new _SafeStr_24();
            _local_3 = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = _arg_1.readInteger();
                _local_5 = _arg_1.readString();
                _SafeStr_8477.add(_local_2, _local_5);
                _local_4++;
            };
            _local_3 = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = _arg_1.readInteger();
                _local_5 = _arg_1.readString();
                _SafeStr_8478.add(_local_2, _local_5);
                _local_4++;
            };
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1459 = "_-r1E" (String#10119, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_8477 = "_-YH" (String#8865, DoABC#3)
// _SafeStr_8478 = "_-Xv" (String#8820, DoABC#3)


