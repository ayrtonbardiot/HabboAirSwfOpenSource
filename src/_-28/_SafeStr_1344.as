// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-28._SafeStr_1344

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1344 implements IMessageParser 
    {

        private var _SafeStr_5806:String = "";


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5806 = _arg_1.readString();
            return (true);
        }

        public function get messageText():String
        {
            return (_SafeStr_5806);
        }


    }
}//package _-28

// _SafeStr_1344 = "_-P1" (String#8223, DoABC#3)
// _SafeStr_5806 = "_-F1i" (String#7550, DoABC#3)


