// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-kC._SafeStr_1500

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1500 implements IMessageParser 
    {

        private var _SafeStr_7358:int;
        private var _SafeStr_4258:int;


        public function get tokenCount():int
        {
            return (_SafeStr_7358);
        }

        public function get resultCode():int
        {
            return (_SafeStr_4258);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            _SafeStr_7358 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-kC

// _SafeStr_1500 = "_-Di" (String#7455, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_7358 = "_-x1Z" (String#10531, DoABC#3)


