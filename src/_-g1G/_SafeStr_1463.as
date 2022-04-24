// by nota

//_-g1G._SafeStr_1463

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1463 implements IMessageParser 
    {

        private var _SafeStr_7247:int;
        private var _SafeStr_7248:int;
        private var _SafeStr_7249:int;
        private var _SafeStr_7250:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7247 = _arg_1.readInteger();
            _SafeStr_7248 = _arg_1.readInteger();
            _SafeStr_7249 = _arg_1.readInteger();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7250 = _arg_1.readInteger();
            }
            else
            {
                _SafeStr_7250 = _SafeStr_7247;
            };
            return (true);
        }

        public function get secondsLeft():int
        {
            return (_SafeStr_7247);
        }

        public function get furniLimit():int
        {
            return (_SafeStr_7248);
        }

        public function get maxFurniLimit():int
        {
            return (_SafeStr_7249);
        }

        public function get secondsLeftWithGrace():int
        {
            return (_SafeStr_7250);
        }


    }
}//package _-g1G

// _SafeStr_1463 = "_-GC" (String#7623, DoABC#3)
// _SafeStr_7247 = "_-xH" (String#10554, DoABC#3)
// _SafeStr_7248 = "_-61z" (String#6978, DoABC#3)
// _SafeStr_7249 = "_-Og" (String#8186, DoABC#3)
// _SafeStr_7250 = "_-716" (String#7011, DoABC#3)


