// by nota

//_-11c._SafeStr_1380

package _-11c
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1380 implements IMessageParser 
    {

        private var _SafeStr_3890:Vector.<int>;
        private var _SafeStr_3891:Vector.<String>;


        public function flush():Boolean
        {
            _SafeStr_3890 = new Vector.<int>(0);
            _SafeStr_3891 = new Vector.<String>(0);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_3890.push(_arg_1.readInteger());
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_3891.push(_arg_1.readString());
                _local_3++;
            };
            return (true);
        }

        public function get figureSetIds():Vector.<int>
        {
            return (_SafeStr_3890);
        }

        public function get boundFurnitureNames():Vector.<String>
        {
            return (_SafeStr_3891);
        }


    }
}//package _-11c

// _SafeStr_1380 = "_-V1P" (String#8613, DoABC#3)
// _SafeStr_3890 = "_-f1m" (String#9347, DoABC#3)
// _SafeStr_3891 = "_-hu" (String#9510, DoABC#3)


