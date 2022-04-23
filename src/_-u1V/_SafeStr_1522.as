// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-u1V._SafeStr_1522

package _-u1V
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1522 implements IMessageParser 
    {

        private var _SafeStr_7589:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7589 = _arg_1.readString();
            return (true);
        }

        public function get info():String
        {
            return (_SafeStr_7589);
        }


    }
}//package _-u1V

// _SafeStr_1522 = "_-BH" (String#7331, DoABC#3)
// _SafeStr_7589 = "_-cd" (String#9151, DoABC#3)


