// by nota

//_-a1d._SafeStr_1269

package _-a1d
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1269 implements IMessageParser 
    {

        private var _SafeStr_5449:Boolean;
        private var _SafeStr_5387:_SafeStr_1544;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5449 = _arg_1.readBoolean();
            if (_SafeStr_5449)
            {
                _SafeStr_5387 = new _SafeStr_1544(_arg_1);
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_5449 = false;
            return (true);
        }

        public function get success():Boolean
        {
            return (_SafeStr_5449);
        }

        public function get productData():_SafeStr_1544
        {
            return (_SafeStr_5387);
        }


    }
}//package _-a1d

// _SafeStr_1269 = "_-F1N" (String#7539, DoABC#3)
// _SafeStr_1544 = "_-F19" (String#7531, DoABC#3)
// _SafeStr_5387 = "_-z1a" (String#10665, DoABC#3)
// _SafeStr_5449 = "_-od" (String#9957, DoABC#3)


