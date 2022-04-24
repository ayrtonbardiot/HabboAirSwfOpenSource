// by nota

//_-3D._SafeStr_1068

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-41O._SafeStr_1650;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1068 implements IMessageParser 
    {

        private var _SafeStr_7063:Array;


        public function flush():Boolean
        {
            _SafeStr_7063 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7063.push(new _SafeStr_1650(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get prizes():Array
        {
            return (_SafeStr_7063);
        }


    }
}//package _-3D

// _SafeStr_1068 = "_-o1m" (String#9935, DoABC#3)
// _SafeStr_1650 = "_-OQ" (String#8179, DoABC#3)
// _SafeStr_7063 = "_-l1L" (String#9743, DoABC#3)


