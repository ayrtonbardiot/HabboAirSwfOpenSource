// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-3w._SafeStr_1091

package _-3w
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1091 implements IMessageParser 
    {

        private var _SafeStr_7067:Array;


        public function get occupiedTiles():Array
        {
            return (_SafeStr_7067);
        }

        public function flush():Boolean
        {
            _SafeStr_7067 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = _arg_1.readInteger();
                _local_5 = _arg_1.readInteger();
                _SafeStr_7067.push({
                    "x":_local_4,
                    "y":_local_5
                });
                _local_3++;
            };
            return (true);
        }


    }
}//package _-3w

// _SafeStr_1091 = "_-119" (String#6535, DoABC#3)
// _SafeStr_7067 = "_-bE" (String#9078, DoABC#3)


