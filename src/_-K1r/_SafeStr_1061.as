// by nota

//_-K1r._SafeStr_1061

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1061 implements IMessageParser 
    {

        private var _SafeStr_5115:Dictionary;


        public function flush():Boolean
        {
            if (_SafeStr_5115)
            {
                _SafeStr_5115 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_5115 = new Dictionary();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5115[_arg_1.readInteger()] = _arg_1.readString();
                _local_3++;
            };
            return (true);
        }

        public function get accounts():Dictionary
        {
            return (_SafeStr_5115);
        }


    }
}//package _-K1r

// _SafeStr_1061 = "_-lU" (String#9775, DoABC#3)
// _SafeStr_5115 = "_-fH" (String#9360, DoABC#3)


