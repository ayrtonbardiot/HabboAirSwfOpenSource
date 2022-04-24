// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1370

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1370 implements IMessageParser 
    {

        public static const _SafeStr_8467:int = 0;
        public static const _SafeStr_8468:int = 1;
        public static const _SafeStr_8469:int = 2;
        public static const _SafeStr_8470:int = 3;
        public static const _SafeStr_8471:int = 4;
        public static const _SafeStr_8472:int = 5;

        private var _status:Array;


        public function flush():Boolean
        {
            _status = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _status = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _status.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }

        public function get status():Array
        {
            return (_status);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1370 = "_-TC" (String#8509, DoABC#3)
// _SafeStr_8467 = "_-616" (String#6940, DoABC#3)
// _SafeStr_8468 = "_-71a" (String#7023, DoABC#3)
// _SafeStr_8469 = "_-P1F" (String#8230, DoABC#3)
// _SafeStr_8470 = "_-p1N" (String#9983, DoABC#3)
// _SafeStr_8471 = "_-vT" (String#10417, DoABC#3)
// _SafeStr_8472 = "_-U7" (String#8567, DoABC#3)


