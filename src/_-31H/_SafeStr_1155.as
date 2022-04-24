// by nota

//_-31H._SafeStr_1155

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1621;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1155 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1621;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_3740 = new _SafeStr_1621(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1621
        {
            return (_SafeStr_3740);
        }


    }
}//package _-31H

// _SafeStr_1155 = "_-V1V" (String#8618, DoABC#3)
// _SafeStr_1621 = "_-MK" (String#8026, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


