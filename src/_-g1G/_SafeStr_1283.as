// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1283

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1289;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1283 implements IMessageParser 
    {

        private var _SafeStr_5428:_SafeStr_1289;
        private var _SafeStr_3865:Boolean;
        private var _SafeStr_3864:String;


        public function get root():_SafeStr_1289
        {
            return (_SafeStr_5428);
        }

        public function get newAdditionsAvailable():Boolean
        {
            return (_SafeStr_3865);
        }

        public function get catalogType():String
        {
            return (_SafeStr_3864);
        }

        public function flush():Boolean
        {
            _SafeStr_5428 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5428 = new _SafeStr_1289(_arg_1);
            _SafeStr_3865 = _arg_1.readBoolean();
            _SafeStr_3864 = _arg_1.readString();
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1283 = "_-VU" (String#8641, DoABC#3)
// _SafeStr_1289 = "_-H1D" (String#7664, DoABC#3)
// _SafeStr_3864 = "_-Qc" (String#8326, DoABC#3)
// _SafeStr_3865 = "_-8B" (String#7116, DoABC#3)
// _SafeStr_5428 = "_-L19" (String#7933, DoABC#3)


