﻿// by nota

//_-u1V._SafeStr_1076

package _-u1V
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-l12._SafeStr_1593;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1076 implements IMessageParser 
    {

        private var _SafeStr_7588:_SafeStr_1593;


        public function flush():Boolean
        {
            _SafeStr_7588 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7588 = new _SafeStr_1593(_arg_1);
            return (true);
        }

        public function get def():_SafeStr_1593
        {
            return (_SafeStr_7588);
        }


    }
}//package _-u1V

// _SafeStr_1076 = "_-cv" (String#9162, DoABC#3)
// _SafeStr_1593 = "_-S8" (String#8433, DoABC#3)
// _SafeStr_7588 = "_-7p" (String#7059, DoABC#3)


