// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1110

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-n1H._SafeStr_1628;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1110 implements IMessageParser 
    {

        private var _SafeStr_3693:int;
        private var _SafeStr_7459:Array;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_3693 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7459.push(new _SafeStr_1628(_arg_1));
                _local_2++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7459 = [];
            return (true);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get controllers():Array
        {
            return (_SafeStr_7459);
        }


    }
}//package _-Z1C

// _SafeStr_1110 = "_-Fl" (String#7578, DoABC#3)
// _SafeStr_1628 = "_-m19" (String#9794, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7459 = "_-e18" (String#9266, DoABC#3)


