// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1391

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1391 implements IMessageParser 
    {

        private var _SafeStr_3693:int = 0;
        private var _roomName:String = "";


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            _roomName = _arg_1.readString();
            return (true);
        }

        public function getRoomId():int
        {
            return (_SafeStr_3693);
        }

        public function getRoomName():String
        {
            return (_roomName);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1391 = "_-224" (String#6659, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)


