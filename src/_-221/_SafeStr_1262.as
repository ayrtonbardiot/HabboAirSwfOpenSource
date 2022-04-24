// by nota

//_-221._SafeStr_1262

package _-221
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import _-61W._SafeStr_1595;

    [SecureSWF(rename="true")]
    public class _SafeStr_1262 implements IMessageParser 
    {

        private var _SafeStr_7023:int;
        private var _SafeStr_7024:Array;
        private var _SafeStr_7025:int;
        private var _SafeStr_7026:int;
        private var _SafeStr_7027:int;
        private var _SafeStr_7028:Array;
        private var _SafeStr_7029:int;
        private var _SafeStr_7030:int;


        public function get firstUserID():int
        {
            return (_SafeStr_7023);
        }

        public function get firstUserItemArray():Array
        {
            return (_SafeStr_7024);
        }

        public function get firstUserNumItems():int
        {
            return (_SafeStr_7025);
        }

        public function get firstUserNumCredits():int
        {
            return (_SafeStr_7026);
        }

        public function get secondUserID():int
        {
            return (_SafeStr_7027);
        }

        public function get secondUserItemArray():Array
        {
            return (_SafeStr_7028);
        }

        public function get secondUserNumItems():int
        {
            return (_SafeStr_7029);
        }

        public function get secondUserNumCredits():int
        {
            return (_SafeStr_7030);
        }

        public function flush():Boolean
        {
            _SafeStr_7023 = -1;
            _SafeStr_7024 = null;
            _SafeStr_7025 = 0;
            _SafeStr_7026 = 0;
            _SafeStr_7027 = -1;
            _SafeStr_7028 = null;
            _SafeStr_7029 = 0;
            _SafeStr_7030 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7023 = _arg_1.readInteger();
            _SafeStr_7024 = [];
            if (!parseItemData(_arg_1, _SafeStr_7024))
            {
                return (false);
            };
            _SafeStr_7025 = _arg_1.readInteger();
            _SafeStr_7026 = _arg_1.readInteger();
            _SafeStr_7027 = _arg_1.readInteger();
            _SafeStr_7028 = [];
            if (!parseItemData(_arg_1, _SafeStr_7028))
            {
                return (false);
            };
            _SafeStr_7029 = _arg_1.readInteger();
            _SafeStr_7030 = _arg_1.readInteger();
            return (true);
        }

        private function parseItemData(_arg_1:IMessageDataWrapper, _arg_2:Array):Boolean
        {
            var _local_3:int;
            _local_3 = _arg_1.readInteger();
            while (_local_3 > 0)
            {
                _arg_2.push(new _SafeStr_1595(_arg_1));
                _local_3--;
            };
            return (true);
        }


    }
}//package _-221

// _SafeStr_1262 = "_-f1G" (String#9330, DoABC#3)
// _SafeStr_1595 = "_-Wz" (String#8761, DoABC#3)
// _SafeStr_7023 = "_-wx" (String#10500, DoABC#3)
// _SafeStr_7024 = "_-uT" (String#10352, DoABC#3)
// _SafeStr_7025 = "_-Fp" (String#7579, DoABC#3)
// _SafeStr_7026 = "_-23" (String#6684, DoABC#3)
// _SafeStr_7027 = "_-Be" (String#7340, DoABC#3)
// _SafeStr_7028 = "_-c1u" (String#9128, DoABC#3)
// _SafeStr_7029 = "_-I1Q" (String#7725, DoABC#3)
// _SafeStr_7030 = "_-71s" (String#7031, DoABC#3)


