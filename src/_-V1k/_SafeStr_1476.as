﻿// by nota

//_-V1k._SafeStr_1476

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1476 implements IMessageParser 
    {

        private var _SafeStr_4132:String;
        private var _SafeStr_5275:String;


        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function flush():Boolean
        {
            _SafeStr_4132 = "";
            _SafeStr_5275 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4132 = _arg_1.readString();
            _SafeStr_5275 = _arg_1.readString();
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1476 = "_-1J" (String#6599, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)


