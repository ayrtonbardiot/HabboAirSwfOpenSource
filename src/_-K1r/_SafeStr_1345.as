// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1r._SafeStr_1345

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1345 implements IMessageParser 
    {

        private var _SafeStr_3827:int;
        private var _SafeStr_3826:int;
        private var _isAmbassador:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3827 = _arg_1.readInteger();
            _SafeStr_3826 = _arg_1.readInteger();
            _isAmbassador = _arg_1.readBoolean();
            return (true);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get securityLevel():int
        {
            return (_SafeStr_3826);
        }

        public function get isAmbassador():Boolean
        {
            return (_isAmbassador);
        }


    }
}//package _-K1r

// _SafeStr_1345 = "_-f1r" (String#9348, DoABC#3)
// _SafeStr_3826 = "_-f1M" (String#9332, DoABC#3)
// _SafeStr_3827 = "_-81k" (String#7107, DoABC#3)


