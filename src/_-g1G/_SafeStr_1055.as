// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1055

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1055 implements IMessageParser 
    {

        private var _SafeStr_7236:Boolean = false;
        private var _SafeStr_7237:Boolean = false;
        private var _SafeStr_4261:int = 0;


        public function get notEnoughCredits():Boolean
        {
            return (_SafeStr_7236);
        }

        public function get notEnoughActivityPoints():Boolean
        {
            return (_SafeStr_7237);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function flush():Boolean
        {
            _SafeStr_7236 = false;
            _SafeStr_7237 = false;
            _SafeStr_4261 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7236 = _arg_1.readBoolean();
            _SafeStr_7237 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_4261 = _arg_1.readInteger();
            };
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1055 = "_-yp" (String#10648, DoABC#3)
// _SafeStr_4261 = "_-m1a" (String#9806, DoABC#3)
// _SafeStr_7236 = "_-Z1X" (String#8902, DoABC#3)
// _SafeStr_7237 = "_-FM" (String#7565, DoABC#3)


