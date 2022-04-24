// by nota

//_-rS._SafeStr_1138

package _-rS
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-Y12._SafeStr_1606;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1138 implements IMessageParser 
    {

        private var _SafeStr_6219:Vector.<_SafeStr_1606>;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_6219 = new Vector.<_SafeStr_1606>();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_6219.push(new _SafeStr_1606(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get giftOptions():Vector.<_SafeStr_1606>
        {
            return (_SafeStr_6219);
        }


    }
}//package _-rS

// _SafeStr_1138 = "_-Mj" (String#8038, DoABC#3)
// _SafeStr_1606 = "_-22U" (String#6669, DoABC#3)
// _SafeStr_6219 = "_-tI" (String#10278, DoABC#3)


