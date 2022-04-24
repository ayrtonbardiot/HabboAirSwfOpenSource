// by nota

//_-3D._SafeStr_1278

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-41O._SafeStr_1607;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1278 implements IMessageParser 
    {

        private var _SafeStr_5684:_SafeStr_1607;
        private var _SafeStr_6958:int;
        private var _SafeStr_6959:int;


        public function flush():Boolean
        {
            _SafeStr_5684 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:Boolean = _arg_1.readBoolean();
            if (_local_2)
            {
                _SafeStr_5684 = new _SafeStr_1607(_arg_1);
                _SafeStr_6958 = _arg_1.readInteger();
                _SafeStr_6959 = _arg_1.readInteger();
            };
            return (true);
        }

        public function get quest():_SafeStr_1607
        {
            return (_SafeStr_5684);
        }

        public function get easyQuestCount():int
        {
            return (_SafeStr_6958);
        }

        public function get hardQuestCount():int
        {
            return (_SafeStr_6959);
        }


    }
}//package _-3D

// _SafeStr_1278 = "_-rQ" (String#10156, DoABC#3)
// _SafeStr_1607 = "_-oH" (String#9950, DoABC#3)
// _SafeStr_5684 = "_-91m" (String#7172, DoABC#3)
// _SafeStr_6958 = "_-d1z" (String#9229, DoABC#3)
// _SafeStr_6959 = "_-K7" (String#7905, DoABC#3)


