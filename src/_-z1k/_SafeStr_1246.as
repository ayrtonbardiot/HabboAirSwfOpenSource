// by nota

//_-z1k._SafeStr_1246

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1246 implements IMessageParser 
    {

        private var _SafeStr_4318:int;
        private var _SafeStr_4234:Number;


        public function flush():Boolean
        {
            _SafeStr_4318 = -1;
            _SafeStr_4234 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4318 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_4234 = (_local_2 / 100);
            return (true);
        }

        public function get height():Number
        {
            return (_SafeStr_4234);
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }


    }
}//package _-z1k

// _SafeStr_1246 = "_-uA" (String#10340, DoABC#3)
// _SafeStr_4234 = "_-z1j" (String#10673, DoABC#3)
// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)


