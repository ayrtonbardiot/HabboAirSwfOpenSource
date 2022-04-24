// by nota

//_-MB._SafeStr_1358

package _-MB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-a1N._SafeStr_1610;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1358 implements IMessageParser 
    {

        private var _SafeStr_3734:int;
        private var _SafeStr_7394:Array;


        public function flush():Boolean
        {
            _SafeStr_3734 = 0;
            _SafeStr_7394 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_2:* = null;
            _SafeStr_3734 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = new _SafeStr_1610(_arg_1);
                _SafeStr_7394.push(_local_2);
                _local_4++;
            };
            return (true);
        }

        public function get outfits():Array
        {
            return (_SafeStr_7394);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }


    }
}//package _-MB

// _SafeStr_1358 = "_-d1l" (String#9221, DoABC#3)
// _SafeStr_1610 = "_-jW" (String#9638, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_7394 = "_-d1h" (String#9187, DoABC#3)


