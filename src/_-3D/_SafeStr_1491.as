// by nota

//_-3D._SafeStr_1491

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-41O._SafeStr_1607;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1491 implements IMessageParser 
    {

        private var _SafeStr_6003:Array;


        public function flush():Boolean
        {
            _SafeStr_6003 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_6003.push(new _SafeStr_1607(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get quests():Array
        {
            return (_SafeStr_6003);
        }


    }
}//package _-3D

// _SafeStr_1491 = "_-v1B" (String#10381, DoABC#3)
// _SafeStr_1607 = "_-oH" (String#9950, DoABC#3)
// _SafeStr_6003 = "_-LL" (String#7968, DoABC#3)


