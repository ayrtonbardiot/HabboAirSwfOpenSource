// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1263

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1263 implements IMessageParser 
    {

        private var _SafeStr_7526:String;
        private var _SafeStr_4579:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7526 = _arg_1.readString();
            _SafeStr_4579 = _arg_1.readInteger();
            return (true);
        }

        public function get chatMessage():String
        {
            return (_SafeStr_7526);
        }

        public function get senderId():int
        {
            return (_SafeStr_4579);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1263 = "_-ox" (String#9966, DoABC#3)
// _SafeStr_4579 = "_-021" (String#6500, DoABC#3)
// _SafeStr_7526 = "_-ma" (String#9834, DoABC#3)


