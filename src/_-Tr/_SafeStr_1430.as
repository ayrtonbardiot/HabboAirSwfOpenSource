// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Tr._SafeStr_1430

package _-Tr
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1586;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1430 implements IMessageParser 
    {

        private var _liftedRooms:Vector.<_SafeStr_1586>;


        public function flush():Boolean
        {
            _liftedRooms = new Vector.<_SafeStr_1586>();
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _liftedRooms.push(new _SafeStr_1586(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get liftedRooms():Vector.<_SafeStr_1586>
        {
            return (_liftedRooms);
        }


    }
}//package _-Tr

// _SafeStr_1430 = "_-ZN" (String#8938, DoABC#3)
// _SafeStr_1586 = "_-G1J" (String#7592, DoABC#3)


