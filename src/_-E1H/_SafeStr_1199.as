// by nota

//_-E1H._SafeStr_1199

package _-E1H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1199 implements IMessageParser 
    {

        private var _SafeStr_5434:int = 0;
        private var _SafeStr_5435:int = 0;
        private var _SafeStr_5436:int = 0;


        public function getCreditPrice():int
        {
            return (_SafeStr_5434);
        }

        public function getDucketPrice():int
        {
            return (_SafeStr_5435);
        }

        public function getPublishDucketPrice():int
        {
            return (_SafeStr_5436);
        }

        public function flush():Boolean
        {
            _SafeStr_5434 = 0;
            _SafeStr_5435 = 0;
            _SafeStr_5436 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5434 = _arg_1.readInteger();
            _SafeStr_5435 = _arg_1.readInteger();
            if (_arg_1.bytesAvailable > 0)
            {
                _SafeStr_5436 = _arg_1.readInteger();
            };
            return (true);
        }


    }
}//package _-E1H

// _SafeStr_1199 = "_-I1d" (String#7731, DoABC#3)
// _SafeStr_5434 = "_-Q1k" (String#8296, DoABC#3)
// _SafeStr_5435 = "_-P1y" (String#8250, DoABC#3)
// _SafeStr_5436 = "_-a1O" (String#8972, DoABC#3)


