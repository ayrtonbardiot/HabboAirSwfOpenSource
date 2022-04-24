// by nota

//_-V1k._SafeStr_1432

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1432 implements IMessageParser 
    {

        private var _SafeStr_4994:Array;
        private var _SafeStr_7594:Boolean;
        private var _SafeStr_7595:int;


        public function get issues():Array
        {
            return (_SafeStr_4994);
        }

        public function get retryEnabled():Boolean
        {
            return (_SafeStr_7594);
        }

        public function get retryCount():int
        {
            return (_SafeStr_7595);
        }

        public function flush():Boolean
        {
            _SafeStr_4994 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_7:int;
            var _local_3:int;
            var _local_2:int;
            var _local_5:* = null;
            var _local_4:* = null;
            _SafeStr_4994 = [];
            var _local_6:int = _arg_1.readInteger();
            _local_7 = 0;
            while (_local_7 < _local_6)
            {
                _local_3 = _arg_1.readInteger();
                _local_2 = _arg_1.readInteger();
                _local_5 = _arg_1.readString();
                _local_4 = new _SafeStr_1616(_local_3, 0, 0, 0, 0, 0, 0, 0, null, 0, null, _local_2, _local_5, null, 0, []);
                _SafeStr_4994.push(_local_4);
                _local_7++;
            };
            _SafeStr_7594 = _arg_1.readBoolean();
            _SafeStr_7595 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1432 = "_-u2" (String#10331, DoABC#3)
// _SafeStr_1616 = "_-Jg" (String#7849, DoABC#3)
// _SafeStr_4994 = "_-XA" (String#8796, DoABC#3)
// _SafeStr_7594 = "_-rW" (String#10160, DoABC#3)
// _SafeStr_7595 = "_-q1m" (String#10061, DoABC#3)


