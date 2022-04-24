// by nota

//_-l12._SafeStr_1554

package _-l12
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1554 
    {

        private var _SafeStr_7369:Boolean;
        private var _SafeStr_7248:int;
        private var _SafeStr_7367:Array = [];
        private var _SafeStr_3820:int;
        private var _SafeStr_7370:String;
        private var _SafeStr_7368:Array = [];
        private var _SafeStr_7371:int;
        private var _SafeStr_7372:int;

        public function _SafeStr_1554(_arg_1:IMessageDataWrapper)
        {
            var _local_4:int;
            var _local_2:int;
            super();
            _SafeStr_7369 = _arg_1.readBoolean();
            _SafeStr_7248 = _arg_1.readInteger();
            var _local_5:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_5)
            {
                _local_2 = _arg_1.readInteger();
                _SafeStr_7367.push(_local_2);
                _local_4++;
            };
            _SafeStr_7371 = _arg_1.readInteger();
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_7370 = _arg_1.readString();
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _SafeStr_7368.push(_arg_1.readInteger());
                _local_4++;
            };
            _SafeStr_7372 = _arg_1.readInteger();
        }

        public function get stuffTypeSelectionEnabled():Boolean
        {
            return (_SafeStr_7369);
        }

        public function get stuffTypeSelectionCode():int
        {
            return (_SafeStr_7372);
        }

        public function set stuffTypeSelectionCode(_arg_1:int):void
        {
            _SafeStr_7372 = _arg_1;
        }

        public function get furniLimit():int
        {
            return (_SafeStr_7248);
        }

        public function get stuffIds():Array
        {
            return (_SafeStr_7367);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get stringParam():String
        {
            return (_SafeStr_7370);
        }

        public function get intParams():Array
        {
            return (_SafeStr_7368);
        }

        public function get code():int
        {
            return (0);
        }

        public function get stuffTypeId():int
        {
            return (_SafeStr_7371);
        }

        public function getBoolean(_arg_1:int):Boolean
        {
            return (_SafeStr_7368[_arg_1] == 1);
        }


    }
}//package _-l12

// _SafeStr_1554 = "_-W1B" (String#8667, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_7248 = "_-61z" (String#6978, DoABC#3)
// _SafeStr_7367 = "_-HT" (String#7699, DoABC#3)
// _SafeStr_7368 = "_-GP" (String#7631, DoABC#3)
// _SafeStr_7369 = "_-m3" (String#9819, DoABC#3)
// _SafeStr_7370 = "_-11T" (String#6544, DoABC#3)
// _SafeStr_7371 = "_-D1g" (String#7430, DoABC#3)
// _SafeStr_7372 = "_-p1e" (String#9990, DoABC#3)


