// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1376

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1376 implements IMessageParser 
    {

        private var _SafeStr_4613:int;
        private var _SafeStr_8475:String;


        public function get questionId():int
        {
            return (_SafeStr_4613);
        }

        public function get answerText():String
        {
            return (_SafeStr_8475);
        }

        public function flush():Boolean
        {
            _SafeStr_4613 = -1;
            _SafeStr_8475 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4613 = _arg_1.readInteger();
            _SafeStr_8475 = _arg_1.readString();
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1376 = "_-Ny" (String#8125, DoABC#3)
// _SafeStr_4613 = "_-SG" (String#8440, DoABC#3)
// _SafeStr_8475 = "_-5g" (String#6924, DoABC#3)


