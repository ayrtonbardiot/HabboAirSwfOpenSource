// by nota

//_-PB._SafeStr_1401

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1401 implements IMessageParser 
    {

        private var _SafeStr_5431:int;
        private var _SafeStr_5505:Array;
        private var _SafeStr_5506:Array;


        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get allCommands():Array
        {
            return (_SafeStr_5505);
        }

        public function get enabledCommands():Array
        {
            return (_SafeStr_5506);
        }

        public function flush():Boolean
        {
            _SafeStr_5431 = -1;
            _SafeStr_5505 = null;
            _SafeStr_5506 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_5431 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _SafeStr_5505 = [];
            while (_local_3-- > 0)
            {
                _SafeStr_5505.push(_arg_1.readInteger());
            };
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_5506 = [];
            while (_local_2-- > 0)
            {
                _SafeStr_5506.push(_arg_1.readInteger());
            };
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1401 = "_-KX" (String#7918, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_5505 = "_-Pq" (String#8279, DoABC#3)
// _SafeStr_5506 = "_-M1R" (String#8000, DoABC#3)


