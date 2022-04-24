// by nota

//_-613._SafeStr_1454

package _-613
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1454 implements IMessageParser 
    {

        private var _SafeStr_3740:Array = [];


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_3740.push(new _SafeStr_1605(_arg_1.readByte(), _arg_1.readByte(), _arg_1.readInteger(), _arg_1.readString()));
                _local_3++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_3740 = [];
            return (true);
        }

        public function get data():Array
        {
            return (_SafeStr_3740);
        }

        public function set data(_arg_1:Array):void
        {
            _SafeStr_3740 = _arg_1;
        }


    }
}//package _-613

// _SafeStr_1454 = "_-Z1L" (String#8896, DoABC#3)
// _SafeStr_1605 = "_-61K" (String#6945, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


