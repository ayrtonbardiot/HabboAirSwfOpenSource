// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-E1H._SafeStr_1210

package _-E1H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1210 implements IMessageParser 
    {

        private var _SafeStr_5275:String;


        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function flush():Boolean
        {
            _SafeStr_5275 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5275 = _arg_1.readString();
            return (true);
        }


    }
}//package _-E1H

// _SafeStr_1210 = "_-t1m" (String#10260, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)


