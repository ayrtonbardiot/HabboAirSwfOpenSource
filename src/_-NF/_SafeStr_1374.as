// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1374

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1374 implements IMessageParser 
    {

        private var _SafeStr_5272:String;


        public function get link():String
        {
            return (_SafeStr_5272);
        }

        public function flush():Boolean
        {
            _SafeStr_5272 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5272 = _arg_1.readString();
            return (true);
        }


    }
}//package _-NF

// _SafeStr_1374 = "_-61m" (String#6971, DoABC#3)
// _SafeStr_5272 = "_-Bm" (String#7345, DoABC#3)


