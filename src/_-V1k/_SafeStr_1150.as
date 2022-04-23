// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1150

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1150 implements IMessageParser 
    {

        private var _SafeStr_4999:int;
        private var _SafeStr_5000:int;
        private var _windowWidth:int;
        private var _SafeStr_5001:int;


        public function get windowX():int
        {
            return (_SafeStr_4999);
        }

        public function get windowY():int
        {
            return (_SafeStr_5000);
        }

        public function get windowWidth():int
        {
            return (_windowWidth);
        }

        public function get windowHeight():int
        {
            return (_SafeStr_5001);
        }

        public function flush():Boolean
        {
            _SafeStr_4999 = 0;
            _SafeStr_5000 = 0;
            _windowWidth = 0;
            _SafeStr_5001 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4999 = _arg_1.readInteger();
            _SafeStr_5000 = _arg_1.readInteger();
            _windowWidth = _arg_1.readInteger();
            _SafeStr_5001 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1150 = "_-NH" (String#8094, DoABC#3)
// _SafeStr_4999 = "_-L1X" (String#7948, DoABC#3)
// _SafeStr_5000 = "_-a1g" (String#8982, DoABC#3)
// _SafeStr_5001 = "_-A1e" (String#7228, DoABC#3)


