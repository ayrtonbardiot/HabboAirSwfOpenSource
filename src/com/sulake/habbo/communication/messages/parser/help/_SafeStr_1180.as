// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1180

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1180 implements IMessageParser 
    {

        private var _SafeStr_8448:String;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8448 = _arg_1.readString();
            return (true);
        }

        public function get infoUrl():String
        {
            return (_SafeStr_8448);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1180 = "_-RA" (String#8366, DoABC#3)
// _SafeStr_8448 = "_-Vw" (String#8654, DoABC#3)


