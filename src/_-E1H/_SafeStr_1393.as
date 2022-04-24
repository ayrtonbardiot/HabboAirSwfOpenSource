// by nota

//_-E1H._SafeStr_1393

package _-E1H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1393 implements IMessageParser 
    {

        private var _SafeStr_7208:Boolean = false;
        private var _SafeStr_7211:int = 0;
        private var _SafeStr_6812:String;


        public function isOk():Boolean
        {
            return (_SafeStr_7208);
        }

        public function getSecondsToWait():int
        {
            return (_SafeStr_7211);
        }

        public function getExtraDataId():String
        {
            return (_SafeStr_6812);
        }

        public function flush():Boolean
        {
            _SafeStr_7208 = false;
            _SafeStr_7211 = 0;
            _SafeStr_6812 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7208 = _arg_1.readBoolean();
            _SafeStr_7211 = _arg_1.readInteger();
            if (((_SafeStr_7208) && (_arg_1.bytesAvailable)))
            {
                _SafeStr_6812 = _arg_1.readString();
            };
            return (true);
        }


    }
}//package _-E1H

// _SafeStr_1393 = "_-ld" (String#9779, DoABC#3)
// _SafeStr_6812 = "_-UK" (String#8577, DoABC#3)
// _SafeStr_7208 = "_-lb" (String#9778, DoABC#3)
// _SafeStr_7211 = "_-5V" (String#6919, DoABC#3)


