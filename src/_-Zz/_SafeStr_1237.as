// by nota

//_-Zz._SafeStr_1237

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-b1c._SafeStr_1577;
    import _-b1c._SafeStr_1596;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1237 implements IMessageParser 
    {

        private var _SafeStr_5998:int;
        private var _pet1:_SafeStr_1577;
        private var _pet2:_SafeStr_1577;
        private var _SafeStr_5997:Array;
        private var _SafeStr_7894:int;


        public function flush():Boolean
        {
            _SafeStr_5998 = 0;
            if (_pet1)
            {
                _pet1.dispose();
                _pet1 = null;
            };
            if (_pet2)
            {
                _pet2.dispose();
                _pet2 = null;
            };
            for each (var _local_1:_SafeStr_1596 in _SafeStr_5997)
            {
                _local_1.dispose();
            };
            _SafeStr_5997 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_5998 = _arg_1.readInteger();
            _pet1 = new _SafeStr_1577(_arg_1);
            _pet2 = new _SafeStr_1577(_arg_1);
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_5997.push(new _SafeStr_1596(_arg_1));
                _local_2++;
            };
            _SafeStr_7894 = _arg_1.readInteger();
            return (true);
        }

        public function get nestId():int
        {
            return (_SafeStr_5998);
        }

        public function get pet1():_SafeStr_1577
        {
            return (_pet1);
        }

        public function get pet2():_SafeStr_1577
        {
            return (_pet2);
        }

        public function get rarityCategories():Array
        {
            return (_SafeStr_5997);
        }

        public function get resultPetType():int
        {
            return (_SafeStr_7894);
        }


    }
}//package _-Zz

// _SafeStr_1237 = "_-bp" (String#9094, DoABC#3)
// _SafeStr_1577 = "_-i10" (String#9515, DoABC#3)
// _SafeStr_1596 = "_-m1g" (String#9811, DoABC#3)
// _SafeStr_5997 = "_-m1K" (String#9800, DoABC#3)
// _SafeStr_5998 = "_-p1C" (String#9976, DoABC#3)
// _SafeStr_7894 = "_-g1e" (String#9401, DoABC#3)


