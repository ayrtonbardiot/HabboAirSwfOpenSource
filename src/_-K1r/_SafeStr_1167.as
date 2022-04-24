// by nota

//_-K1r._SafeStr_1167

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1167 implements IMessageParser 
    {

        private var _SafeStr_7022:int;

        public function _SafeStr_1167()
        {
            _SafeStr_7022 = -1;
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7022 = _arg_1.readInteger();
            };
            return (true);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }


    }
}//package _-K1r

// _SafeStr_1167 = "_-pu" (String#10025, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)


