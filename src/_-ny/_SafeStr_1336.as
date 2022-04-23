// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-ny._SafeStr_1336

package _-ny
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1336 implements IMessageParser 
    {

        private var _SafeStr_7456:int;
        private var _SafeStr_7457:int;
        private var _SafeStr_7458:int;


        public function get phoneStatusCode():int
        {
            return (_SafeStr_7456);
        }

        public function get collectionStatusCode():int
        {
            return (_SafeStr_7457);
        }

        public function get millisecondsToAllowProcessReset():int
        {
            return (_SafeStr_7458);
        }

        public function flush():Boolean
        {
            _SafeStr_7456 = -1;
            _SafeStr_7458 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7456 = _arg_1.readInteger();
            _SafeStr_7457 = _arg_1.readInteger();
            _SafeStr_7458 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-ny

// _SafeStr_1336 = "_-I18" (String#7715, DoABC#3)
// _SafeStr_7456 = "_-22s" (String#6680, DoABC#3)
// _SafeStr_7457 = "_-T1C" (String#8475, DoABC#3)
// _SafeStr_7458 = "_-N1n" (String#8076, DoABC#3)


