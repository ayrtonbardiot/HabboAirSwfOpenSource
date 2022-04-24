// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1181

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1181 implements IMessageParser 
    {

        private var _SafeStr_4674:int;
        private var _description:String;
        private var _SafeStr_3740:_SafeStr_24;


        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get data():_SafeStr_24
        {
            return (_SafeStr_3740);
        }

        public function flush():Boolean
        {
            if (_SafeStr_3740 != null)
            {
                _SafeStr_3740.dispose();
            };
            _SafeStr_3740 = null;
            _SafeStr_4674 = -1;
            _description = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_5:* = null;
            var _local_4:int;
            _SafeStr_3740 = new _SafeStr_24();
            _SafeStr_4674 = _arg_1.readInteger();
            _description = _arg_1.readString();
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = _arg_1.readInteger();
                _local_5 = _arg_1.readString();
                _SafeStr_3740.add(_local_2, _local_5);
                _local_4++;
            };
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1181 = "_-L1N" (String#7943, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)


