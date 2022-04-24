// by nota

//_-61T._SafeStr_1220

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1220 implements IMessageParser 
    {

        private var _SafeStr_7106:Boolean = false;
        private var _SafeStr_4968:Number = 1;
        private var _SafeStr_4967:Number = 1;


        public function get wallsHidden():Boolean
        {
            return (_SafeStr_7106);
        }

        public function get wallThicknessMultiplier():Number
        {
            return (_SafeStr_4968);
        }

        public function get floorThicknessMultiplier():Number
        {
            return (_SafeStr_4967);
        }

        public function flush():Boolean
        {
            _SafeStr_7106 = false;
            _SafeStr_4968 = 1;
            _SafeStr_4967 = 1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_7106 = _arg_1.readBoolean();
            var _local_3:int = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            if (_local_3 < -2)
            {
                _local_3 = -2;
            }
            else
            {
                if (_local_3 > 1)
                {
                    _local_3 = 1;
                };
            };
            if (_local_2 < -2)
            {
                _local_2 = -2;
            }
            else
            {
                if (_local_2 > 1)
                {
                    _local_2 = 1;
                };
            };
            _SafeStr_4968 = Math.pow(2, _local_3);
            _SafeStr_4967 = Math.pow(2, _local_2);
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1220 = "_-8q" (String#7141, DoABC#3)
// _SafeStr_4967 = "_-jc" (String#9646, DoABC#3)
// _SafeStr_4968 = "_-12O" (String#6570, DoABC#3)
// _SafeStr_7106 = "_-U1g" (String#8560, DoABC#3)


