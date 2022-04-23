// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1219

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1219 implements IMessageParser 
    {

        private var _SafeStr_4132:String;


        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function flush():Boolean
        {
            _SafeStr_4132 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4132 = _arg_1.readString();
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1219 = "_-y1C" (String#10581, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)


