// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-28._SafeStr_1407

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1407 implements IMessageParser 
    {

        private var _key:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _key = _arg_1.readString();
            return (true);
        }

        public function get key():String
        {
            return (_key);
        }


    }
}//package _-28

// _SafeStr_1407 = "_-U1C" (String#8546, DoABC#3)


