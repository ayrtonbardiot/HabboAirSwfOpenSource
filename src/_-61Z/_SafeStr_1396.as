// by nota

//_-61Z._SafeStr_1396

package _-61Z
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-Go._SafeStr_1599;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1396 implements IMessageParser 
    {

        protected var _SafeStr_7117:Vector.<_SafeStr_1599>;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7117 = new Vector.<_SafeStr_1599>(0);
            var _local_2:int = 1;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7117.push(new _SafeStr_1599(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7117 = null;
            return (true);
        }

        public function getFurni():Vector.<_SafeStr_1599>
        {
            return (_SafeStr_7117);
        }


    }
}//package _-61Z

// _SafeStr_1396 = "_-S1i" (String#8416, DoABC#3)
// _SafeStr_1599 = "_-v1l" (String#10394, DoABC#3)
// _SafeStr_7117 = "_-8s" (String#7143, DoABC#3)


