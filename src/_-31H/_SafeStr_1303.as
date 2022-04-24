// by nota

//_-31H._SafeStr_1303

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1642;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1303 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1642;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1642(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1642
        {
            return (_SafeStr_3740);
        }


    }
}//package _-31H

// _SafeStr_1303 = "_-bd" (String#9089, DoABC#3)
// _SafeStr_1642 = "_-U0" (String#8539, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


