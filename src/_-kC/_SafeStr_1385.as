// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-kC._SafeStr_1385

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1385 implements IMessageParser 
    {

        private var _SafeStr_4258:int;
        private var _SafeStr_7356:int = -1;
        private var _SafeStr_7357:int = -1;
        private var _SafeStr_4314:int = -1;


        public function get result():int
        {
            return (_SafeStr_4258);
        }

        public function get offerId():int
        {
            return (_SafeStr_7356);
        }

        public function get newPrice():int
        {
            return (_SafeStr_7357);
        }

        public function get requestedOfferId():int
        {
            return (_SafeStr_4314);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            _SafeStr_7356 = _arg_1.readInteger();
            _SafeStr_7357 = _arg_1.readInteger();
            _SafeStr_4314 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-kC

// _SafeStr_1385 = "_-F1u" (String#7557, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_4314 = "_-Sa" (String#8451, DoABC#3)
// _SafeStr_7356 = "_-41m" (String#6831, DoABC#3)
// _SafeStr_7357 = "_-3G" (String#6766, DoABC#3)


