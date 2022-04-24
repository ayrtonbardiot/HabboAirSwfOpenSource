// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1261

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1261 implements IMessageParser 
    {

        private var _SafeStr_8411:int;
        private var _SafeStr_5806:String;


        public function get resultType():int
        {
            return (_SafeStr_8411);
        }

        public function get messageText():String
        {
            return (_SafeStr_5806);
        }

        public function flush():Boolean
        {
            _SafeStr_8411 = -1;
            _SafeStr_5806 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8411 = _arg_1.readInteger();
            _SafeStr_5806 = _arg_1.readString();
            return (true);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1261 = "_-cj" (String#9155, DoABC#3)
// _SafeStr_5806 = "_-F1i" (String#7550, DoABC#3)
// _SafeStr_8411 = "_-qs" (String#10094, DoABC#3)


