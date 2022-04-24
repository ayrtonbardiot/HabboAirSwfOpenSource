// by nota

//_-l1Q._SafeStr_1259

package _-l1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1259 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _text:String = "";
        private var _SafeStr_4130:Array;
        private var _SafeStr_4376:int = 0;
        private var _SafeStr_7384:int = -1;
        private var _SafeStr_5982:int = 0;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get links():Array
        {
            return (_SafeStr_4130);
        }

        public function get gesture():int
        {
            return (_SafeStr_4376);
        }

        public function get trackingId():int
        {
            return (_SafeStr_7384);
        }

        public function get styleId():int
        {
            return (_SafeStr_5982);
        }

        public function flush():Boolean
        {
            _SafeStr_4128 = 0;
            _text = "";
            _SafeStr_4376 = 0;
            _SafeStr_4130 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4128 = _arg_1.readInteger();
            _text = _arg_1.readString();
            _SafeStr_4376 = _arg_1.readInteger();
            _SafeStr_5982 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            if (_local_2 > 0)
            {
                _SafeStr_4130 = [];
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _SafeStr_4130.push([_arg_1.readString(), _arg_1.readString(), _arg_1.readBoolean()]);
                    _local_3++;
                };
            };
            _SafeStr_7384 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1Q

// _SafeStr_1259 = "_-D1h" (String#7431, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4130 = "_-q1K" (String#10045, DoABC#3)
// _SafeStr_4376 = "_-410" (String#6797, DoABC#3)
// _SafeStr_5982 = "_-AQ" (String#7283, DoABC#3)
// _SafeStr_7384 = "_-C1E" (String#7358, DoABC#3)


