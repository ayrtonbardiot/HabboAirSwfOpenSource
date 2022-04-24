// by nota

//_-T1I._SafeStr_1053

package _-T1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1053 implements IMessageParser 
    {

        public static const _SafeStr_7550:int = 0;
        public static const _SafeStr_7551:int = 1;
        public static const _SafeStr_7552:int = 2;
        public static const _SafeStr_7553:int = 3;
        public static const _SafeStr_7554:int = 4;
        public static const _SafeStr_7555:int = 5;
        public static const _SafeStr_7556:int = 6;

        private var _SafeStr_7281:int;
        private var _SafeStr_4259:String;
        private var _SafeStr_4258:int;
        private var _SafeStr_7557:Array;
        private var _SafeStr_7558:Dictionary;


        public function flush():Boolean
        {
            _SafeStr_7557 = null;
            _SafeStr_7558 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_7281 = _arg_1.readInteger();
            _SafeStr_4259 = _arg_1.readString();
            _SafeStr_4258 = _arg_1.readInteger();
            _SafeStr_7557 = [];
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7557.push(_arg_1.readString());
                _local_2++;
            };
            _SafeStr_7558 = new Dictionary();
            _local_3 = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7558[_arg_1.readString()] = "";
                _local_2++;
            };
            return (true);
        }

        public function get goalId():int
        {
            return (_SafeStr_7281);
        }

        public function get goalCode():String
        {
            return (_SafeStr_4259);
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }

        public function get requiredFurnis():Array
        {
            return (_SafeStr_7557);
        }

        public function isMissing(_arg_1:String):Boolean
        {
            return (!(_SafeStr_7558[_arg_1] == null));
        }


    }
}//package _-T1I

// _SafeStr_1053 = "_-B0" (String#7300, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_4259 = "_-Y1y" (String#8856, DoABC#3)
// _SafeStr_7281 = "_-O1q" (String#8161, DoABC#3)
// _SafeStr_7550 = "_-fY" (String#9369, DoABC#3)
// _SafeStr_7551 = "_-gQ" (String#9426, DoABC#3)
// _SafeStr_7552 = "_-J1l" (String#7781, DoABC#3)
// _SafeStr_7553 = "_-lQ" (String#9773, DoABC#3)
// _SafeStr_7554 = "_-Y11" (String#8826, DoABC#3)
// _SafeStr_7555 = "_-S1N" (String#8406, DoABC#3)
// _SafeStr_7556 = "_-g1y" (String#9417, DoABC#3)
// _SafeStr_7557 = "_-a15" (String#8960, DoABC#3)
// _SafeStr_7558 = "_-kn" (String#9713, DoABC#3)


