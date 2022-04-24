// by nota

//_-z1k._SafeStr_1494

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1494 implements IMessageParser 
    {

        private var _SafeStr_4318:int;
        private var _SafeStr_7122:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4318 = _arg_1.readInteger();
            _SafeStr_7122 = _arg_1.readInteger();
            return (true);
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }

        public function get commandId():int
        {
            return (_SafeStr_7122);
        }


    }
}//package _-z1k

// _SafeStr_1494 = "_-cW" (String#9146, DoABC#3)
// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)
// _SafeStr_7122 = "_-m1G" (String#9797, DoABC#3)


